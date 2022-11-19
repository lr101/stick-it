import 'dart:io';
import 'dart:typed_data';
import 'package:buff_lisa/Files/DTOClasses/group.dart';
import 'package:buff_lisa/Files/restAPI.dart';
import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../Files/DTOClasses/mona.dart';
import '../Files/global.dart' as global;
import '../2_ScreenMaps/image_widget_logic.dart';
import '../Files/file_handler.dart';
import '../Files/DTOClasses/pin.dart';
import '../main.dart';

class ClusterNotifier extends ChangeNotifier {
  final FileHandler _offlineFileHandler = FileHandler(fileName: global.fileName);
  late  List<Group> _userGroups = [];
  late List<Mona> _offlinePins = [];
  Group? _lastSelected;

  ///cluster
  Map<Pin, Marker> _allMarkers = {};
  List<Marker> _shownMarkers = [];
  List<String> __filterUsernames = [];
  DateTime? __filterDateMax;
  DateTime? __filterDateMin;

  ///public Methods

  void addGroups(List<Group> groups) {
    for (Group group in groups) {
      if(!_userGroups.any((element) => element.groupId == group.groupId)) {
        _userGroups.add(group);
      }
    }
    notifyListeners();
  }

  void addGroup(Group group) {
    if(!_userGroups.any((element) => element.groupId == group.groupId)) {
      _userGroups.add(group);
    }
    notifyListeners();
  }

  void clearAll() {
    //TODO remove all offline pins too?
    _userGroups.clear();
    _offlinePins.clear();
    _shownMarkers.clear();
    _allMarkers.clear();
    __filterUsernames.clear();
    __filterDateMax = null;
    __filterDateMin = null;
    notifyListeners();
  }

  Group getGroupByGroupId(int groupId) {
    return _userGroups.firstWhere((element) => element.groupId == groupId);
  }

  void addPin(Pin pin, Group group)  {
    group.pins.add(pin);
    if (group.active) {
      _addPinToMarkers(pin, false, null, group);
    }
    _updateValues();
  }

  int getAllPoints() {
    int points = 0;
    for (Group group in _userGroups) {
      points += group.pins.length;
    }
    return points;
  }

  Future<void> activateGroup(Group group) async{
    if (!group.active) {
      //get pins from server of the specific groups if not already loaded
      if (!group.loaded) {
        group.pins = await RestAPI.fetchGroupPins(group);
        group.loaded = true;
      }
      //converts pins to markers on googel maps
      for (Pin pin in group.pins) {
        await _addPinToMarkers(pin, false, null, group);
      }
      //converts offline pins to markers if member of group
      for (Mona mona in _offlinePins) {
          await _addPinToMarkers(mona.pin, true, mona.image, group);
      }
      group.active = true;
      _updateValues();
    }
  }

  Future<void> deactivateGroup(Group group) async {
    if (group.active) {
      //removes markers from maps
      for (Pin pin in group.pins) {
         _removePinFromMarkers(pin);
      }
      //removes offline markers from maps
      for (Mona mona in _offlinePins) {
        if (mona.pin.group == group) {
          _removePinFromMarkers(mona.pin);
        }
      }
      group.active = false;
      _updateValues();
    }
  }

  void removePin(Pin pin) {
    Group group = _userGroups.firstWhere((element) => element == pin.group);
    group.pins.remove(pin);
    _removePinFromMarkers(pin);
    _updateValues();
    //await io.clusterHandler.updateValues();
  }

  List<Mona> getOfflinePins() {return _offlinePins;}

  Future<void> loadOfflinePins() async{
    List<Mona> monas = (await _offlineFileHandler.readFile(0, _userGroups)).map((e) => e as Mona).toList();
    for (Mona mona  in monas) {
      await _addOfflinePinToMarkers(mona, mona.pin.group);
    }
    _updateValues();
  }

  Future<void> deleteOfflinePin(Mona mona) async{
    _removeOfflinePinFromMarkers(mona);
    await _offlineFileHandler.saveList(_offlinePins, mona.pin.group.groupId);
    _updateValues();
  }

  Future<void> addOfflinePin(Mona mona) async{
    if (mona.pin.group.active) {
      await _addOfflinePinToMarkers(mona, mona.pin.group);
    }
    await _offlineFileHandler.saveList(_offlinePins, mona.pin.group.groupId);
    _updateValues();
  }


  List<Marker> get getMarkers {
    return _shownMarkers;
  }

  List<Group> get getGroups {
    return _userGroups;
  }

  Group? get getLastSelected {
    return _lastSelected;
  }

  Set<Group> get getActiveGroups {
    Set<Group> activeGroups = {};
    for (Group group in _userGroups) {
      if (group.active) activeGroups.add(group);
    }
    return activeGroups;
  }

  void setLastSelected(Group group) {
    _lastSelected = group;
    notifyListeners();
  }
  ///private Methods

  void setFilterDate(DateTime? filterDateMin, DateTime? filterDateMax) {
    __filterDateMin = filterDateMin;
    __filterDateMax = filterDateMax;
    _updateValues();
  }

  void setFilterUsername(List<String> usernames) {
    __filterUsernames = usernames;
    _updateValues();
  }

  Future<void> _addOfflinePinToMarkers(Mona mona, Group group) async{
    await _addPinToMarkers(mona.pin, true, mona.image, group);
    _offlinePins.add(mona);
    _updateValues();
  }

  void _removeOfflinePinFromMarkers(Mona mona) {
    _offlinePins.remove(mona);
    _removePinFromMarkers(mona.pin);
    _updateValues();
  }

  void _removePinFromMarkers(Pin pin) {
    _allMarkers.remove(pin);
  }


  _addPinToMarkers(Pin pin, bool newPin, Uint8List? image, Group group) {
    _allMarkers[pin] = (
      Marker(
          key: Key((newPin ? "new${pin.id.toString()}" : pin.id.toString())),
          point: LatLng(pin.latitude, pin.longitude), 
          builder: (_)  => GestureDetector(
            child: Image.memory(group.pinImage!),
            onTap: () => Navigator.push(
              navigatorKey.currentContext!,
              MaterialPageRoute(builder: (context) => ShowImageWidget(image: image, newPin: newPin, pin: pin,)),
            ),
          )
      )
    );
  }


  Future<void>  _updateValues() async {
    Map<Pin, Marker> mark = Map.from(_allMarkers);
    _filterMaxDate(mark);
    _filterMinDate(mark);
    _shownMarkers = List.from(mark.values);
    notifyListeners();
  }

  void _filterMinDate(Map<Pin, Marker> mark) {
    if (__filterDateMin == null) return;
    mark.removeWhere((k,v) => k.creationDate.isBefore(__filterDateMin!));
  }

  void _filterMaxDate(Map<Pin, Marker> mark) {
    if (__filterDateMax == null) return;
    mark.removeWhere((k,v) => k.creationDate.isAfter(__filterDateMax!));
  }
}
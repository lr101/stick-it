import 'package:buff_lisa/Files/DTOClasses/user.dart';
import 'package:flutter/cupertino.dart';

import '../Files/DTOClasses/pin.dart';
import '../Files/Other/global.dart' as global;

class UserNotifier with ChangeNotifier {

  final List<User> _users = [];

  User getUser(String userId) => _users.firstWhere((element) => element.userId == userId, orElse: () => _createUser(userId));

  Future<void> updatePins(String userId, List<Pin> pins) async {
    await getUser(userId).updatePins(pins);
    notifyListeners();
  }

  Future<void> updateProfileImage(String userId) async {
    await getUser(userId).profileImage.refresh();
    await getUser(userId).profileImageSmall.refresh();
    notifyListeners();
  }

  User _createUser(String userId) {
    User user = User(userId: userId);
    _users.add(user);
    return user;
  }

  Future<void> removePin(String userId, String id) async {
    await getUser(userId).removePin(id);
    notifyListeners();
  }

  Future<void> addPin(String userId, Pin pin) async {
    if (pin.creatorId == global.localData.userId) {
     await getUser(userId).addPin(pin);
     notifyListeners();
    }
  }

  void clearPinsNotUser(String userId) {
    _users.where((element) => element.userId != userId).forEach((element) {element.pins = null;});
    notifyListeners();
  }

  void removeUser(String userId) {
    _users.removeWhere((element) => element.userId == userId);
    notifyListeners();
  }
}
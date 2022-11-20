import 'dart:io';
import 'dart:typed_data';
import 'package:buff_lisa/2_ScreenMaps/image_widget_ui.dart';
import 'package:buff_lisa/Providers/cluster_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Files/DTOClasses/mona.dart';
import '../Files/DTOClasses/pin.dart';
import '../Files/restAPI.dart';
import '../Files/global.dart' as global;

class ShowImageWidget extends StatefulWidget {
  const ShowImageWidget({Key? key, required this.image, required this.pin, required this.newPin}) : super(key: key);

  final Uint8List? image;
  final bool newPin;
  final Pin pin;
  @override
  State<ShowImageWidget> createState() => ShowImageWidgetState();

}

class ShowImageWidgetState extends State<ShowImageWidget> {

  bool activeDelete = false;
  String username = "---";

  @override
  Widget build(BuildContext context) => ImageWidgetUI(state: this);

  /// Fetches the username of the creator during initialization
  @override
  void initState() {
    super.initState();
    username = widget.pin.username;
    if (username == global.username) {
      activeDelete = true;
    }
  }


  /// This method tries deleting the selected pin and goes back to the previous page if successful
  /// Works only if @activeDelete is true
  Future<void> handleButtonPress() async{
      if (activeDelete) {
        if (widget.newPin) {
          Pin mona =  Provider.of<ClusterNotifier>(context, listen: false).getOfflinePins().firstWhere((element) => element.id == widget.pin.id);
          await Provider.of<ClusterNotifier>(context, listen: false).deleteOfflinePin(mona);
        } else {
          bool deleted = await RestAPI.deleteMonaFromPinId(widget.pin.id);
          if (deleted && mounted) {
            Provider.of<ClusterNotifier>(context, listen: false).removePin(widget.pin);
          }
        }
        if (!mounted) return;
        Navigator.pop(context);
      }
  }

  /// This methods builds the image of the selected pin in a FutureBuilder
  /// Image can be an offline saved pin (@image not null) or dynamically loaded from server
  /// An CircularProgressIndicator is returned during the loading time
  Widget getImageWidget() {
    if (widget.image != null) {
      return Image.memory(widget.image!);
    }
    return FutureBuilder<Uint8List>(
      future: ClusterNotifier.getPinImage(widget.pin),
      builder: (context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.hasData) {
          return Image.memory(snapshot.data!);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
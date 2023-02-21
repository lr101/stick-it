import 'dart:typed_data';

import 'package:buff_lisa/9_Profile/ClickOnProfileImage/show_profile_image_ui.dart';
import 'package:buff_lisa/9_Profile/profile_image_ui.dart';
import 'package:flutter/cupertino.dart';

class ShowProfileImage extends StatefulWidget {
  const ShowProfileImage({super.key, required this.provide, required this.defaultImage, });

  final Future<Uint8List?> Function() provide;
  final Image defaultImage;

  @override
  ShowProfileImageState createState() => ShowProfileImageState();
}

class ShowProfileImageState extends State<ShowProfileImage>  {

  final TransformationController controller = TransformationController();

  @override
  Widget build(BuildContext context) => ShowProfileImageUI(state: this);



}
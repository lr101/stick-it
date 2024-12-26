import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/widgets/custom_marker/data/default_group_image.dart';
import 'package:buff_lisa/widgets/custom_marker/presentation/custom_marker_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class CustomMarkerWidget extends Marker {

  final LocalPinDto pinDto;
  final bool withAnimation;


  CustomMarkerWidget({required this.pinDto, this.withAnimation = false}) : super(
    point: LatLng(pinDto.latitude, pinDto.longitude),
    child: CustomMarkerContent(pinDto: pinDto, withAnimation: withAnimation),
    width: 80,
    height: 80
  );

}
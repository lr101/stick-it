import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/widgets/custom_marker/data/default_group_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class CustomMarkerWidget extends Marker {

  final LocalPinDto pinDto;
  final WidgetRef ref;


  CustomMarkerWidget({required this.pinDto, required this.ref}) : super(
    point: LatLng(pinDto.latitude, pinDto.longitude),
    child: ref.watch(groupPinImageByIdProvider(pinDto.groupId)).when(
      data: (data) => Image.memory(data ?? ref.read(defaultGroupPinImageProvider)),
      error: (e, s) => Image.memory(ref.read(defaultGroupPinImageProvider)),
      loading: () => Image.memory(ref.read(defaultGroupPinImageProvider)),
    )
  );

}

class CustomMarkerProvider extends Marker {

  final LocalPinDto pinDto;
  final Ref ref;


  CustomMarkerProvider({required this.pinDto, required this.ref}) : super(
      point: LatLng(pinDto.latitude, pinDto.longitude),
      child: ref.watch(groupPinImageByIdProvider(pinDto.groupId)).when(
        data: (data) => Image.memory(data ?? ref.read(defaultGroupPinImageProvider)),
        error: (e, s) => Image.memory(ref.read(defaultGroupPinImageProvider)),
        loading: () => Image.memory(ref.read(defaultGroupPinImageProvider)),
      )
  );

}
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/features/map_home/data/map_state.dart';
import 'package:buff_lisa/widgets/custom_marker/data/default_group_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class CustomMarkerContent extends ConsumerStatefulWidget {
  final LocalPinDto pinDto;
  final bool withAnimation;

  const CustomMarkerContent({
    Key? key,
    required this.pinDto,
    required this.withAnimation
  }) : super(key: key);

  @override
  _CustomMarkerContentState createState() => _CustomMarkerContentState();
}

class _CustomMarkerContentState extends ConsumerState<CustomMarkerContent> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Distance _distance = Distance();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isWithinDistance(Position userPosition) {
    return _distance.as(LengthUnit.Meter, LatLng(userPosition.latitude, userPosition.longitude),
        LatLng(widget.pinDto.latitude, widget.pinDto.longitude)) <= 50.0;
  }

  @override
  Widget build(BuildContext context) {
    final isInRange = ref.watch(currentLocationProvider.select((e) => e.whenOrNull(data: (data) => _isWithinDistance(data))));
    final markerImage = ref.watch(groupPinImageByIdProvider(widget.pinDto.groupId)).when(
      data: (data) => Image.memory(data ?? ref.read(defaultGroupPinImageProvider)),
      error: (e, s) => Image.memory(ref.read(defaultGroupPinImageProvider)),
      loading: () => Image.memory(ref.read(defaultGroupPinImageProvider)),
    );
    if (widget.withAnimation == false || isInRange == null) {
     return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: markerImage,
            height: 30,
            width: 30,
          ),
          SizedBox.square(dimension: 30)
        ],
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        if (isInRange)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final scale = _controller.value;
              return Container(
                width: 50 + scale * 50,
                height: 50 + scale * 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.tertiary.withOpacity(0.8 - (scale - 0.2)),
                ),
              );
            },
          ),
        SizedBox(
          child: markerImage,
          height: 30,
          width: 30,
        )
      ],
    );
  }
}

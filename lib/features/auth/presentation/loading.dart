import 'dart:async';

import 'package:buff_lisa/data/dto/offline_login_dto.dart';
import 'package:buff_lisa/data/service/offline_init_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../navigation/presentation/navigation.dart';

class Loading extends ConsumerStatefulWidget {
  const Loading({super.key});

  @override
  ConsumerState<Loading> createState() => _LoadingState();
}

class _LoadingState extends ConsumerState<Loading> with TickerProviderStateMixin  {

  late AnimationController _controller;
  bool determinate = false;
  LatLng? initCenter = null;

  @override
  void initState() {
    Timer(const Duration(seconds: 8, milliseconds: 50), () {});
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..addListener(() {
      setState(() {});
    });
    _controller.repeat();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if ((await Permission.accessMediaLocation.isGranted)) {
        final destLocation = await Geolocator.getCurrentPosition();
        initCenter = LatLng(destLocation.latitude, destLocation.longitude);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(offlineInitServiceProvider, (_, loadingState) {
      if (loadingState.loadedPins) finish();
    });
    OfflineLoginDto loadingState = ref.watch(offlineInitServiceProvider);
    if (!loadingState.loadedGroups) {
      ref.listen(userGroupServiceProvider, (_, groups) {
        for (var group in groups.value!) {
          ref.watch(pinServiceProvider(group.groupId));
        }
      });
    }
    return Dialog.fullscreen(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            Text(
              message(loadingState),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            LinearProgressIndicator(
              value: _controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  String message(OfflineLoginDto loadingState) {
    if (loadingState.loadedGroups && loadingState.loadedPins) {
      return "Creating map entries";
    } else if (loadingState.loadedGroups && loadingState.numberOfLoadedPinGroups != null) {
      return "Finished querying ${loadingState.numberOfLoadedPinGroups} group";
    } else if (loadingState.loadedGroups) {
      return "Loading ${loadingState.numberOfGroups} groups";
    } else {
      return "Loading offline groups";
    }

  }

  void finish() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Navigation(initCenter: initCenter,)
        ),
        ModalRoute.withName("/navbar")
    );
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

}
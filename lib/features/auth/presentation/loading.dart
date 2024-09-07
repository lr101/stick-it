import 'dart:async';

import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/service/global_data_service.dart';
import '../../navigation/presentation/navigation.dart';

class Loading extends ConsumerStatefulWidget {
  const Loading({super.key});

  @override
  ConsumerState<Loading> createState() => _LoadingState();
}

class _LoadingState extends ConsumerState<Loading> with TickerProviderStateMixin  {

  late AnimationController _controller;
  bool determinate = false;

  String offlineMessage = "Connecting to server";

  @override
  void initState() {
    Timer(const Duration(seconds: 8, milliseconds: 50), () {
      if(mounted) {
        setState(() {
          offlineMessage = "Logging in offline";
        });
      }
    });
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..addListener(() {
      setState(() {});
    });
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userGroupServiceProvider, (_,__) => finish());
    return Dialog.fullscreen(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
              'Loading your group information',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            LinearProgressIndicator(
              value: _controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
            const SizedBox(height: 10),
            Text(offlineMessage)
          ],
        ),
      ),
    );
  }

  void finish() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const Navigation()
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
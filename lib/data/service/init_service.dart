import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:openapi/api.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'init_service.g.dart';

@Riverpod(keepAlive: true)
class InitService extends _$InitService {
  @override
  Future<bool> build() async {
    if (await _requestPermission()) {
      final userId = ref.watch(userIdProvider);
      final userApi = ref.watch(userApiProvider);
      try {
        await FirebaseMessaging.instance.subscribeToTopic("info");
        final fcmToken = await FirebaseMessaging.instance.getToken();
        await userApi.updateUser(
            userId, UserUpdateDto(messagingToken: fcmToken));
        if (kDebugMode) print('messagingToken updated: $fcmToken');
      } catch (e) {
        if (kDebugMode) print('Error updating messagingToken: $e');
        return false;
      }
      return true;
    } else {
      return false;
    }

  }

  Future<bool> _requestPermission() async {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;

    final NotificationSettings settings = await messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return true;
    } else {
      return false;
    }
  }
}

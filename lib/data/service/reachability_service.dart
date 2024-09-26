
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/syncing_service_schedular.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reachability_service.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> reachabilityService(ReachabilityServiceRef ref) {
  return Stream<Future<bool>>.periodic(Duration(seconds: 10), (_) async {
    try {
      final result = await ref.watch(userApiProvider).getUser(ref.watch(globalDataServiceProvider).userId!);
      return result != null;
    } catch (e) {
      ref.read(syncingServiceSchedularProvider.notifier).setState(SyncingServiceSchedularState.offline);
      return false;
    }
  }).asyncMap((e) => e);
}

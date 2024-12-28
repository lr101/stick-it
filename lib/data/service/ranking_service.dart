
import 'package:buff_lisa/data/service/geojson_service.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/openapi_config.dart';

part 'ranking_service.g.dart';

@Riverpod(keepAlive: true)
class Top3GroupService extends _$Top3GroupService {

  @override
  Future<List<GroupRankingDtoInner>?> build() async {
    final district = ref.watch(districtServiceProvider);
    if (district == null) return null;
    return await ref.watch(rankingApiProvider).groupRanking(gid2: district.gid2, page: 0, size: 3);
  }
}
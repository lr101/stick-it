
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/features/ranking/data/ranking_state.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_scaffold.dart';
import 'package:buff_lisa/widgets/tiles/presentation/group_ranking_tile.dart';
import 'package:buff_lisa/widgets/tiles/presentation/user_ranking_tile.dart';
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:openapi/api.dart';

import '../../../data/service/geojson_service.dart';


class Ranking extends ConsumerStatefulWidget {
  const Ranking({super.key});

  @override
  ConsumerState<Ranking> createState() => _RankingState();
}

class _RankingState extends ConsumerState<Ranking> {

  final _pagingController = PagingController<int, dynamic>(firstPageKey: 0);

  static const int _pageSize = 40;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(updatePage);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(rankingMapProvider, (_, next) => _pagingController.refresh());
    ref.listen(rankingTypeProvider, (_, next) => _pagingController.refresh());
    final loc = ref.watch(districtServiceProvider);
    final map = ref.watch(rankingMapProvider);
    final type = ref.watch(rankingTypeProvider);
    return CustomScaffold(
        title: Text("Ranking"),
        boxes: [
         ListTile(
            title: Text("Change between country, state and city:"),
            subtitle: InlineChoice.single(
              clearable: false,
              itemCount: 4,
              itemBuilder: (state, index) => ChoiceChip(
                label: Text(getText(index, loc)),
                onSelected: (bool val) => val ? ref.read(rankingMapProvider.notifier).update(index) : null,
                selected: map == index,
              )
              ),
            ),
          ListTile(
            title: Text("Change between group and user:"),
            subtitle: InlineChoice.single(
                clearable: false,
                itemCount: 2,
                itemBuilder: (state, index) => ChoiceChip(
                  label: Text(index == 0 ? "Group" : "User"),
                  onSelected: (bool val) => val ? ref.read(rankingTypeProvider.notifier).update(index) : null,
                  selected: type == index,
                )
            ),
          )
        ],
        listBuilder: listBuilder,
        pagingController: _pagingController
    );
  }

  Widget listBuilder(BuildContext context, dynamic item, int index) {
    if (item is GroupRankingDtoInner) {
      return GroupRankingTile(groupDto: item);
    } else {
      return UserRankingTile(user: item as UserRankingDtoInner);
    }
  }

  Future<void> updatePage(int pageKey) async {
    try {
      final districts = ref.watch(districtServiceProvider);
      final type = ref.watch(rankingTypeProvider);
      final map = ref.watch(rankingMapProvider);
      if (districts == null) return;
      final gid0 = map == 0 ? districts.gid0 : null;
      final gid1 = map == 1 ? districts.gid1 : null;
      final gid2 = map == 2 ? districts.gid2! : null;
      List<dynamic>? items;
      if (type == 0) {
        items = await ref.watch(rankingApiProvider).groupRanking(gid0: gid0, gid1: gid1, gid2: gid2, page: pageKey, size: _pageSize);
      } else {
        items = await ref.watch(rankingApiProvider).userRanking(gid0: gid0, gid1: gid1, gid2: gid2, page: pageKey, size: _pageSize);
      }
      if (items == null) {
        _pagingController.error = "Ranking could not be fetched";
        return;
      }
      if (items.length < _pageSize) {
        _pagingController.appendLastPage(items);
      } else {
        _pagingController.appendPage(items, pageKey + 1);
      }
    } on ApiException catch(e) {
      _pagingController.error = e.message;
    }

  }

  String getText(int index, MapInfoDto? mapInfoDto) {
    switch (index) {
      case 0:
        return mapInfoDto?.name0 ?? "Country";
      case 1:
        return mapInfoDto?.name1 ?? "State";
      case 2:
        return mapInfoDto?.name2 ?? "Country/City";
      case 3:
        return "World";
      default:
        return "";
    }
  }
  
}
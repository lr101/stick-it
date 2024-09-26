import 'dart:async';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/group_overview/presentation/no_user_group_overview.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:openapi/api.dart';

import '../../../util/routing/routing.dart';
import '../../../widgets/tiles/presentation/group_tile.dart';
import '../../group_overview/presentation/sub_widgets/group_overview.dart';

class GroupSearch extends ConsumerStatefulWidget {
  const GroupSearch({super.key});

  @override
  ConsumerState<GroupSearch> createState() => _GroupSearchState();
}

class _GroupSearchState extends ConsumerState<GroupSearch> {
  final _pagingController =
      PagingController<int, LocalGroupDto>(firstPageKey: 0);

  final _textEditController = TextEditingController();

  static const int _pageSize = 40;

  Timer? _debounceTimer;

  String searchText = "";

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(updatePage);
    _textEditController.addListener(listener);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _pagingController.dispose();
    _textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold<LocalGroupDto>(
        title: SizedBox(
          height: 40,
        child: SearchBar(
            controller: _textEditController,
            leading: const Icon(Icons.search),
            trailing: <Widget>[
              Tooltip(
                message: 'Delete search term',
                child: IconButton(
                  onPressed: () => _textEditController.clear(),
                  icon: const Icon(Icons.delete),
                ),
              )
            ],
          ),
        ),
        listBuilder: (context, item, index) => GroupTile(groupDto: item, onTap: () => Routing.to(context, NoUserGroupOverview(groupId: item.groupId)),),
        pagingController: _pagingController);
  }

  Future<void> updatePage(int pageKey) async {
    final groups = await ref.watch(groupApiProvider).getGroupsByIds(
        search: _textEditController.text,
        withUser: false,
        userId: ref.watch(globalDataServiceProvider).userId!,
        page: pageKey,
        size: _pageSize,
        withImages: true);
    if (groups == null) {
      _pagingController.error = "Groups could not be fetched";
      return;
    }
    final groupDtos = groups.items.map((e) => LocalGroupDto.fromDto(e)).toList();
    if (groupDtos.length < _pageSize) {
      _pagingController.appendLastPage(groupDtos);
    } else {
      _pagingController.appendPage(groupDtos, pageKey + 1);
    }
  }

  void listener() {
    if (_textEditController.text != searchText) {
      searchText = _textEditController.text;
      if (_debounceTimer?.isActive ?? false) {
        _debounceTimer?.cancel();
      }
      _debounceTimer = Timer(const Duration(seconds: 1), () {
        _pagingController.refresh();
      });
    }
  }
}

import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/dto/pin_dto.dart';
import '../../../widgets/custom_feed/presentation/custom_feed.dart';

class UserImageFeed extends ConsumerWidget {

  const UserImageFeed({super.key, required this.index, required this.userId});

  final int index;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User images"),
      ),
        body: ref.read(sortedUserPinsProvider).when(
              data: (data) => CustomFeed(
                  pinProvider: sortedUserPinsProvider,
                  index: index,
                  pagingController: PagingController.fromValue(
                      PagingState<int, LocalPinDto>(
                          nextPageKey: index + 1,
                          itemList: data.getRange(0, index + 1).toList()),
                      firstPageKey: 0)),
              error: (error, stackTrace) => Icon(Icons.error),
              loading: () => Center(child: CircularProgressIndicator()),
            ));
  }
}

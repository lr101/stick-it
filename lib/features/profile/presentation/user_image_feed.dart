import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/dto/pin_dto.dart';
import '../../../widgets/custom_feed/presentation/custom_feed.dart';

class UserImageFeed extends ConsumerWidget {

  const UserImageFeed({super.key, required this.index, required this.userId, required this.userPinNotifier});

  final int index;
  final String userId;
  final AutoDisposeFutureProvider<List<LocalPinDto>> userPinNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User images"),
      ),
        body: ref.read(userPinNotifier).when(
              data: (data) => CustomFeed(
                  pinProvider: userPinNotifier,
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

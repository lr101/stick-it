import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/custom_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ActiveGroupFeed extends ConsumerStatefulWidget {
  const ActiveGroupFeed({super.key});

  @override
  ConsumerState<ActiveGroupFeed> createState() => _ActiveGroupFeedState();
}

class _ActiveGroupFeedState extends ConsumerState<ActiveGroupFeed> with AutomaticKeepAliveClientMixin {
  final PagingController<int, LocalPinDto> _pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 5);

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ref.listen(sortedActivatedPinsProvider, (previous, next) => next.whenOrNull(data: (data) => _pagingController.refresh()));
    return Scaffold(
      body: CustomFeed(pinProvider: sortedActivatedPinsProvider, pagingController: _pagingController),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

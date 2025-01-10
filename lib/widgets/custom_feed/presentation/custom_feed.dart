import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'feed_card.dart';

class CustomFeed extends ConsumerStatefulWidget {
  const CustomFeed({super.key, required this.pinProvider, this.index, required this.pagingController});

    final AutoDisposeFutureProvider<List<LocalPinDto>?> pinProvider;
  final PagingController<int, LocalPinDto> pagingController;
  final int? index;

  @override
  ConsumerState<CustomFeed> createState() => _CustomFeedState();
}

class _CustomFeedState extends ConsumerState<CustomFeed> {
  ScrollController scrollController = ScrollController();

  static const int _pageSize = 3;


  List<LocalPinDto> _pins = [];



  @override
  void initState() {
    super.initState();
    widget.pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(widget.pinProvider).whenData((data) => _pins = data ?? []);
      if (widget.index != null) {
        double maxWidth = MediaQuery.of(context).size.width;
        double maxHeight =MediaQuery.of(context).size.height;
        if (maxWidth / maxHeight > 3 / 4) {
          maxWidth = maxHeight * 3 / 4;
        } else {
          maxHeight = maxWidth * 4 / 3;
        }
        scrollController.jumpTo(maxHeight * widget.index!);
      } else {
        widget.pagingController.refresh();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(widget.pinProvider, (previous, next) {
      _pins = next.value ?? [];
      widget.pagingController.refresh();
    });
    return PagedListView<int, LocalPinDto>(
      pagingController: widget.pagingController,
      addAutomaticKeepAlives: false,
      scrollController: scrollController,
      builderDelegate: PagedChildBuilderDelegate<LocalPinDto>(
        animateTransitions: true,
        itemBuilder: (context, item, index) => ProviderScope(
            child: FeedCard(item: item)
        ),
      ),
    );
  }

  Future<void> _fetchPage(pageKey, {pageSize = _pageSize}) async {
    try {
      int end;
      if (pageKey + pageSize > _pins.length) {
        end = _pins.length;
      } else {
        end = pageKey + pageSize;
      }
      final idList = _pins.getRange(pageKey, end).toList();
      for (var pin in idList) {
        ref.watch(getPinImageAndFetchProvider(pin.id));
      }
      if (end == _pins.length) {
        widget.pagingController.appendLastPage(idList);
      } else {
        widget.pagingController.appendPage(idList, pageKey + pageSize);
      }
    } catch (error) {
      widget.pagingController.error = error;
    }
  }
}

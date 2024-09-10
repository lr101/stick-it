import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/widgets/pin_header/presentation/pin_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Feed extends ConsumerStatefulWidget {
  const Feed({super.key});

  @override
  ConsumerState<Feed> createState() => _FeedState();
}

class _FeedState extends ConsumerState<Feed> {

  final _pagingController = PagingController<int, LocalPinDto>(firstPageKey: 0);

  final int _pageSize = 18;

  List<LocalPinDto> _images = [];

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _images = ref.watch(sortedActivatedPinsProvider);
      _pagingController.refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(sortedActivatedPinsProvider, (_, next) {
      _images = next;
      _pagingController.refresh();
    });
    return Scaffold(
      body: PagedListView<int, LocalPinDto> (
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<LocalPinDto>(
              itemBuilder: (context, item, index) => Column(
                children: [
                  PinHeader(pinDto: item),
                  ref.watch(GetPinImageProvider(item.id)).when(data: (data) => data == null ? Icon(Icons.error) : Image.memory(data, fit: BoxFit.cover), error: (_, __,) => Icon(Icons.error), loading: () => CircularProgressIndicator()),
                ],
              ),
            )
        )
    );
  }

  Future<void> _fetchPage(pageKey) async {
    try {
      int end;
      if (pageKey + _pageSize > _images.length) {
        end = _images.length;
      } else {
        end = pageKey + _pageSize;
      }
      final idList = _images.getRange(pageKey, end).toList();
      ref.read(pinImageServiceProvider.notifier).addImages(idList.map((e) => e.id).toList());
      if (end == _images.length) {
        _pagingController.appendLastPage(idList);
      } else {
        _pagingController.appendPage(idList, pageKey + _pageSize);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

}
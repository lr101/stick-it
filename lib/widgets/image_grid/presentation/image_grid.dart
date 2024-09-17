import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/square_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:openapi/api.dart';

class ImageGrid extends ConsumerStatefulWidget {
  const ImageGrid({super.key, required this.pinProvider, required this.onTab});

  final AutoDisposeProvider<AsyncValue<List<LocalPinDto>>> pinProvider;
  final Function(int index) onTab;


  @override
  ConsumerState<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends ConsumerState<ImageGrid> {
  PagingController<int, LocalPinDto> _pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 10);

  final int _pageSize = 18;

  List<LocalPinDto> _images = [];

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(widget.pinProvider).when(
        data: (data) {
          _images = data;
          return PagedGridView<int, LocalPinDto>(
            pagingController: _pagingController,
            showNewPageProgressIndicatorAsGridChild: false,
            builderDelegate: PagedChildBuilderDelegate<LocalPinDto>(
              itemBuilder: (context, item, index) => SquareImage(pinId: item.id, index: index, groupId: item.groupId, onTap: widget.onTab,),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0),
          );
          },
        error: (_,__) => const SizedBox(),
        loading: () => Center(child: const SizedBox(width: 75, height: 75, child: const CircularProgressIndicator()))
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

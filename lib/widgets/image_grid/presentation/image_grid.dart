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
  const ImageGrid({super.key, required this.groupId});

  final String groupId;


  @override
  ConsumerState<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends ConsumerState<ImageGrid> {
  PagingController<int, String> _pagingController =
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
    return ref.watch(pinServiceProvider(widget.groupId)).when(
        data: (data) {
          _images = data;
          return PagedGridView<int, String>(
            pagingController: _pagingController,
            showNewPageProgressIndicatorAsGridChild: false,
            builderDelegate: PagedChildBuilderDelegate<String>(
              itemBuilder: (context, item, index) => SquareImage(pinId: item),
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
      final idList = _images.getRange(pageKey, end).map((e) => e.id).toList();
      ref.read(pinImageServiceProvider.notifier).addImages(idList);
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

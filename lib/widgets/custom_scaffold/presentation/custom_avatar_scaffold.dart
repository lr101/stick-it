import 'dart:typed_data';

import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAvatarScaffold extends ConsumerStatefulWidget {
  const CustomAvatarScaffold(
      {super.key,
      required this.avatar,
      required this.title,
      required this.boxes,
      this.bottom,
      required this.body});

  final AsyncValue<Uint8List?> avatar;
  final String title;
  final List<SliverToBoxAdapter> boxes;
  final Widget body;
  final PreferredSizeWidget? bottom;

  @override
  ConsumerState<CustomAvatarScaffold> createState() =>
      _CustomAvatarScaffoldState();
}

class _CustomAvatarScaffoldState extends ConsumerState<CustomAvatarScaffold>
    with TickerProviderStateMixin {
  ScrollController controller = ScrollController();
  ValueNotifier<double> _scrollOffset = ValueNotifier(0);
  static const double expandedHeight = 250;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      _scrollOffset.value = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          controller: controller,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                    pinned: true,
                    expandedHeight: expandedHeight,
                    flexibleSpace: FlexibleSpaceBar(
                      expandedTitleScale: 1.5,
                      centerTitle: true,
                      title: ValueListenableBuilder<double>(
                          valueListenable: _scrollOffset,
                          builder: (context, scrollOffset, child) {
                            // Define the maximum and minimum size of the image
                            double maxImageSize =
                                40.0; // Max size when expanded
                            double minImageSize =
                                20.0; // Min size when collapsed

                            // Calculate the size of the image based on the scroll offset
                            double imageSize = (maxImageSize -
                                    (scrollOffset / expandedHeight) *
                                        (maxImageSize - minImageSize))
                                .clamp(minImageSize, maxImageSize);

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 70 - imageSize),
                                    RoundImage(
                                      imageCallback: widget.avatar,
                                      size: imageSize,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      widget.title,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 35,
                                )
                              ],
                            );
                          }),
                      collapseMode: CollapseMode.pin,
                    ),
                    bottom: widget.bottom),
                ...widget.boxes
              ],
          body: widget.body),
    );
  }
}

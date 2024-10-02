import 'dart:typed_data';

import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/widgets/custom_marker/data/default_group_image.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomAvatarScaffold extends ConsumerStatefulWidget {
  const CustomAvatarScaffold(
      {super.key,
      required this.avatar,
      required this.title,
      this.boxes,
      this.bottom,
      this.actions,
      this.floatingActionButton,
      required this.body});

  final AsyncValue<Uint8List?> avatar;
  final String title;
  final List<SliverToBoxAdapter>? boxes;
  final Widget body;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  @override
  ConsumerState<CustomAvatarScaffold> createState() =>
      _CustomAvatarScaffoldState();
}

class _CustomAvatarScaffoldState extends ConsumerState<CustomAvatarScaffold>
    with TickerProviderStateMixin {
  ScrollController controller = ScrollController();
  ValueNotifier<double> _scrollOffset = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      body: NestedScrollView(
        controller: controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
              pinned: true,
              actions: widget.actions,
              expandedHeight: width,
              centerTitle: false,
              title: Text(widget.title),
              flexibleSpace: SafeArea(child: Padding(
                padding: EdgeInsets.symmetric(vertical: kToolbarHeight, horizontal: 10),
                child: RoundImage(imageCallback: widget.avatar, size: width - (widget.bottom == null ? 1 : 2) * kToolbarHeight,))),
              bottom: widget.bottom),
          ...?widget.boxes
        ],
        body: widget.body,
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }
}

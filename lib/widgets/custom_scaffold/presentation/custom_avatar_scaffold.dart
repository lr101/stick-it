import 'dart:typed_data';

import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAvatarScaffold extends ConsumerStatefulWidget {
  const CustomAvatarScaffold(
      {super.key,
      required this.avatar,
      required this.title,
      this.boxes,
      this.bottom,
      this.actions,
      this.floatingActionButton,
      this.profileQuickViewBoxes,
      this.hasBackButton = true,
      required this.body,});

  final AsyncValue<Uint8List?> avatar;
  final Widget title;
  final List<SliverToBoxAdapter>? boxes;
  final Widget body;
  final PreferredSizeWidget? bottom;
  final Widget? profileQuickViewBoxes;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool hasBackButton;

  @override
  ConsumerState<CustomAvatarScaffold> createState() =>
      _CustomAvatarScaffoldState();
}

class _CustomAvatarScaffoldState extends ConsumerState<CustomAvatarScaffold>
    with TickerProviderStateMixin {
  ScrollController controller = ScrollController();

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
    final double leftPadding = widget.hasBackButton ? 66.0 : 16.0;
    return Scaffold(
      body: NestedScrollView(
        controller: controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
              floating: true,
              actions: widget.actions,
              expandedHeight: (width / 2) + kToolbarHeight + 20,
              centerTitle: false,
              title: widget.title,
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                    child: Padding(
                        padding: EdgeInsets.only(left: leftPadding, top: 10, right: 10), child: Row(
                        children: [
                          RoundImage(
                            imageCallback: widget.avatar,
                            size: (width/4) - 20,
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(width: MediaQuery.of(context).size.width - width/2 - leftPadding - 10, height: (width/2) - leftPadding - 10, child: widget.profileQuickViewBoxes ?? const SizedBox.shrink()),
                ],),),),
              ),
              bottom: widget.bottom,),
          ...?widget.boxes,
        ],
        body: widget.body,
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomScaffold<T> extends ConsumerWidget {

  final double? headerHeight;
  final Widget title;
  final Widget? flexibleSpace;
  final List<Widget> boxes;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final ItemWidgetBuilder listBuilder;
  final PagingController pagingController;

  CustomScaffold({
    required this.title,
    required this.listBuilder,
    required this.pagingController,
    this.boxes = const [],
    this.flexibleSpace,
    this.actions,
    this.bottom,
    this.headerHeight,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: false,
            actions: actions,
            title: title,
            expandedHeight: headerHeight,
            flexibleSpace: flexibleSpace != null ? SafeArea(child: flexibleSpace!) : null,
            bottom: bottom,
          ),
          ...boxes.map((e) => SliverToBoxAdapter(child: e)).toList(),
          PagedSliverList(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<T>(
                animateTransitions: false,
                itemBuilder: listBuilder
            ),
          )
        ],
      ),
    );
  }
}

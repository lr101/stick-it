import 'package:buff_lisa/Files/Themes/custom_theme.dart';
import 'package:buff_lisa/Files/Widgets/CustomSliverList/custom_easy_title.dart';
import 'package:buff_lisa/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:measured_size/measured_size.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class CustomSliverList extends StatefulWidget {
  final PagingController<dynamic, Widget>? pagingController;
  final Future<bool?> Function()? initPagedList;
  final List<Widget>? items;
  final int? itemCount;
  final Widget Function(int index)? itemBuilder;

  const CustomSliverList({
    super.key,
    this.pagingController,
    this.itemCount,
    this.itemBuilder,
    this.initPagedList,
    this.items
  }) : assert(pagingController != null || (itemCount != null && itemBuilder != null) || items != null);

  @override
  CustomSliverListState createState() => CustomSliverListState();
}

class CustomSliverListState extends State<CustomSliverList> {



  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: Provider.of<ThemeNotifier>(context).getTheme.canvasColor,
          child:CustomScrollView(
          slivers: [
            SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            FutureBuilder<bool?>(
              future: refreshList(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
                } else {
                  return _list();
                }
              },
            )
          ],
        )
      )
    );
  }

  Widget _list() {
    if (widget.pagingController != null) {
      return PagedSliverList(
        pagingController: widget.pagingController!,
        builderDelegate: PagedChildBuilderDelegate<Widget>(
            animateTransitions: false,
            itemBuilder: (context, item, index)  => item
        ),
      );
    } else if (widget.items != null) {
      return SliverList(
        delegate: SliverChildListDelegate.fixed(widget.items!),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => widget.itemBuilder!(index),
          childCount: widget.itemCount!
        ),
      );
    }
  }

  Future<bool?> refreshList() {
    final result = widget.initPagedList != null
        ? widget.initPagedList!()
        : Future(() => true);
    if (widget.pagingController != null) {
      widget.pagingController!.refresh();
    } else {
      setState(() {});
    }
    return result;
  }
}
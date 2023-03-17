import 'package:flutter/material.dart';
import 'package:measured_size/measured_size.dart';
import 'package:provider/provider.dart';

import '../../../Providers/theme_provider.dart';
import '../../Themes/custom_theme.dart';

class CustomEasyTitle extends SliverAppBar {
  const CustomEasyTitle({
    super.key,
    this.back = true,
    this.left,
    this.right,
    this.child,
    title,
    this.customBackground = const SizedBox.shrink()
  }) : super (title: title);

  final bool back;
  final CustomEasyAction? left;
  final CustomEasyAction? right;
  final Widget? child;
  final Widget customBackground;

  @override
  CustomEasyTitleState createState() => CustomEasyTitleState();
}

class CustomEasyTitleState extends State<CustomEasyTitle> {

  final GlobalKey _childKey = GlobalKey();
  bool isHeightCalculated = false;
  late double height;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: widget.title,
      backgroundColor: Color.alphaBlend(CustomTheme.grey, Provider.of<ThemeNotifier>(context).getTheme.canvasColor),
      leading: _left(),
      pinned: true,
      actions: [_right()],
      expandedHeight:  isHeightCalculated ? height : 0,
        flexibleSpace: FlexibleSpaceBar(
            stretchModes: const <StretchMode>[
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            background: Wrap(
              alignment: WrapAlignment.center,
              children: [
                MeasuredSize(
                  child: Container(
                    color: Color.alphaBlend(CustomTheme.grey, Provider.of<ThemeNotifier>(context).getTheme.canvasColor),
                    child:Column(
                        key:  _childKey,
                        children: [
                          const SizedBox(height: 48,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: widget.customBackground,
                          ),
                        ]),),
                  onChange: (Size size) {
                    setState(() {
                      height = (_childKey.currentContext?.findRenderObject() as RenderBox).size.height;
                      height = height == 68.0 ? 0 : height;
                      isHeightCalculated = true;
                    });
                  },
                ),
              ],
            )
        )
    );
  }

  Widget _left() {
    if (widget.back) {
      return IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back)
      );
    } else if (!widget.back && widget.left != null) {
      return  _action(widget.left!);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _right() {
    if (widget.right != null) {
      return _action(widget.right!);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _action(CustomEasyAction action) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
              )
          )
      ),
      onPressed: () async {
        if (action.action != null && !action.loading) {
          try {
            setState(() {
              action.loading = true;
            });
            await action.action!();
            setState(() {
              action.loading = false;
            });
          } finally {
            action.loading = false;
          }
        }
      },
      child: action.loading ? const CircularProgressIndicator() : SizedBox.square(dimension: 48, child: Center (child: action.child)),
    );
  }
}

class CustomEasyAction {

  CustomEasyAction({required this.child, this.action});

  final Widget child;
  final Future<void> Function()? action;
  bool loading = false;
}
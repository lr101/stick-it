import 'package:buff_lisa/Files/Themes/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLayer extends StatelessWidget {
  const CustomLayer({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    FlutterMapState.maybeOf(context);
    return LayoutBuilder(builder: (context, p1) =>  Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: CustomTheme.grey.withOpacity(0.5),
          height: height,
          child: GestureDetector(
            onTap: () => launchUrl(Uri.parse("https://www.openstreetmap.org/copyright"),mode: LaunchMode.externalApplication),
            child: const Text(
              " \u00a9 OpenStreetMap ",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 12
              ),
            ),
          ),
        ),
      )
    );
  }
}
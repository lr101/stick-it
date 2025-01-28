import 'package:buff_lisa/features/web/presentation/show_web.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:flutter/material.dart';

class OsmCopyright extends StatelessWidget {
  const OsmCopyright({super.key});


  @override
  Widget build(BuildContext context) {
      return Align(
      alignment: Alignment.bottomLeft,
        child: Padding(padding: const EdgeInsets.all(5), child: GestureDetector(
          onTap: () => _onTap(context),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5), // Semi-transparent grey
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4.0,
            ), // Internal padding for the text
            child: const Text(
              "© OpenStreetMap",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),),),);
    }

  void _onTap(BuildContext context) {
    Routing.to(
        context,
        const ShowWebWidget(
          route: "https://www.openstreetmap.org/copyright",
          title: "OpenStreetMap Copyright",
        ),);
  }
}

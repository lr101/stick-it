import 'dart:async';
import 'package:flutter/material.dart';
import '../../../util/routing/routing.dart';
import '../../web/presentation/show_web.dart';

class OsmCopyright extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Align(
      alignment: Alignment.bottomLeft,
        child: Padding(padding: EdgeInsets.all(5), child: GestureDetector(
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
            child: Text(
              "© OpenStreetMap",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ))));
    }

  void _onTap(context) {
    Routing.to(
        context,
        const ShowWebWidget(
          route: "https://www.openstreetmap.org/copyright",
          title: "OpenStreetMap Copyright",
        ));
  }
}

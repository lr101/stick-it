
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapPanelDraggable extends StatelessWidget {
  const MapPanelDraggable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),
      ),
      child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 5,
              decoration: BoxDecoration(
                  color: Theme.of(context).hintColor,
                  borderRadius:
                  BorderRadius.all(Radius.circular(2.5))))),
    );
  }

}
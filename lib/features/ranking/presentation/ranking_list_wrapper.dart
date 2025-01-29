import 'package:buff_lisa/features/ranking/presentation/ranking_location_selector.dart';
import 'package:buff_lisa/features/ranking/presentation/ranking_time_button.dart';
import 'package:flutter/material.dart';

class RankingListWrapper extends StatelessWidget {
  final Widget child;

  const RankingListWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RankingTimeButton(label: "weekly", index: 0),
                  RankingLocationSelector(),
                  RankingTimeButton(label: "all-time", index: 1),
                ],
              ),
              RankingLocationSearch(),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

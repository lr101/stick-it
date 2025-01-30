import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class SeasonTile extends StatelessWidget {
  final SeasonItemDto bestSeason;

  const SeasonTile({super.key, required this.bestSeason});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Best All-Time Season", style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "#${bestSeason.rank}, ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            TextSpan(
              text: "Season ${bestSeason.season.seasonNumber}, ",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            TextSpan(
              text: "Points: ${bestSeason.points}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.info_outline),
        onPressed: () {
          // Show more details about the season
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Season Details"),
                content: Text(
                  "You achieved rank #${bestSeason.rank} in Season ${bestSeason.season.seasonNumber} (${DateFormat('MMMM').format(DateTime(0, bestSeason.season.month))} ${bestSeason.season.year}), "
                  "with ${bestSeason.points} points! Keep on sticking!",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Close"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

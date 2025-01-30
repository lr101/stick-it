import 'package:buff_lisa/data/service/geojson_service.dart';
import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/data/service/ranking_service.dart';
import 'package:buff_lisa/features/ranking/presentation/ranking.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class TopGroupsPreview extends ConsumerStatefulWidget {
  const TopGroupsPreview({super.key});

  @override
  ConsumerState<TopGroupsPreview> createState() => _TopGroupPreviewState();
}

class _TopGroupPreviewState extends ConsumerState<TopGroupsPreview> {
  @override
  Widget build(BuildContext context) {
    final district = ref.watch(districtServiceProvider);
    final groupRanking = ref.watch(top3GroupServiceProvider);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => Routing.to(context, const Ranking()),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: groupRanking.whenOrNull(
            data: (data) {
              if (data == null) return null;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Wrap with Align to apply width constraints
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4, // Match container width
                        child: Text(
                          district?.name2 ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  if (data.isEmpty) Text("Empty ranking", style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 10, color: Colors.blueGrey.shade600)),
                  if (data.isNotEmpty)
                    Row(
                      children: [
                        const Icon(Icons.emoji_events, color: Colors.yellowAccent, size: 20,),
                        const SizedBox(width: 5,),
                        RoundImage(imageCallback: ref.watch(groupProfilePictureSmallByIdProvider(data[0].groupInfoDto!.id)), size: 7.5),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Text(
                            data[0].groupInfoDto!.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 10, color: Colors.blueGrey.shade600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  if (data.length > 1)
                    Row(
                      children: [
                        const Icon(Icons.emoji_events, color: Colors.blueGrey, size: 20,),
                        const SizedBox(width: 5,),
                        RoundImage(imageCallback: ref.watch(groupProfilePictureSmallByIdProvider(data[1].groupInfoDto!.id)), size: 7.5),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Text(
                            data[1].groupInfoDto!.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 10, color: Colors.blueGrey.shade600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  if (data.length > 2)
                    Row(
                      children: [
                        const Icon(Icons.emoji_events, color: Colors.brown, size: 20,),
                        const SizedBox(width: 5,),
                        RoundImage(imageCallback: ref.watch(groupProfilePictureSmallByIdProvider(data[2].groupInfoDto!.id)), size: 7.5),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Text(
                            data[2].groupInfoDto!.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 10, color: Colors.blueGrey.shade600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                ],
              );
            },
          ) ?? Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 14, width: MediaQuery.of(context).size.width * 0.2,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),  color: Colors.white.withValues(alpha: 0.5), )),
                const SizedBox(height: 3,),
                Container(height: 10, width: MediaQuery.of(context).size.width * 0.3, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white.withValues(alpha: 0.5),) ),
                const SizedBox(height: 3,),
                Container(height: 10, width: MediaQuery.of(context).size.width * 0.3, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white.withValues(alpha: 0.5), ),),
                const SizedBox(height: 3,),
                Container(height: 10, width: MediaQuery.of(context).size.width * 0.3, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),  color: Colors.white.withValues(alpha: 0.5), ),),
              ],
              ),
            ),),
        ),
      ),
    );
  }
}

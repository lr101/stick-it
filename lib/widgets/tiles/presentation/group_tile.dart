import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_cached_image.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupTile extends ConsumerWidget {

  final LocalGroupDto groupDto;
  final VoidCallback? onTap;
  final bool userCachedImage;
  final Widget? tailing;

  const GroupTile({super.key, required this.groupDto, this.onTap, this.userCachedImage = false, this.tailing});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTile = ListTile(
      trailing: tailing,
      minTileHeight: 60,
      title: Column(
        children: [
          Align(alignment: Alignment.centerLeft,child: Text(groupDto.name)),
          Align(
              alignment: Alignment.centerLeft,
              child: groupDto.description == null ? const Icon(Icons.lock, size: 12,) : Text(groupDto.description!, overflow: TextOverflow.ellipsis, maxLines: 1, style: const TextStyle(fontStyle:  FontStyle.italic, fontSize: 12)),
          ),
        ],
      ),
      leading: !userCachedImage ? RoundImage(imageCallback: ref.watch(groupProfilePictureSmallByIdProvider(groupDto.groupId)), size: 25.0, child: Container()) :
        RoundCachedImage(url: "${ref.watch(globalDataServiceProvider).minioHost}/groups/${groupDto.groupId}/group_profile_small.png", size: 25.0),
    );
    if (onTap == null) {
      return listTile;
    } else {
      return GestureDetector(
        onTap: onTap,
        child: listTile,
      );
    }
  }
}

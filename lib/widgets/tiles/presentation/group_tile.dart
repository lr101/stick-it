import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/service/group_image_service.dart';
import '../../round_image/presentation/round_image.dart';

class GroupTile extends ConsumerWidget {

  final LocalGroupDto groupDto;
  final VoidCallback? onTap;

  GroupTile({super.key, required this.groupDto, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTile = ListTile(
      title: Column(
        children: [
          Align(alignment: Alignment.centerLeft,child: Text(groupDto.name)),
          Align(
              alignment: Alignment.centerLeft,
              child: groupDto.description == null ? Icon(Icons.lock, size: 12,) : Text(groupDto.description!, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontStyle:  FontStyle.italic, fontSize: 12))
          )

        ],
      ),
      leading: RoundImage(imageCallback: ref.watch(groupProfilePictureSmallByIdProvider(groupDto.groupId)), size: 20.0, child: Container()),
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

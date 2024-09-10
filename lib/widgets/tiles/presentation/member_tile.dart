import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/dto/member_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../round_image/presentation/round_image.dart';

class MemberTile extends StatelessWidget {

  final MemberDto memberDto;
  final VoidCallback? onTap;

  MemberTile({super.key, required this.memberDto, this.onTap});

  @override
  Widget build(BuildContext context) {
    final listTile = ListTile(
      title: Align(alignment: Alignment.centerLeft,child: Text(memberDto.username + " ${memberDto.admin ? "(Admin)" : ""}")),
      leading: RoundImage(imageCallback: AsyncData(memberDto.profileImageSmall), size: 20.0, child: Container()),
      trailing: Text(memberDto.points.toString() + " sticks"),
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

import 'dart:convert';

import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/member_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/group_edit/service/group_edit_service.dart';
import 'package:buff_lisa/widgets/group_edit_template/presentation/group_edit_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart' as api;

import '../../../widgets/custom_interaction/presentation/custom_error_snack_bar.dart';

class GroupEdit extends ConsumerStatefulWidget {
  const GroupEdit({super.key, required this.groupDto});

  final LocalGroupDto groupDto;

  @override
  ConsumerState<GroupEdit> createState() => _GroupEditState();
}

class _GroupEditState extends ConsumerState<GroupEdit> {
  @override
  Widget build(BuildContext context) {
    final global = ref.watch(globalDataServiceProvider);
    final adminId = ref.watch(groupEditServiceProvider);
    return GroupEditTemplate(
        groupDto: widget.groupDto,
        title: "Edit group ${widget.groupDto.name}",
        onSubmit:
            (name, description, link, profileImage, visibility) async {
          final result = await ref
              .read(userGroupServiceProvider.notifier)
              .updateGroup(
                  api.UpdateGroupDto(
                      description: description,
                      name: name,
                      profileImage: base64Encode(profileImage),
                      link: link,
                      visibility: visibility,
                      groupAdmin: adminId),
                  widget.groupDto.groupId);
          if (result == null) {
            Navigator.of(context).pop();
          } else {
            CustomErrorSnackBar.message(message: result);
          }
        },
        rowItems: [
          const SizedBox(height: 5),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Group admin:",
                            style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal)),
                        DropdownButton<String>(
                            isExpanded: true,
                            items: ref
                                    .watch(
                                        memberServiceProvider(widget.groupDto.groupId))
                                    .whenOrNull(
                                        data: (data) => data
                                            .map((e) =>
                                                DropdownMenuItem<String>(
                                                    value: e.userId,
                                                    child: Text(e.username)))
                                            .toList()) ??
                                [
                                  DropdownMenuItem<String>(
                                      value: global.userId,
                                      child: Text(ref.watch(currentUserServiceProvider).username!))
                                ],
                            onChanged: (String? value) {
                              if (value != null) {
                                ref
                                    .read(groupEditServiceProvider.notifier)
                                    .updateAdminId(value);
                              }
                            },
                            value: adminId),
                      ])),
            ),
          ),
        ]);
  }
}

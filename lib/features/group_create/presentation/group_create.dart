import 'dart:convert';

import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/widgets/group_edit_template/presentation/group_edit_template.dart';
import 'package:buff_lisa/widgets/group_edit_template/service/group_create_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart' as api;
import 'package:uuid/uuid.dart';

class GroupCreate extends ConsumerWidget {

  const GroupCreate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GroupEditTemplate(
        onSubmit: (name, description, link, profileImage, visibility, adminId) {
          final createDto = api.CreateGroupDto(description: description,
              name: name,
              visibility: visibility == 0 ? api.Visibility.number0 : api.Visibility.number1,
              profileImage: base64Encode(profileImage),
              groupAdmin: adminId,
              link: link);
          ref.read(userGroupServiceProvider.notifier).createGroup(createDto);
        }
    );
  }
}

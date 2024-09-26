import 'dart:convert';

import 'package:buff_lisa/data/config/visibility_extender.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/widgets/group_edit_template/presentation/group_edit_template.dart';
import 'package:buff_lisa/widgets/group_edit_template/service/group_create_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart' as api;
import 'package:uuid/uuid.dart';

import '../../../widgets/custom_interaction/presentation/custom_error_snack_bar.dart';

class GroupCreate extends ConsumerWidget {
  GroupCreate({super.key});

  Mutex _mutex = Mutex();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GroupEditTemplate(
        onSubmit: (name, description, link, profileImage, visibility) async {
      if (_mutex.isLocked) return;
      _mutex.acquire();
      final createDto = api.CreateGroupDto(
          description: description,
          name: name,
          visibility: fromOrdinal(visibility),
          profileImage: base64Encode(profileImage.toList()),
          groupAdmin: ref.watch(globalDataServiceProvider).userId!,
          link: link);
      final result = await ref
          .read(userGroupServiceProvider.notifier)
          .createGroup(createDto);
      _mutex.release();
      if (result == null) {
        Navigator.of(context).pop();
      } else {
        CustomErrorSnackBar.message(message: result);
      }
    });
  }
}

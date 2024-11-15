import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/auth/data/login_service.dart';
import 'package:buff_lisa/widgets/buttons/presentation/custom_submit_button.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:buff_lisa/widgets/round_image/presentation/custom_image_picker.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/service/user_image_service.dart';

class ChangeProfilePicture extends ConsumerWidget {
  const ChangeProfilePicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    return Scaffold(
        appBar: AppBar(
          title: Text('Change profile picture'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    RoundImage(
                      imageCallback:
                          ref.watch(profilePictureByIdProvider(userId)),
                      size: MediaQuery.of(context).size.width * 0.25,
                    ),
                    SizedBox(height: 16.0),
                    SubmitButton(onPressed: () async => await _changeProfilePicture(ref, context), text: "Change profile picture"),
                  ],
                ))));
  }

  Future<void> _changeProfilePicture(WidgetRef ref, BuildContext context) async {
    final image = await CustomImagePicker.pickAndCrop(minHeight: 100, minWidth: 100, context: context);
    if (image != null) {
      final result = await ref.read(userServiceProvider.notifier).changeUser(profilePicture: image);
      if (result == null) {
        CustomErrorSnackBar.message(message: "Successfully changed profile picture");
      } else {
        CustomErrorSnackBar.message(message: result);
      }
    }
  }
}

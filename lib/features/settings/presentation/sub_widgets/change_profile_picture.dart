import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/auth/data/login_service.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:buff_lisa/widgets/round_image/presentation/custom_image_picker.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _changeProfilePicture(ref, context),
                        child: Text('Pick image'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          textStyle: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  Future<void> _changeProfilePicture(WidgetRef ref, BuildContext context) async {
    final image = await CustomImagePicker.pickAndCrop(minHeight: 100, minWidth: 100, context: context);
    if (image != null) {
      final result = await ref.read(userServiceProvider.notifier).changeUser(profilePicture: image);
      if (result == null) {
        CustomErrorSnackBar.message(context: context, message: "Successfully changed profile picture");
      } else {
        CustomErrorSnackBar.message(context: context, message: result);
      }
    }
  }
}

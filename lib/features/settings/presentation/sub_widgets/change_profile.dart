import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/auth/data/login_service.dart';
import 'package:buff_lisa/features/settings/presentation/state/user_edit_state.dart';
import 'package:buff_lisa/widgets/buttons/presentation/custom_submit_button.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeProfile extends ConsumerStatefulWidget {

  const ChangeProfile({super.key});

  @override
  ConsumerState<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends ConsumerState<ChangeProfile> {

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final String _originalDescription;
  late final String _originalUsername;

  @override
  void dispose() {
    _descriptionController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _originalDescription = ref.watch(currentUserServiceProvider).description ?? "";
      _descriptionController.text = _originalDescription;
      _originalUsername = ref.watch(currentUserServiceProvider).username!;
      _usernameController.text = _originalUsername;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit profile'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                  children: [
                    RoundImagePicker(
                    size: MediaQuery.of(context).size.width / 4,
                    editSize: 30,
                    imageUpload: (image) {
                      ref.read(userEditStateProvider.notifier).update(image);
                    },
                    imageCallback: AsyncData(ref.watch(userEditStateProvider)),
                  ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      validator: LoginService.userValidator,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    SubmitButton(onPressed: () async => await _changeProfilePicture(ref, context), text: "Update profile"),
                    SizedBox(height: 16,),
                    Text("Tip: A username can only be changed every 14 days.", style: TextStyle(fontStyle: FontStyle.italic),),
                    SizedBox(height: 5,),
                    Text("Tip: Updating a profile picture can take up to 30 sec.", style: TextStyle(fontStyle: FontStyle.italic),),
                  ],
                )))));
  }

  Future<void> _changeProfilePicture(WidgetRef ref, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final image = ref.watch(userEditStateProvider);
      final result = await ref.read(userServiceProvider.notifier).changeUser(
          username: _originalUsername == _usernameController.text ? null : _usernameController.text,
          description: _originalDescription == _descriptionController.text ? null : _descriptionController.text,
          profilePicture: ref.read(userEditStateProvider.notifier).hasChanged ? image : null
      );
      if (result == null) {
        CustomErrorSnackBar.message(message: "Successfully changed profile");
      } else {
        CustomErrorSnackBar.message(message: result);
      }
    }
  }
}

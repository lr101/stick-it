import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/auth/data/login_service.dart';
import 'package:buff_lisa/widgets/buttons/presentation/custom_submit_button.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeEmailPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends ConsumerState<ChangeEmailPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newEmailController = TextEditingController();


  Future<void> _changeEmail() async {
    if (_formKey.currentState!.validate()) {
      final result = await ref.read(userServiceProvider.notifier).changeUser(email: _newEmailController.text);
      if (result != null) {
        CustomErrorSnackBar.message(message: result, type: CustomErrorSnackBarType.error);
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Email'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _newEmailController,
                  decoration: InputDecoration(
                    labelText: 'New Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: LoginService.emailValidatorWithErrorMessage,
                ),
                SizedBox(height: 24.0),
                SubmitButton(onPressed: _changeEmail, text: 'Change Email'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

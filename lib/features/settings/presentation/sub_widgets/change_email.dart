import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/auth/data/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeEmailPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends ConsumerState<ChangeEmailPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newEmailController = TextEditingController();


  void _changeEmail() {
    if (_formKey.currentState!.validate()) {
      ref.read(userServiceProvider.notifier).changeUser(email: _newEmailController.text);
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

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _changeEmail,
                    child: Text('Change Email'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

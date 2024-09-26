import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/auth/presentation/auth.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteAccount extends ConsumerStatefulWidget {
  const DeleteAccount({super.key});

  @override
  ConsumerState<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends ConsumerState<DeleteAccount> {
  TextEditingController _controller = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      CustomErrorSnackBar.message(message: "Sending code to your email");
      final result =
          await ref.watch(userServiceProvider.notifier).getDeleteCode();
      if (result != null) {
        CustomErrorSnackBar.message(
            message: "Error while sending code: ${result}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delete Account"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Type the Code from your email here:",
                    textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _controller,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 20),
                  decoration:
                      const InputDecoration.collapsed(hintText: "6 digit code"),
                  maxLines: 1,
                  validator: (v) => v != null && v.length == 6
                      ? "Code must have 6 digits"
                      : null,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: _submitDelete,
                    child: Text('Delete Account'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: TextStyle(fontSize: 18.0),
                    ),
                  ))
            ],
          ),
        ));
  }

  Future<void> _submitDelete() async {
    if (_formKey.currentState!.validate()) {
      final result = await ref
          .watch(userServiceProvider.notifier)
          .deleteAccount(int.parse(_controller.text));
      if (result != null) {
        CustomErrorSnackBar.message(message: result);
      } else {
        Routing.toAndDelete(context, Auth(), "/login");
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:mutex/mutex.dart';

class SubmitButton extends StatefulWidget {
  final Future<void> Function() onPressed;
  final String text;

  const SubmitButton({
    Key? key,
    required this.onPressed,
    this.text = 'Submit',
  }) : super(key: key);

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _isLoading = false;

  Mutex _m = Mutex();

  Future<void> _handlePress() async {
    if (_isLoading || _m.isLocked) return;
    await _m.acquire();
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed();
    } finally {
      setState(() {
        _isLoading = false;
      });
      _m.release();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handlePress,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          textStyle: const TextStyle(fontSize: 18.0),
          side: BorderSide(width: 2, color: Theme.of(context).colorScheme.primary),
        ),
        child: _isLoading
            ? const CircularProgressIndicator()
            : Text(widget.text),
      ),
    );
  }
}

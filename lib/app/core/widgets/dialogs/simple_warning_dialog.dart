import 'package:flutter/material.dart';

class SimpleWarningDialog extends StatelessWidget {
  const SimpleWarningDialog({
    Key? key,
    this.title,
    this.content,
  }) : super(key: key);

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: content != null ? Text(content!) : null,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), 
          child: const Text('OK')
        ),
      ],
    );
  }
}

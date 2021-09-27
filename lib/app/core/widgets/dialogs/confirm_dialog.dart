import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    Key? key,
    this.title,
    this.content,
  }) : super(key: key);

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? 'Decisão'),
      content: content != null ? Text(content!) : null,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false), 
          child: const Text('CANCELAR')
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true), 
          child: const Text('CONFIRMAR')
        ),
      ],
    );
  }
}

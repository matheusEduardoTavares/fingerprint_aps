import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({ 
    required this.textEditingController,
    required this.labelText,
    Key? key ,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      textInputAction: TextInputAction.next,
      validator: (value) => value != null && value.length > 5 ? 
        null : 'Ao menos 5 caracteres',
    );
  }
}
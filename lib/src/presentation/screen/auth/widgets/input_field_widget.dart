import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final String titleText;
  final TextEditingController controller;
  final String hintText;
  final bool enabled;

  const InputFieldWidget({
    super.key,
    required this.titleText,
    required this.controller,
    required this.hintText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleText),
        TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hintText),
          readOnly: !enabled,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ProfileRowWidget extends StatelessWidget {
  final String title;
  final String value;
  const ProfileRowWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

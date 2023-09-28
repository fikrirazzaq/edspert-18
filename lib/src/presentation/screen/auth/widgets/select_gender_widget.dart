import 'package:flutter/material.dart';

enum Gender {
  lakiLaki(label: 'Laki-laki'),
  perempuan(label: 'Perempuan');

  final String label;

  const Gender({required this.label});
}

class SelectGenderWidget extends StatelessWidget {
  final String gender;
  final Function(String) onSelectGender;

  const SelectGenderWidget({super.key, required this.gender, required this.onSelectGender});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildOptionWidget(gender: Gender.lakiLaki),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildOptionWidget(gender: Gender.perempuan),
        ),
      ],
    );
  }

  Material _buildOptionWidget({required Gender gender}) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          onTap(gender);
        },
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected(gender) ? Colors.blue.withOpacity(0.5) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFD6D6D6)),
          ),
          child: Text(
            gender.label,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  bool isSelected(Gender value) {
    return gender == value.label;
  }

  void onTap(Gender value) {
    onSelectGender(value.label);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../values/colors.dart';

class OptionWidget extends StatelessWidget {
  final String optionLetter;
  final String optionContent;
  final bool isSelected;
  final VoidCallback onTap;
  const OptionWidget({
    super.key,
    required this.isSelected,
    required this.optionLetter,
    required this.optionContent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFC9C9C9)),
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.bluePrimary.withOpacity(0.71) : Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$optionLetter.  '),
            Expanded(child: HtmlWidget(optionContent)),
          ],
        ),
      ),
    );
  }
}

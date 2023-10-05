import 'package:flutter/material.dart';

import '../../../../domain/entity/question_list_response_entity.dart';
import '../../../../core/values/colors.dart';

class QuestionsNumberWidget extends StatelessWidget {
  final List<QuestionListDataEntity> questions;
  final int activeQuestionIndex;

  const QuestionsNumberWidget({
    Key? key,
    required this.questions,
    required this.activeQuestionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          questions.length,
          (index) {
            bool isSelected = index <= activeQuestionIndex;
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.bluePrimary,
                    width: 1,
                  ),
                  color: isSelected ? AppColors.bluePrimary : Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                width: 23,
                height: 23,
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.bluePrimary,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/domain/entity/question_list_response_entity.dart';
import 'package:learning/src/presentation/blocs/course/exercise_form_cubit.dart';

import '../../../../domain/entity/question_answer.dart';

class QuestionNumbersBarWidget extends StatelessWidget {
  const QuestionNumbersBarWidget({
    super.key,
    required this.questions,
    required this.activeQuestionId,
    required this.questionAnswers,
  });

  final List<QuestionAnswer> questionAnswers;
  final List<QuestionListDataEntity> questions;
  final String activeQuestionId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          10,
          (index) {
            bool isAnsweredAndPassed = questionAnswers.any(
              (element) => element.questionId == questions[index].questionId,
            );

            return InkWell(
              onTap: () {
                context.read<ExerciseFormCubit>().navigateToQuestionIndex(
                      index: index,
                      questions: questions,
                    );
              },
              child: Container(
                padding: EdgeInsets.all(4),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  color: isAnsweredAndPassed ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontWeight: isAnsweredAndPassed
                          ? FontWeight.w800
                          : FontWeight.w400,
                      color: isAnsweredAndPassed ? Colors.white : Colors.black,
                      fontSize: 12,
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

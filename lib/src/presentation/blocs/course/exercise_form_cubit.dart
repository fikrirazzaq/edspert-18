import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/domain/entity/question_answer.dart';
import 'package:learning/src/domain/entity/question_list_response_entity.dart';

part 'exercise_form_state.dart';

class ExerciseFormCubit extends Cubit<ExerciseFormState> {
  ExerciseFormCubit()
      : super(ExerciseFormState(
          activeQuestionId: '',
          activeQuestionIndex: 0,
          questionAnswers: [],
        ));

  void navigateToQuestionIndex({
    required List<QuestionListDataEntity> questions,
    required int index,
  }) {
    emit(state.copyWith(
      activeQuestionIndex: index,
      activeQuestionId: questions[index].questionId,
    ));
  }

  void initStudentAnsweredQuestions({
    required List<QuestionListDataEntity> questions,
  }) {
    for (QuestionListDataEntity data in questions) {
      if (data.studentAnswer.isNotEmpty) {
        List<QuestionAnswer> updateQuestionAnswers =
            List.from(state.questionAnswers);
        if (updateQuestionAnswers
            .any((element) => element.questionId == data.questionId)) {
          int indexToUpdate = state.questionAnswers
              .indexWhere((element) => element.questionId == data.questionId);
          updateQuestionAnswers[indexToUpdate] = QuestionAnswer(
              questionId: data.questionId, answer: data.studentAnswer);
        } else {
          updateQuestionAnswers.add(QuestionAnswer(
              questionId: data.questionId, answer: data.studentAnswer));
        }
        emit(state.copyWith(questionAnswers: updateQuestionAnswers));
      }
    }
  }

  void updateAnswerToQuestion(
      {required String questionId, required String answer}) {
    List<QuestionAnswer> updateQuestionAnswers =
        List.from(state.questionAnswers);

    /// Check dulu, apakah jawabannya ada?
    if (updateQuestionAnswers
        .any((element) => element.questionId == questionId)) {
      int indexToUpdate = updateQuestionAnswers
          .indexWhere((element) => element.questionId == questionId);
      updateQuestionAnswers[indexToUpdate] =
          QuestionAnswer(questionId: questionId, answer: answer);
    } else {
      updateQuestionAnswers
          .add(QuestionAnswer(questionId: questionId, answer: answer));
    }
    emit(state.copyWith(questionAnswers: updateQuestionAnswers));
  }
}

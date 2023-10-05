part of 'exercise_form_cubit.dart';

class ExerciseFormState {
  final List<QuestionAnswer> questionAnswers; // []
  final int activeQuestionIndex;
  final String activeQuestionId;

  ExerciseFormState({
    required this.questionAnswers,
    required this.activeQuestionIndex,
    required this.activeQuestionId,
  });

  ExerciseFormState copyWith({
    List<QuestionAnswer>? questionAnswers,
    int? activeQuestionIndex,
    String? activeQuestionId,
  }) {
    return ExerciseFormState(
      questionAnswers: questionAnswers ?? this.questionAnswers,
      activeQuestionIndex: activeQuestionIndex ?? this.activeQuestionIndex,
      activeQuestionId: activeQuestionId ?? this.activeQuestionId,
    );
  }
}

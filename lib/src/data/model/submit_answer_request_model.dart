import 'dart:convert';

class SubmitAnswerRequestModel {
  final String userEmail;
  final String exerciseId;
  final List<String> questionIds;
  final List<String> answers;
  SubmitAnswerRequestModel({
    required this.userEmail,
    required this.exerciseId,
    required this.questionIds,
    required this.answers,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_email': userEmail,
      'exercise_id': exerciseId,
      'bank_question_id': questionIds,
      'student_answer': answers,
    };
  }

  factory SubmitAnswerRequestModel.fromMap(Map<String, dynamic> map) {
    return SubmitAnswerRequestModel(
      userEmail: map['user_email'] ?? '',
      exerciseId: map['exercise_id'] ?? '',
      questionIds: List<String>.from(map['bank_question_id']),
      answers: List<String>.from(map['student_answer']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubmitAnswerRequestModel.fromJson(String source) => SubmitAnswerRequestModel.fromMap(json.decode(source));
}

class QuestionListResponseEntity {
  int status;
  String message;
  List<QuestionListDataEntity> data;

  QuestionListResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class QuestionListDataEntity {
  String exerciseId;
  String questionId;
  String questionTitle;
  String questionTitleImg;
  String optionA;
  String optionAImg;
  String optionB;
  String optionBImg;
  String optionC;
  String optionCImg;
  String optionD;
  String optionDImg;
  String optionE;
  String optionEImg;
  String studentAnswer;

  QuestionListDataEntity({
    required this.exerciseId,
    required this.questionId,
    required this.questionTitle,
    required this.questionTitleImg,
    required this.optionA,
    required this.optionAImg,
    required this.optionB,
    required this.optionBImg,
    required this.optionC,
    required this.optionCImg,
    required this.optionD,
    required this.optionDImg,
    required this.optionE,
    required this.optionEImg,
    required this.studentAnswer,
  });
}

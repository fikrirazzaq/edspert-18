class ExerciseResultResponseEntity {
  int status;
  String message;
  ExerciseResultDataEntity data;

  ExerciseResultResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class ExerciseResultDataEntity {
  Exercise exercise;
  Result result;

  ExerciseResultDataEntity({required this.exercise, required this.result});
}

class Exercise {
  String exerciseId;
  String exerciseCode;
  String fileCourse;
  String icon;
  String exerciseTitle;
  String exerciseDescription;
  String exerciseInstruction;
  String countQuestion;
  String classFk;
  String courseFk;
  String courseContentFk;
  String subCourseContentFk;
  String creatorId;
  String creatorName;
  String examFrom;
  String accessType;
  String exerciseOrder;
  String exerciseStatus;
  String dateCreate;
  String dateUpdate;

  Exercise({
    required this.exerciseId,
    required this.exerciseCode,
    required this.fileCourse,
    required this.icon,
    required this.exerciseTitle,
    required this.exerciseDescription,
    required this.exerciseInstruction,
    required this.countQuestion,
    required this.classFk,
    required this.courseFk,
    required this.courseContentFk,
    required this.subCourseContentFk,
    required this.creatorId,
    required this.creatorName,
    required this.examFrom,
    required this.accessType,
    required this.exerciseOrder,
    required this.exerciseStatus,
    required this.dateCreate,
    required this.dateUpdate,
  });
}

class Result {
  String jumlahBenar;
  String jumlahSalah;
  String jumlahTidak;
  String jumlahScore;

  Result({
    required this.jumlahBenar,
    required this.jumlahSalah,
    required this.jumlahTidak,
    required this.jumlahScore,
  });
}

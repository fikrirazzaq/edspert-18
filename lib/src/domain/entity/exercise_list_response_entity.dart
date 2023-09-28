class ExerciseListResponseEntity {
  final int status;
  final String message;
  final List<ExerciseDataEntity> data;

  ExerciseListResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class ExerciseDataEntity {
  final String exerciseId;
  final String exerciseTitle;
  final String accessType;
  final String icon;
  final String exerciseUserStatus;
  final String jumlahSoal;
  final int jumlahDone;

  ExerciseDataEntity({
    required this.exerciseId,
    required this.exerciseTitle,
    required this.accessType,
    required this.icon,
    required this.exerciseUserStatus,
    required this.jumlahSoal,
    required this.jumlahDone,
  });
}

class CourseListResponseEntity {
  int status;
  String message;
  List<CourseDataEntity> data;

  CourseListResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class CourseDataEntity {
  String courseId;
  String majorName;
  String courseCategory;
  String courseName;
  String urlCover;
  int jumlahMateri;
  int jumlahDone;
  int progress;

  CourseDataEntity({
    required this.courseId,
    required this.majorName,
    required this.courseCategory,
    required this.courseName,
    required this.urlCover,
    required this.jumlahMateri,
    required this.jumlahDone,
    required this.progress,
  });
}

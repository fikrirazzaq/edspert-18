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
  final String courseId;
  final String majorName;
  final String courseCategory;
  final String courseName;
  final String urlCover;
  final  int jumlahMateri;
  final int jumlahDone;
  final int progress;

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

  factory CourseDataEntity.fromMap(Map<String, dynamic> map) {
    return CourseDataEntity(
      courseId: map['course_id'] as String,
      majorName: map['major_name'] as String,
      courseCategory: map['course_category'] as String,
      courseName: map['course_name'] as String,
      urlCover: map['url_cover'] as String,
      jumlahMateri: map['jumlah_materi'] as int,
      jumlahDone: map['jumlah_done'] as int,
      progress: map['progress'] as int,
    );
  }
}

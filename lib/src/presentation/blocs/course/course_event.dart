part of 'course_bloc.dart';

class CourseEvent {}

class GetCoursesEvent extends CourseEvent {
  final String majorName;

  GetCoursesEvent({required this.majorName});
}

class GetExercisesByCourseEvent extends CourseEvent {
  final String courseId;

  GetExercisesByCourseEvent({required this.courseId});
}

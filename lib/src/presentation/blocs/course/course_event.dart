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

class GetQuestionsByExerciseEvent extends CourseEvent {
  final String exerciseId;

  GetQuestionsByExerciseEvent({required this.exerciseId});
}

class SubmitAnswersEvent extends CourseEvent {
  final SubmitAnswerRequestModel request;

  SubmitAnswersEvent({required this.request});
}

class GetExerciseResultEvent extends CourseEvent {
  final String exerciseId;

  GetExerciseResultEvent({required this.exerciseId});
}

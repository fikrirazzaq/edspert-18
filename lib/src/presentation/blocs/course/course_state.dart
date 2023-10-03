part of 'course_bloc.dart';

// Empty/Init
// Loading
// Load Success: Data List Mata Pelajaran
// Load Error: Error Message

/// Shared State
// enum LoadingState { init, loading, success, error }

// class CourseState {
//   final LoadingState getCoursesState;
//   final List<CourseDataEntity>? data;
//   final String? errorMessage;

//   CourseState({required this.getCoursesState, required this.data, required this.errorMessage});

//   CourseState copyWith({
//     LoadingState? getCoursesState,
//     List<CourseDataEntity>? data,
//     String? errorMessage,
//   }) {
//     return CourseState(
//       data: data ?? this.data,
//       errorMessage: errorMessage ?? this.errorMessage,
//       getCoursesState: getCoursesState ?? this.getCoursesState,
//     );
//   }

//   @override
//   String toString() => 'CourseState(getCoursesState: $getCoursesState, data: $data, errorMessage: $errorMessage)';
// }

// Sub Class State
class CourseState {}

class CourseInit extends CourseState {}

/// Get Courses
class LoadingGetCoursesState extends CourseState {}

class SuccessGetCoursesState extends CourseState {
  final List<CourseDataEntity> data;

  SuccessGetCoursesState(this.data);
}

class ErrorGetCoursesState extends CourseState {
  final String errorMessage;

  ErrorGetCoursesState(this.errorMessage);
}

/// Get Exercises
class LoadingGetExercisesByCourseState extends CourseState {}

class SuccessGetExercisesByCourseState extends CourseState {
  final List<ExerciseDataEntity> data;

  SuccessGetExercisesByCourseState(this.data);
}

class ErrorGetExercisesByCourseState extends CourseState {
  final String errorMessage;

  ErrorGetExercisesByCourseState(this.errorMessage);
}

/// Get Questions
class LoadingGetQuestionsByCourseState extends CourseState {}

class SuccessGetQuestionsByCourseState extends CourseState {
  final List<QuestionListDataEntity> data;

  SuccessGetQuestionsByCourseState(this.data);
}

class ErrorGetQuestionsByCourseState extends CourseState {
  final String errorMessage;

  ErrorGetQuestionsByCourseState(this.errorMessage);
}

/// Submit Answers
class LoadingSubmitAnswersState extends CourseState {}

class SuccessSubmitAnswersState extends CourseState {}

class ErrorSubmitAnswersState extends CourseState {
  final String errorMessage;

  ErrorSubmitAnswersState(this.errorMessage);
}

/// Get Exercises Result
class LoadingGetExercisesResultState extends CourseState {}

class SuccessGetExercisesResultState extends CourseState {
  final ExerciseResultResponseEntity data;

  SuccessGetExercisesResultState(this.data);
}

class ErrorGetExercisesResultState extends CourseState {
  final String errorMessage;

  ErrorGetExercisesResultState(this.errorMessage);
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/domain/entity/course_list_response_entity.dart';
import 'package:learning/src/domain/entity/exercise_list_response_entity.dart';
import 'package:learning/src/domain/usecase/courses/get_courses_usecase.dart';
import 'package:learning/src/domain/usecase/courses/get_exercises_by_course_usecase.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUsecase getCoursesUsecase;
  final GetExercisesByCourseUsecase getExercisesByCourseUsecase;

  /// Shared State
  CourseBloc(this.getCoursesUsecase, this.getExercisesByCourseUsecase)
      : super(CourseInit()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCoursesEvent) {
        emit(LoadingGetCoursesState());

        final List<CourseDataEntity>? getCourses =
            await getCoursesUsecase(event.majorName);
        if (getCourses == null) {
          emit(ErrorGetCoursesState('Something wrong'));
        } else {
          emit(SuccessGetCoursesState(getCourses));
        }
      }
      if (event is GetExercisesByCourseEvent) {
        emit(LoadingGetExercisesByCourseState());

        final List<ExerciseDataEntity>? getExercises =
            await getExercisesByCourseUsecase(event.courseId);
        if (getExercises == null) {
          emit(ErrorGetExercisesByCourseState('Something wrong'));
        } else {
          emit(SuccessGetExercisesByCourseState(getExercises));
        }
      }
    });
  }

  /// Sub-Class State
  // CourseBloc(this.getCoursesUsecase) : super(InitGetCoursesState()) {
  //   on<CourseEvent>((event, emit) async {
  //     if (event is GetCoursesEvent) {
  //       // Set ke loading
  //       emit(LoadingGetCoursesState());

  //       final List<CourseDataEntity>? getCourses = await getCoursesUsecase('IPA');

  //       if (getCourses == null) {
  //         // Error
  //         emit(ErrorGetCoursesState('Something went wrong.'));
  //       } else {
  //         // Success
  //         emit(SuccessGetCoursesState(getCourses));
  //       }
  //     }
  //   });
  // }
}

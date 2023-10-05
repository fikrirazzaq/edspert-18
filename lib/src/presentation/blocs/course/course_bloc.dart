import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/submit_answer_request_model.dart';
import '../../../domain/entity/course_list_response_entity.dart';
import '../../../domain/entity/exercise_list_response_entity.dart';
import '../../../domain/entity/exercise_result_response_entity.dart';
import '../../../domain/entity/question_list_response_entity.dart';
import '../../../domain/usecase/courses/get_courses_usecase.dart';
import '../../../domain/usecase/courses/get_exercise_result_usecase.dart';
import '../../../domain/usecase/courses/get_exercises_by_course_usecase.dart';
import '../../../domain/usecase/courses/get_questions_by_exercise_usecase.dart';
import '../../../domain/usecase/courses/submit_exercise_answer_usecase.dart';

part 'course_event.dart';

part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUsecase getCoursesUsecase;
  final GetExercisesByCourseUsecase getExercisesByCourseUsecase;
  final GetQuestionsByExerciseUsecase getQuestionsByExerciseUsecase;
  final SubmitExerciseAnswerUsecase submitExerciseAnswerUsecase;
  final GetExercisesResultUsecase getExercisesResultUsecase;

  /// Shared State
  CourseBloc(
    this.getCoursesUsecase,
    this.getExercisesByCourseUsecase,
    this.getQuestionsByExerciseUsecase,
    this.submitExerciseAnswerUsecase,
    this.getExercisesResultUsecase,
  ) : super(CourseInit()) {
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
      if (event is GetQuestionsByExerciseEvent) {
        emit(LoadingGetQuestionsByCourseState());

        final List<QuestionListDataEntity>? getQuestions =
            await getQuestionsByExerciseUsecase(event.exerciseId);
        if (getQuestions == null) {
          emit(ErrorGetQuestionsByCourseState('Something wrong'));
        } else {
          emit(SuccessGetQuestionsByCourseState(getQuestions));
        }
      }
      if (event is SubmitAnswersEvent) {
        emit(LoadingSubmitAnswersState());

        final bool submitAnswer =
            await submitExerciseAnswerUsecase(event.request);
        if (submitAnswer) {
          emit(SuccessSubmitAnswersState());
        } else {
          emit(ErrorSubmitAnswersState('Something wrong'));
        }
      }
      if (event is GetExerciseResultEvent) {
        emit(LoadingGetExercisesResultState());

        final ExerciseResultResponseEntity? exerciseResult =
            await getExercisesResultUsecase(event.exerciseId);
        if (exerciseResult == null) {
          emit(ErrorGetExercisesResultState('Something wrong'));
        } else {
          emit(SuccessGetExercisesResultState(exerciseResult));
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

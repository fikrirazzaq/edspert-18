import 'package:learning/src/domain/entity/course_list_response_entity.dart';
import 'package:learning/src/domain/entity/exercise_list_response_entity.dart';
import 'package:learning/src/domain/entity/exercise_result_response_entity.dart';
import 'package:learning/src/domain/entity/question_list_response_entity.dart';

import '../../data/model/submit_answer_request_model.dart';

abstract class CourseRepository {
  /// Course List
  Future<List<CourseDataEntity>?> getCourses(String majorName);

  /// Exercise List
  Future<List<ExerciseDataEntity>?> getExercisesByCourse(String courseId);

  /// Do Exercise
  Future<List<QuestionListDataEntity>?> getQuestionsByExercise(String exerciseId);
  Future<bool> submitExerciseAnswer(SubmitAnswerRequestModel request);
  Future<ExerciseResultResponseEntity?> getExerciseResult(String exerciseId);
}

import '../../entity/question_list_response_entity.dart';
import '../../repository/course_repository.dart';

class GetQuestionsByExerciseUsecase {
  final CourseRepository repository;

  const GetQuestionsByExerciseUsecase({required this.repository});

  Future<List<QuestionListDataEntity>?> call(String exerciseId) async =>
      await repository.getQuestionsByExercise(exerciseId);
}

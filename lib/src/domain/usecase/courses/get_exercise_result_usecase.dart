import '../../entity/exercise_result_response_entity.dart';
import '../../repository/course_repository.dart';

class GetExercisesResultUsecase {
  final CourseRepository repository;

  const GetExercisesResultUsecase({required this.repository});

  Future<ExerciseResultResponseEntity?> call(String exerciseId) async => await repository.getExerciseResult(exerciseId);
}

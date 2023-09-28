import 'package:learning/src/domain/entity/exercise_list_response_entity.dart';
import 'package:learning/src/domain/repository/course_repository.dart';

class GetExercisesByCourseUsecase {
  final CourseRepository repository;

  const GetExercisesByCourseUsecase({required this.repository});

  Future<List<ExerciseDataEntity>?> call(String courseId) async =>
      await repository.getExercisesByCourse(courseId);
}

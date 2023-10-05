import 'package:learning/src/domain/entity/course_list_response_entity.dart';
import 'package:learning/src/domain/repository/course_repository.dart';

class GetCourseUsecase {
  final CourseRepository repository;

  const GetCourseUsecase({required this.repository});

  Future<List<CourseDataEntity>?> call(String majorName) async =>
      await repository.getCourses(majorName);
}

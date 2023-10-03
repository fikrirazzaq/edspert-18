import '../../entity/course_list_response_entity.dart';
import '../../repository/course_repository.dart';

class GetCoursesUsecase {
  final CourseRepository repository;

  const GetCoursesUsecase({required this.repository});

  Future<List<CourseDataEntity>?> call(String majorName) async => await repository.getCourses(majorName);
}

import '../../../data/model/submit_answer_request_model.dart';
import '../../repository/course_repository.dart';

class SubmitExerciseAnswerUsecase {
  final CourseRepository repository;

  const SubmitExerciseAnswerUsecase({required this.repository});

  Future<bool> call(SubmitAnswerRequestModel request) async => await repository.submitExerciseAnswer(request);
}

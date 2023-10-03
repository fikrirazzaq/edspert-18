import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning/src/data/datasource/course_remote_datasource.dart';
import 'package:learning/src/data/model/course_list_response_model.dart';
import 'package:learning/src/data/model/submit_answer_request_model.dart';
import 'package:learning/src/domain/entity/course_list_response_entity.dart';
import 'package:learning/src/domain/entity/exercise_list_response_entity.dart';
import 'package:learning/src/domain/entity/exercise_result_response_entity.dart';
import 'package:learning/src/domain/entity/question_list_response_entity.dart';
import 'package:learning/src/domain/repository/course_repository.dart';

import '../model/exercise_list_response_model.dart';
import '../model/question_list_response_model.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDatasource remoteDatasource;

  const CourseRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<CourseDataEntity>?> getCourses(String majorName) async {
    final response = await remoteDatasource.getCourses(majorName);
    if (response.data == null) {
      return null;
    }
    final data = CourseListResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<CourseDataModel>.from(response.data ?? [])
          .map(
            (e) => CourseDataEntity(
              courseId: e.courseId ?? '',
              majorName: e.majorName ?? '',
              courseCategory: e.courseCategory ?? '',
              courseName: e.courseName ?? '',
              urlCover: e.urlCover ?? '',
              jumlahMateri: e.jumlahMateri ?? 0,
              jumlahDone: e.jumlahDone ?? 0,
              progress: e.progress ?? 0,
            ),
          )
          .toList(),
    );

    return data.data;
  }

  @override
  Future<ExerciseResultResponseEntity?> getExerciseResult(String exerciseId) async {
    final response = await remoteDatasource.getExerciseResult(
      exerciseId: exerciseId,
      email: FirebaseAuth.instance.currentUser?.email ?? '',
    );

    if (response.data?.result?.jumlahScore == null) {
      return null;
    }

    final data = ExerciseResultResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: ExerciseResultDataEntity(
        exercise: Exercise(
          exerciseId: response.data?.exercise?.exerciseId ?? '',
          exerciseCode: response.data?.exercise?.exerciseCode ?? '',
          fileCourse: response.data?.exercise?.fileCourse ?? '',
          icon: response.data?.exercise?.icon ?? '',
          exerciseTitle: response.data?.exercise?.exerciseTitle ?? '',
          exerciseDescription: response.data?.exercise?.exerciseDescription ?? '',
          exerciseInstruction: response.data?.exercise?.exerciseInstruction ?? '',
          countQuestion: response.data?.exercise?.countQuestion ?? '',
          classFk: response.data?.exercise?.classFk ?? '',
          courseFk: response.data?.exercise?.courseFk ?? '',
          courseContentFk: response.data?.exercise?.courseContentFk ?? '',
          subCourseContentFk: response.data?.exercise?.subCourseContentFk ?? '',
          creatorId: response.data?.exercise?.creatorId ?? '',
          creatorName: response.data?.exercise?.creatorName ?? '',
          examFrom: response.data?.exercise?.examFrom ?? '',
          accessType: response.data?.exercise?.accessType ?? '',
          exerciseOrder: response.data?.exercise?.exerciseOrder ?? '',
          exerciseStatus: response.data?.exercise?.exerciseStatus ?? '',
          dateCreate: response.data?.exercise?.dateCreate ?? '',
          dateUpdate: response.data?.exercise?.dateUpdate ?? '',
        ),
        result: Result(
          jumlahBenar: response.data?.result?.jumlahBenar ?? '',
          jumlahSalah: response.data?.result?.jumlahSalah ?? '',
          jumlahTidak: response.data?.result?.jumlahTidak ?? '',
          jumlahScore: response.data?.result?.jumlahScore ?? '',
        ),
      ),
    );

    return data;
  }

  @override
  Future<List<ExerciseDataEntity>?> getExercisesByCourse(String courseId) async {
    final response = await remoteDatasource.getExercises(
      courseId: courseId,
      email: FirebaseAuth.instance.currentUser?.email ?? '',
    );

    if (response.data == null) {
      return null;
    }

    final data = ExerciseListResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<ExerciseDataModel>.from(response.data ?? [])
          .map(
            (e) => ExerciseDataEntity(
              exerciseId: e.exerciseId ?? '',
              exerciseTitle: e.exerciseTitle ?? '',
              accessType: e.accessType ?? '',
              icon: e.icon ?? '',
              exerciseUserStatus: e.exerciseUserStatus ?? '',
              jumlahSoal: e.jumlahSoal ?? '',
              jumlahDone: e.jumlahDone ?? 0,
            ),
          )
          .toList(),
    );

    return data.data;
  }

  @override
  Future<List<QuestionListDataEntity>?> getQuestionsByExercise(String exerciseId) async {
    final response = await remoteDatasource.getQuestions(
      exerciseId: exerciseId,
      email: FirebaseAuth.instance.currentUser?.email ?? '',
    );

    if ((response.data ?? []).isEmpty) {
      return null;
    }

    final data = QuestionListResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<QuestionListDataModel>.from(response.data ?? [])
          .map(
            (e) => QuestionListDataEntity(
              exerciseId: e.exerciseId ?? '',
              questionId: e.questionId ?? '',
              questionTitle: e.questionTitle ?? '',
              questionTitleImg: e.questionTitleImg ?? '',
              optionA: e.optionA ?? '',
              optionAImg: e.optionAImg ?? '',
              optionB: e.optionB ?? '',
              optionBImg: e.optionBImg ?? '',
              optionC: e.optionC ?? '',
              optionCImg: e.optionCImg ?? '',
              optionD: e.optionD ?? '',
              optionDImg: e.optionDImg ?? '',
              optionE: e.optionE ?? '',
              optionEImg: e.optionEImg ?? '',
              studentAnswer: e.studentAnswer ?? '',
            ),
          )
          .toList(),
    );

    return data.data;
  }

  @override
  Future<bool> submitExerciseAnswer(SubmitAnswerRequestModel request) async {
    final result = await remoteDatasource.submitAnswers(request: request);

    return result;
  }
}

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:learning/src/data/model/submit_answer_request_model.dart';
import 'package:learning/src/domain/entity/question_list_response_entity.dart';
import 'package:learning/src/presentation/router/routes.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/course/course_bloc.dart';
import '../../../blocs/course/exercise_form_cubit.dart';
import 'question_numbers_bar_widget.dart';

class ExerciseQuestionsFormPage extends StatefulWidget {
  const ExerciseQuestionsFormPage({Key? key}) : super(key: key);

  @override
  State<ExerciseQuestionsFormPage> createState() =>
      _ExerciseQuestionsFormPageState();
}

class _ExerciseQuestionsFormPageState extends State<ExerciseQuestionsFormPage> {
  String exerciseId = '';
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      exerciseId = ModalRoute.of(context)?.settings.arguments as String;
      context
          .read<CourseBloc>()
          .add(GetQuestionsByExerciseEvent(exerciseId: exerciseId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Soal'),
        centerTitle: true,
      ),
      body: BlocConsumer<CourseBloc, CourseState>(
        listener: (context, state) {
          if (state is SuccessSubmitAnswersState) {
            context
                .read<CourseBloc>()
                .add(GetExerciseResultEvent(exerciseId: exerciseId));
          }
          if (state is SuccessGetExercisesResultState) {
            Navigator.pushReplacementNamed(
              context,
              Routes.exerciseResult,
              arguments: state.data.data.result.jumlahScore,
            );
          }
        },
        buildWhen: (previous, current) =>
            (current is LoadingGetQuestionsByCourseState) ||
            (previous is LoadingGetQuestionsByCourseState &&
                current is SuccessGetQuestionsByCourseState) ||
            (previous is LoadingGetQuestionsByCourseState &&
                current is ErrorGetQuestionsByCourseState),
        builder: (context, courseState) {
          List<QuestionListDataEntity> questions = [];
          if (courseState is SuccessGetQuestionsByCourseState) {
            questions = courseState.data;
          }
          if (questions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return BlocBuilder<ExerciseFormCubit, ExerciseFormState>(
            builder: (context, exerciseFormState) {
              int activeQuestionIndex = exerciseFormState.activeQuestionIndex;

              QuestionListDataEntity activeQuestion =
                  questions[activeQuestionIndex];
              String activeQuestionId = exerciseFormState.activeQuestionId;
              String? selectedAnswer = exerciseFormState.questionAnswers
                  .firstWhereOrNull((e) => e.questionId == activeQuestionId)
                  ?.answer;

              return Column(
                children: [
                  // Question Number Horizontal ListView
                  QuestionNumbersBarWidget(
                    questions: questions,
                    activeQuestionId: activeQuestionId,
                    questionAnswers: exerciseFormState.questionAnswers,
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(18),
                      children: [
                        // Judul/Pertanyaan Soal
                        HtmlWidget(
                          activeQuestion.questionTitle,
                        ),
                        // Text(activeQuestion.questionTitle ?? ''),
                        // Opsi Jawaban
                        InkWell(
                          onTap: () {
                            context
                                .read<ExerciseFormCubit>()
                                .updateAnswerToQuestion(
                                  questionId: activeQuestionId,
                                  answer: 'A',
                                );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: selectedAnswer == 'A'
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFD6D6D6),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'A.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: selectedAnswer == 'A'
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Expanded(
                                  child: HtmlWidget(
                                    activeQuestion.optionA,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        RadioListTile(
                          title: Text(activeQuestion.optionB),
                          value: 'B',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            context
                                .read<ExerciseFormCubit>()
                                .updateAnswerToQuestion(
                                  questionId: activeQuestionId,
                                  answer: 'B',
                                );
                          },
                        ),
                        RadioListTile(
                          title: Text(activeQuestion.optionC),
                          value: 'C',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            context
                                .read<ExerciseFormCubit>()
                                .updateAnswerToQuestion(
                                  questionId: activeQuestionId,
                                  answer: 'C',
                                );
                          },
                        ),
                        RadioListTile(
                          title: Text(activeQuestion.optionD),
                          value: 'D',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            context
                                .read<ExerciseFormCubit>()
                                .updateAnswerToQuestion(
                                  questionId: activeQuestionId,
                                  answer: 'D',
                                );
                          },
                        ),
                        RadioListTile(
                          title: Text(activeQuestion.optionE),
                          value: 'E',
                          groupValue: selectedAnswer,
                          onChanged: (val) {
                            context
                                .read<ExerciseFormCubit>()
                                .updateAnswerToQuestion(
                                  questionId: activeQuestionId,
                                  answer: 'E',
                                );
                          },
                        ),

                        if (activeQuestionIndex < questions.length - 1)
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ExerciseFormCubit>()
                                  .navigateToQuestionIndex(
                                    questions: questions,
                                    index: activeQuestionIndex + 1,
                                  );
                            },
                            child: const Text('SELANJUTNYA'),
                          )
                        else
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green)),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: Wrap(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            height: 6,
                                            width: 89,
                                            color: const Color(0xFFC4C4C4),
                                          ),
                                          const SizedBox(height: 16),
                                          const Text(
                                              'Kumpulkan latihan soal sekarang?'),
                                          const SizedBox(height: 16),
                                          Row(
                                            children: [
                                              const SizedBox(width: 32),
                                              Expanded(
                                                child: OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child:
                                                      const Text('Nanti Dulu'),
                                                ),
                                              ),
                                              const SizedBox(width: 32),
                                              Expanded(
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      List<String> questionIds =
                                                          exerciseFormState
                                                              .questionAnswers
                                                              .map((e) =>
                                                                  e.questionId)
                                                              .toList();
                                                      List<String> answers =
                                                          exerciseFormState
                                                              .questionAnswers
                                                              .map((e) =>
                                                                  e.answer)
                                                              .toList();
                                                      context
                                                          .read<CourseBloc>()
                                                          .add(
                                                            SubmitAnswersEvent(
                                                              request:
                                                                  SubmitAnswerRequestModel(
                                                                userEmail: context
                                                                        .read<
                                                                            AuthBloc>()
                                                                        .getCurrentUserEmail() ??
                                                                    '',
                                                                exerciseId:
                                                                    exerciseId,
                                                                questionIds:
                                                                    questionIds,
                                                                answers:
                                                                    answers,
                                                              ),
                                                            ),
                                                          );
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Ya')),
                                              ),
                                              const SizedBox(width: 32),
                                            ],
                                          ),
                                          const SizedBox(height: 32),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: const Text('KUMPULIN'),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

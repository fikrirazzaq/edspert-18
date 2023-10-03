import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/domain/entity/exercise_list_response_entity.dart';

import '../../../../values/colors.dart';
import '../../../../values/margins.dart';
import '../../../blocs/course/course_bloc.dart';
import '../widgets/exercise_grid_item_widget.dart';

class ExerciseListScreenArgs {
  final String courseId;
  final String courseName;

  ExerciseListScreenArgs({
    required this.courseId,
    required this.courseName,
  });
}

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({super.key});

  @override
  State<ExerciseListScreen> createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  String courseName = '';

  @override
  void initState() {
    final dynamic args = ModalRoute.of(context)?.settings.arguments;
    if (args is ExerciseListScreenArgs) {
      courseName = args.courseName;
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CourseBloc>().add(GetCoursesEvent(majorName: 'IPA'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      buildWhen: (prev, next) =>
          next is LoadingGetExercisesByCourseState ||
          prev is LoadingGetExercisesByCourseState && next is SuccessGetExercisesByCourseState ||
          prev is LoadingGetExercisesByCourseState && next is ErrorGetExercisesByCourseState,
      builder: (context, courseState) {
        Widget body = const SizedBox();
        if (courseState is LoadingGetExercisesByCourseState) {
          body = const Center(child: CircularProgressIndicator());
        }

        if (courseState is SuccessGetExercisesByCourseState) {
          body = GridView.builder(
            padding: Margins.paddingPage,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 153 / 96,
            ),
            itemCount: 0,
            itemBuilder: (context, index) {
              ExerciseDataEntity data = courseState.data[index];
              return ExerciseGridItemWidget(
                data: data,
              );
            },
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF3F7F8),
          appBar: AppBar(
            title: Text(courseName),
            backgroundColor: AppColors.bluePrimary,
          ),
          body: body,
        );
      },
    );
  }
}

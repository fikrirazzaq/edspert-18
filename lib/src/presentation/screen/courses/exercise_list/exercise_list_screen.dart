import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning/src/domain/entity/exercise_list_response_entity.dart';

import '../../../../values/colors.dart';
import '../../../../values/margins.dart';
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F8),
      appBar: AppBar(
        title: Text(courseName),
        backgroundColor: AppColors.bluePrimary,
      ),
      body: GridView.builder(
        padding: Margins.paddingPage,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 153 / 96,
        ),
        itemCount: 0,
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}

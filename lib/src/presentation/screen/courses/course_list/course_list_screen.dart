import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/domain/entity/course_list_response_entity.dart';

import '../../../../core/values/colors.dart';
import '../../../../core/values/margins.dart';
import '../../../../core/values/strings.dart';
import '../../../blocs/course/course_bloc.dart';
import '../widgets/course_list_item_widget.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CourseBloc>().add(GetCoursesEvent(majorName: 'IPA'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      buildWhen: (prev, next) =>
          next is LoadingGetCoursesState ||
          prev is LoadingGetCoursesState && next is SuccessGetCoursesState ||
          prev is LoadingGetCoursesState && next is ErrorGetCoursesState,
      builder: (context, courseState) {
        Widget body = const SizedBox();

        // switch (courseState.getCoursesState) {
        //   case LoadingState.init:
        //     break;
        //   case LoadingState.loading:
        //     body = const Center(child: CircularProgressIndicator());
        //     break;
        //   case LoadingState.success:
        //     body = ListView.separated(
        //       padding: Margins.paddingPage,
        //       itemCount: courseState.data!.length,
        //       separatorBuilder: (context, index) => const SizedBox(height: 15),
        //       itemBuilder: (context, index) {
        //         CourseDataEntity data = courseState.data![index];
        //         return CourseListItemWidget(data: data);
        //       },
        //     );
        //     break;
        //   case LoadingState.error:
        //     body = Center(
        //       child: Text(courseState.errorMessage ?? ''),
        //     );
        //     break;
        // }

        if (courseState is LoadingGetCoursesState) {
          body = const Center(child: CircularProgressIndicator());
        }

        if (courseState is SuccessGetCoursesState) {
          body = ListView.separated(
            padding: Margins.paddingPage,
            itemCount: courseState.data.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              CourseDataEntity data = courseState.data[index];
              return CourseListItemWidget(data: data);
            },
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF3F7F8),
          appBar: AppBar(
            title: const Text(Strings.pilihPelajaran),
            backgroundColor: AppColors.bluePrimary,
          ),
          body: body,
        );
      },
    );
  }
}

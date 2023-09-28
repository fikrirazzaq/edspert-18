import 'package:flutter/material.dart';

import '../../../../domain/entity/course_list_response_entity.dart';
import '../../courses/widgets/course_list_item_widget.dart';

class CourseBuilder extends StatelessWidget {
  final List<CourseDataEntity> courseList;

  const CourseBuilder({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: courseList.length > 5 ? 5 : courseList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return CourseListItemWidget(
          data: courseList[index],
        );
      },
    );
  }
}

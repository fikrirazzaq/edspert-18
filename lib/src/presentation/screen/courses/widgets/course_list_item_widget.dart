import 'package:flutter/material.dart';

import '../../../../domain/entity/course_list_response_entity.dart';
import '../../../router/routes.dart';
import '../exercise_list/exercise_list_screen.dart';

class CourseListItemWidget extends StatelessWidget {
  const CourseListItemWidget({
    super.key,
    required this.data,
  });

  final CourseDataEntity data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.exerciseListScreen,
            arguments: ExerciseListScreenArgs(
              courseId: data.courseId,
              courseName: data.courseName,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.network(
              data.urlCover,
              width: 50,
              height: 50,
              errorBuilder: (context, err, _) => Container(
                height: 50,
                width: 50,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(data.courseName),
                  Text('${data.jumlahDone}/${data.jumlahMateri}'),
                  LinearProgressIndicator(
                    value: data.jumlahDone / (data.jumlahMateri == 0 ? 1 : data.jumlahMateri),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

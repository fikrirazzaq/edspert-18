import 'package:flutter/material.dart';

import '../../../../domain/entity/exercise_list_response_entity.dart';
import '../../../router/routes.dart';

class ExerciseGridItemWidget extends StatelessWidget {
  const ExerciseGridItemWidget({
    super.key,
    required this.data,
  });

  final ExerciseDataEntity data;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.of(context).pushNamed(
            Routes.doExerciseScreen,
            arguments: data.exerciseId,
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Image.network(
                data.icon,
                width: 50,
                height: 50,
                errorBuilder: (context, err, _) => Container(
                  height: 50,
                  width: 50,
                  color: Colors.grey,
                ),
              ),
              Text(
                data.exerciseTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text('${data.jumlahDone}/${data.jumlahSoal} Soal'),
            ],
          ),
        ),
      ),
    );
  }
}

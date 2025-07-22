import 'package:flutter/material.dart';
import 'package:taskatii/core/colors.dart';
import 'package:taskatii/core/textStyle.dart';
import 'package:taskatii/models/taskmodel.dart';

class taskItem extends StatelessWidget {
  final Taskmodel task;
  const taskItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          color: task.Color == 0
              ? AppColor.primary
              : task.Color == 1
                  ? Colors.amberAccent
                  : Colors.red,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: getTitleStyle(txtcolor: Colors.white, fontSize: 20),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  Text(
                    ' ${task.startTime}-${task.endTime}',
                    style: getSmallStyle(txtcolor: Colors.white),
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 1,
            height: 50,
            color: Colors.white,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'TODO',
              style: getBodyStyle(
                  txtcolor: Colors.white, fontWight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskatii/core/colors.dart';
import 'package:taskatii/core/textStyle.dart';
import 'package:taskatii/core/widgets/task_item.dart';
import 'package:taskatii/models/taskmodel.dart';

class Completedtaskpage extends StatefulWidget {
  const Completedtaskpage({super.key});

  @override
  State<Completedtaskpage> createState() => _CompletedtaskpageState();
}

class _CompletedtaskpageState extends State<Completedtaskpage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var taskBox = Hive.box('tasks');
    var allTasks = taskBox.values.toList();
    String formattedSelectedDate =
        DateFormat('dd/MM/yyyy').format(selectedDate);
    List<Taskmodel> filteredTasks = allTasks
        .where((element) {
          if (element is Taskmodel) {
            return element.isCompleted == true &&
                element.date == formattedSelectedDate;
          }
          return false;
        })
        .map((e) => e as Taskmodel)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Completed Tasks',
          style: getTitleStyle(txtcolor: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DatePicker(
              height: 100,
              DateTime.now(),
              initialSelectedDate: selectedDate,
              selectionColor: AppColor.primary,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTasks.length,
                itemBuilder: (context, index) {
                  return taskItem(task: filteredTasks[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

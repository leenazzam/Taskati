import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskatii/core/colors.dart';
import 'package:taskatii/core/functions/navigations.dart';
import 'package:taskatii/core/textStyle.dart';
import 'package:taskatii/core/widgets/coustom_botton.dart';
import 'package:taskatii/core/widgets/header.dart';
import 'package:taskatii/core/widgets/task_item.dart';
import 'package:taskatii/features/home/addTask.dart';
import 'package:taskatii/models/taskmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var userBox = Hive.box('user');
    String name = userBox.get('name');
    String path = userBox.get('image');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 1,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
            child: Column(
          children: [
            header(
              title: 'Hello,$name',
              bodytxt: 'Have a Nice Day!',
              coustomWidget: CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(File(path)),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            header(
                title: DateFormat.yMMMd().format(DateTime.now()),
                bodytxt: 'Today',
                coustomWidget: coustomBotton(
                  onPress: () {
                    pushTO(context, const Addtask());
                  },
                  txt: '+ Add Task',
                  width: 150,
                  txtColor: Colors.white,
                )),
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(
              height: 13,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box('tasks').listenable(),
                builder: (context, Box taskBox, child) {
                  var allTasks = taskBox.values.toList();
                  String formattedSelectedDate =
                      DateFormat('dd/MM/yyyy').format(selectedDate);

                  List<Taskmodel> tasks = allTasks
                      .where((element) =>
                          element is Taskmodel &&
                          element.date == formattedSelectedDate &&
                          element.isCompleted == false)
                      .map((e) => e as Taskmodel)
                      .toList();

                  if (tasks.isEmpty) {
                    return const Center(child: Text('No tasks for this date.'));
                  }

                  return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              Taskmodel task = tasks[index];
                              setState(() {
                                task.isCompleted = true;
                                taskBox.put(task.id, task);
                              });
                            } else {
                              taskBox.deleteAt(index);
                            }
                          },
                          key: UniqueKey(),
                          background: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Delete',
                                  style: getSmallStyle(txtcolor: Colors.white),
                                )
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.done_all_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' Done',
                                  style: getSmallStyle(txtcolor: Colors.white),
                                )
                              ],
                            ),
                          ),
                          child: taskItem(
                            task: tasks[index],
                          ),
                        );
                      });
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}

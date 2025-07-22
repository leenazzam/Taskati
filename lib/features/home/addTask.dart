import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskatii/core/colors.dart';
import 'package:taskatii/core/textStyle.dart';
import 'package:taskatii/core/widgets/coustom_botton.dart';
import 'package:taskatii/models/taskmodel.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  var formKey = GlobalKey<FormState>();
  int isSelected = 0;
  var titlecontroller = TextEditingController();
  var notecontroller = TextEditingController();
  var datecontroller = TextEditingController(
      text: DateFormat("dd/MM/yyy").format(DateTime.now()));
  var startTimecontroller =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  var endTimwcontroller =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: getTitleStyle(txtcolor: Colors.white),
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: getTitleStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: titlecontroller,
                    validator: (value) {
                      if (value != null) {
                        if (value.length <= 2) {
                          return 'invalid input';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Notes',
                    style: getTitleStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    maxLines: 4,
                    controller: notecontroller,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Date',
                    style: getTitleStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2028))
                          .then((value) {
                        if (value != null) {
                          datecontroller.text =
                              DateFormat('dd/MM/yyy').format(value);
                        }
                      });
                    },
                    controller: datecontroller,
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.date_range_rounded,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Time',
                              style: getTitleStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  if (value != null) {
                                    startTimecontroller.text =
                                        value.format(context);
                                  }
                                });
                              },
                              controller: startTimecontroller,
                              readOnly: true,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.access_time_sharp,
                                  color: AppColor.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'End Time',
                              style: getTitleStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  if (value != null) {
                                    endTimwcontroller.text =
                                        value.format(context);
                                  }
                                });
                              },
                              controller: endTimwcontroller,
                              readOnly: true,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.access_time_sharp,
                                  color: AppColor.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = index;
                                });
                              },
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: index == 0
                                    ? AppColor.primary
                                    : index == 1
                                        ? Colors.amber
                                        : Colors.red,
                                child: isSelected == index
                                    ? const Icon(Icons.check,
                                        color: Colors.white)
                                    : null,
                              ),
                            ),
                          );
                        }),
                      ),
                      const Spacer(),
                      coustomBotton(
                          txt: 'Create',
                          txtColor: Colors.white,
                          width: 150,
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              TimeOfDay? start = TimeOfDay(
                                hour: int.parse(
                                    startTimecontroller.text.split(':')[0]),
                                minute: int.parse(startTimecontroller.text
                                    .split(':')[1]
                                    .split(' ')[0]),
                              );

                              TimeOfDay? end = TimeOfDay(
                                hour: int.parse(
                                    endTimwcontroller.text.split(':')[0]),
                                minute: int.parse(endTimwcontroller.text
                                    .split(':')[1]
                                    .split(' ')[0]),
                              );

                              final startMinutes =
                                  start.hour * 60 + start.minute;
                              final endMinutes = end.hour * 60 + end.minute;

                              if (startMinutes >= endMinutes) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Start Time must be before End Time.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }
                              Taskmodel newTask = Taskmodel(
                                id: UniqueKey().toString(),
                                title: titlecontroller.text,
                                note: notecontroller.text,
                                date: datecontroller.text,
                                startTime: startTimecontroller.text,
                                endTime: endTimwcontroller.text,
                                Color: isSelected,
                                isCompleted: false,
                              );

                              var taskBox = Hive.box('tasks');
                              taskBox.put(newTask.id, newTask);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Task created successfully'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pop(context);
                            }
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

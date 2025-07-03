import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskatii/core/colors.dart';
import 'package:taskatii/core/textStyle.dart';
import 'package:taskatii/core/widgets/coustom_botton.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: getTitleStyle(),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: titlecontroller,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Notes',
                style: getTitleStyle(),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                maxLines: 4,
                controller: notecontroller,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Date',
                style: getTitleStyle(),
              ),
              SizedBox(
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
              SizedBox(
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
                        SizedBox(
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
                  SizedBox(
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
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              if (value != null) {
                                endTimwcontroller.text = value.format(context);
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
              SizedBox(
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
                                ? Icon(Icons.check, color: Colors.white)
                                : null,
                          ),
                        ),
                      );
                    }),
                  ),
                  Spacer(),
                  coustomBotton(
                    txt: 'Create',
                    onPress: () {
                      Navigator.pop(context);
                    },
                    txtColor: Colors.white,
                    width: 150,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskatii/core/colors.dart';
import 'package:taskatii/core/functions/navigations.dart';
import 'package:taskatii/core/textStyle.dart';
import 'package:taskatii/core/widgets/coustom_botton.dart';
import 'package:taskatii/core/widgets/header.dart';
import 'package:taskatii/features/home/addTask.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userBox = Hive.box('user');
    String name = userBox.get('name');
    String path = userBox.get('image');

    return Scaffold(
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
                    pushTO(context, Addtask());
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
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColor.primary,
              selectedTextColor: Colors.white,
              onDateChange: (date) {},
            ),
            const SizedBox(
              height: 13,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Icon(
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
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
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
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Flutter Task',
                                  style: getTitleStyle(
                                      txtcolor: Colors.white, fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.watch_later_outlined,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    Text(
                                      ' 11:00 AM - 3:AM',
                                      style:
                                          getSmallStyle(txtcolor: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
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
                                    txtcolor: Colors.white,
                                    fontWight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        )),
      ),
    );
  }
}

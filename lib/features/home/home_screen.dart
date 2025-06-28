import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskatii/core/colors.dart';
import 'package:taskatii/core/textStyle.dart';
import 'package:taskatii/core/widgets/coustom_botton.dart';
import 'package:taskatii/core/widgets/header.dart';

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
              title: 'HELLO,${name}',
              bodytxt: 'Have a Nice Day!',
              coustomWidget: CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(File(path)),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            header(
                title: DateFormat.yMMMd().format(DateTime.now()),
                bodytxt: 'Today',
                coustomWidget: coustomBotton(
                  onPress: () {},
                  txt: '+ Add Task',
                  width: 150,
                  txtColor: Colors.white,
                )),
            SizedBox(
              height: 20,
            ),
            DatePicker(
              height: 100,
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColor().primary,
              selectedTextColor: Colors.white,
              onDateChange: (date) {},
            ),
          ],
        )),
      ),
    );
  }
}

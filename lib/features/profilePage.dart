import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:taskatii/core/colors.dart';
import 'package:taskatii/core/functions/navigations.dart';
import 'package:taskatii/core/textStyle.dart';
import 'package:taskatii/core/widgets/coustom_botton.dart';
import 'package:taskatii/features/home/home_screen.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();

    var userBox = Hive.box('user');
    String name = userBox.get('name');
    String path = userBox.get('image');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: getTitleStyle(txtcolor: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 150,
                  backgroundImage: FileImage(File(path)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '@$name',
                  style: getTitleStyle(txtcolor: Colors.black, fontSize: 25),
                ),
                Text(
                  DateFormat.yMMMd().format(DateTime.now()),
                  style: getTitleStyle(txtcolor: Colors.black38, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Update Your Name...",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: AppColor.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: AppColor.primary)),
                    )),
                SizedBox(
                  height: 10,
                ),
                coustomBotton(
                  onPress: () {
                    setState(() {
                      userBox.put('name', nameController.text);
                    });
                  },
                  txt: 'update name',
                  width: 150,
                  txtColor: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                coustomBotton(
                  onPress: () async {
                    await ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          path = value.path;
                          userBox.put('image', path);
                        });
                      }
                    });
                  },
                  txt: 'update Photo',
                  width: 150,
                  txtColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

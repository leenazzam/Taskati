import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskatii/core/colors.dart';
import 'package:taskatii/core/functions/navigations.dart';
import 'package:taskatii/core/textStyle.dart';
import 'package:taskatii/core/widgets/coustom_botton.dart';
import 'package:taskatii/features/home/home_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
  var nameController = TextEditingController();
  var nameFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              if (nameFormKey.currentState!.validate() && path != null) {
                var userBox = Hive.box('user');
                userBox.put('name', nameController.text);
                userBox.put('image', path);
                userBox.put('isUploaded', true);
                pushWithRep(context, const HomeScreen());
              } else if (path == null) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "ERROR",
                          style: getTitleStyle(),
                        ),
                        content: Text(
                          "Please select a Photo!",
                          style: getSmallStyle(fontSize: 22),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "OK",
                                style: getSmallStyle(fontSize: 21),
                              ))
                        ],
                      );
                    });
              }
            },
            child: Text(
              "DONE",
              style: getSmallStyle(),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: path != null
                  ? FileImage(File(path!))
                  : const NetworkImage("https://picsum.photos/200"),
            ),
            const SizedBox(
              height: 15,
            ),
            coustomBotton(
              txt: "Upload From Camera",
              onPress: () async {
                await ImagePicker()
                    .pickImage(source: ImageSource.camera)
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      path = value.path;
                    });
                  }
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            coustomBotton(
              txt: "Upload From Gallery",
              onPress: () async {
                await ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((img) {
                  if (img != null) {
                    setState(() {
                      path = img.path;
                    });
                  }
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: AppColor.primary,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: nameFormKey,
              child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name is required";
                    } else if (!RegExp('^[A-Z][a-z]').hasMatch(value))
                      return "first letter must be capital!!";
                    else
                      return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Your Name...",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColor.primary)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColor.primary)),
                  )),
            )
          ],
        )),
      ),
    );
  }
}

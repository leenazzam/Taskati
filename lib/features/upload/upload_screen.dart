import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskatii/core/widgets/coustom_botton.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  path = value.path;
                  setState(() {});
                }
              });
            },
          ),
          coustomBotton(
            txt: "Upload From Gallery",
            onPress: () async {
              await ImagePicker()
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (value != null) {
                  path = value.path;
                  setState(() {});
                }
              });
            },
          ),
        ],
      )),
    );
  }
}

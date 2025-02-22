import 'package:flutter/material.dart';
import 'package:taskatii/core/widgets/coustom_botton.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xffEADDFF),
          ),
          SizedBox(
            height: 15,
          ),
          coustomBotton(
            txt: "Upload From Camera",
          ),
          SizedBox(
            height: 3,
          ),
          coustomBotton(
            txt: "Upload From Gallery",
          ),
        ],
      )),
    );
  }
}

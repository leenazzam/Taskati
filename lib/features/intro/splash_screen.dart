import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:taskatii/core/functions/navigations.dart';
import 'package:taskatii/core/textStyle.dart';
import 'package:taskatii/features/home/home_screen.dart';
import 'package:taskatii/features/nav.dart';
import 'package:taskatii/features/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    var userBox = Hive.box('user');
    bool isUploaded = userBox.get('isUploaded') ?? false;
    Future.delayed(const Duration(seconds: 5), () {
      if (isUploaded) {
        pushWithRep(context, const Nav());
      } else {
        pushWithRep(context, const UploadScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "lib/assets/images/taskSplash.json",
          ),
          Text(
            "Taskati",
            style: getTitleStyle(),
          ),
          Text(
            "It's time to get organized",
            style: getBodyStyle(),
          )
        ],
      )),
    );
  }
}

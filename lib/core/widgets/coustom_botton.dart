import 'package:flutter/material.dart';

class coustomBotton extends StatelessWidget {
  final String txt;
  final double width;
  final double hight;
  final Color? bgColor;
  final Color? txtColor;
  final Function onPress;

  const coustomBotton(
      {super.key,
      required this.txt,
      required this.onPress,
      this.bgColor,
      this.hight = 45,
      this.txtColor,
      this.width = 250});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: hight,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: bgColor ?? const Color(0xff4E5AE7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPress(),
          child: Text(
            txt,
            style: TextStyle(
                color: txtColor ?? const Color.fromARGB(255, 23, 17, 17),
                fontWeight: FontWeight.w500),
          )),
    );
  }
}

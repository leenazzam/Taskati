import 'package:flutter/material.dart';

class coustomBotton extends StatelessWidget {
  var txt;

  coustomBotton({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff4E5AE7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {},
          child: Text(
            txt,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          )),
    );
  }
}

import 'package:flutter/material.dart';

TextStyle getTitleStyle({double? fontSize, FontWeight? fontWight}) {
  return TextStyle(
    fontSize: fontSize ?? 30,
    fontWeight: fontWight ?? FontWeight.bold,
  );
}

TextStyle getBodyStyle({double? fontSize, FontWeight? fontWight}) {
  return TextStyle(
      fontSize: fontSize ?? 15,
      fontWeight: fontWight ?? FontWeight.normal,
      color: Colors.grey);
}

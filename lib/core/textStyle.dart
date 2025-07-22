import 'package:flutter/material.dart';
import 'package:taskatii/core/colors.dart';

TextStyle getTitleStyle(
    {double? fontSize, FontWeight? fontWight, Color? txtcolor}) {
  return TextStyle(
    fontSize: fontSize ?? 30,
    fontWeight: fontWight ?? FontWeight.bold,
    color: txtcolor ?? AppColor.primary,
  );
}

TextStyle getBodyStyle(
    {double? fontSize, FontWeight? fontWight, Color? txtcolor}) {
  return TextStyle(
      fontSize: fontSize ?? 20,
      fontWeight: fontWight ?? FontWeight.normal,
      color: txtcolor ?? Colors.grey);
}

TextStyle getSmallStyle(
    {double? fontSize, FontWeight? fontWight, Color? txtcolor}) {
  return TextStyle(
      fontSize: fontSize ?? 12,
      fontWeight: fontWight ?? FontWeight.bold,
      color: txtcolor ?? AppColor.primary);
}

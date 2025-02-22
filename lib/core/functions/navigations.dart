import 'package:flutter/material.dart';

pushTO(BuildContext context, Widget nextSreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return nextSreen;
  }));
}

pushWithRep(BuildContext context, Widget nextSreen) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return nextSreen;
  }));
}

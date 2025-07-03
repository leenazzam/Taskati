import 'package:flutter/material.dart';
import 'package:taskatii/core/textStyle.dart';

class header extends StatelessWidget {
  const header({
    super.key,
    required this.title,
    required this.bodytxt,
    required this.coustomWidget,
  });

  final String title;
  final String bodytxt;

  final Widget coustomWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: getSmallStyle(fontSize: 18),
            ),
            Text(
              bodytxt,
              style: getSmallStyle(fontSize: 25),
            )
          ],
        ),
        coustomWidget,
      ],
    );
  }
}

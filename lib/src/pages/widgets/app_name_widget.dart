import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  final Color? greenTitleColor;
  final double textSize;
  const AppNameWidget({super.key, this.greenTitleColor, this.textSize = 30});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(style: TextStyle(fontSize: textSize), children: [
      TextSpan(
          text: 'Green',
          style: TextStyle(
              color: greenTitleColor ?? Colors.green,
              fontWeight: FontWeight.bold)),
      const TextSpan(
          text: 'grocer',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
    ]));
  }
}

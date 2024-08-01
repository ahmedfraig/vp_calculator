import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalcButton extends StatelessWidget {
  var text;
  Color color;
  Color textColor;
  final onTapped;
  CalcButton(
      {required this.text,
      required this.color,
      required this.textColor,
      required this.onTapped,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      child: MaterialButton(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(fontSize: 35, color: textColor),
              )),
          onPressed: onTapped),
    );
  }
}

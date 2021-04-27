import 'dart:io';
import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.title});

  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: LargeBtnTextStyle,
          ),
        ),
        color: primaryColor,
        margin: EdgeInsets.only(top: 12),
        padding: Platform.isIOS ? EdgeInsets.only(bottom: 16) : null,
        width: double.infinity,
        height: 72,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 0,
      constraints: BoxConstraints.tightFor(width: 48, height: 48),
      shape: CircleBorder(),
      fillColor: lightGray,
    );
  }
}

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final TextStyle style;
  final onPressCallback onPress;
  final String text;
  const Button(this.onPress, this.style, this.text);

  @override
  Widget build(BuildContext context) {

  return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width*(0.75),
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () => onPress(),
          child: Text(text,
              textAlign: TextAlign.center,
              style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
        )
      );
  }
}

typedef onPressCallback = void Function();
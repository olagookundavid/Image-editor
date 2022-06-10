import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.child,
      required this.color,
      required this.textcolor,
      required this.onpressed})
      : super(key: key);
  final Widget child;
  final Color color;
  final Color textcolor;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: textcolor),
          )),
      onPressed: onpressed,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.tooltip,
  }) : super(key: key);
  final Function() onPressed;
  final IconData icon;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.black),
      tooltip: tooltip,
    );
  }
}

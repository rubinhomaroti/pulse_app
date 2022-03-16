import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.icon,
    required this.text,
    this.style,
    this.iconColor = Colors.white,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final TextStyle? style;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16.0, color: iconColor),
        Text(text, style: style),
      ],
    );
  }
}

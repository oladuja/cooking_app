import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  final Color color;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}

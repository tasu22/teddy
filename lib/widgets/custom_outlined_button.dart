import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double borderWidth;
  final Color borderColor;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderWidth = 2,
    this.borderColor = const Color(0xFF008080),
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor, width: borderWidth),
      ),
      child: child,
    );
  }
}

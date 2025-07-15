import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? fontSize;
  final double? height;
  final double? borderRadius;

  const CommonButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fontSize,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          fontSize: fontSize ?? 18,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: backgroundColor ?? Colors.purple,
        foregroundColor: foregroundColor ?? Colors.white,
        minimumSize: Size(double.infinity, height ?? 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

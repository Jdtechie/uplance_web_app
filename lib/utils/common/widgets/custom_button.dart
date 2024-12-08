import 'package:flutter/material.dart';
import 'package:uplance_flutter_web/responsive_screen.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final IconData? trailingIcon;
  final double? iconSize;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? btnWidth;
  final double? btnHeight;
  final EdgeInsetsGeometry? padding; // Dynamic padding
  final double? gap; // Dynamic gap between text and icon

  const CustomButton({
    super.key,
    this.buttonText,
    required this.onPressed,
    this.trailingIcon,
    this.backgroundColor = Colors.black, // Default background color
    this.textStyle = const TextStyle(color: Colors.white), // Default text style
    this.btnWidth,
    this.btnHeight,
    this.padding,
    this.gap,
    this.iconSize, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth,
      height: btnHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          padding: padding, // Use dynamic padding
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              buttonText!,
              style: textStyle,
            ),
            if (trailingIcon != null) // Show icon if provided
              SizedBox(width: gap), // Dynamic gap
            if (trailingIcon != null)
              Icon(
                trailingIcon,
                size: iconSize,
                color: textStyle?.color ?? Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final IconData trailingIcon;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Color? iconColor;

  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.trailingIcon,
    required this.onPressed,
    this.textStyle,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            buttonText,
            style: textStyle ??
                GoogleFonts.manrope(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
          ),
          const SizedBox(width: 8), // Space between text and icon
          Icon(
            trailingIcon,
            color: iconColor ?? Colors.black,
          ),
        ],
      ),
    );
  }
}

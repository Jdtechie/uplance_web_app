import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplance_flutter_web/responsive_screen.dart';

class CustomContainer extends StatelessWidget {
  final String? leadingSvgPath;
  final String title;
  final String subtitle;
  final double containerHeight;
  final double containerWidth;

  // Dynamic properties
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double? svgWidth;
  final double? svgHeight;

  const CustomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.containerHeight,
    required this.containerWidth,
    this.leadingSvgPath,
    this.titleStyle,
    this.subtitleStyle,
    this.svgWidth,
    this.svgHeight,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);

    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading SVG Icon
          if (leadingSvgPath != null)
            Padding(
              padding: isMobile
                  ? const EdgeInsets.only(top: 0)
                  : const EdgeInsets.only(top: 4.0),
              child: SvgPicture.asset(
                leadingSvgPath!,
                width: svgWidth ?? 18, // Default width if not provided
                height: svgHeight ?? 18, // Default height if not provided
              ),
            ),
          const SizedBox(width: 16),

          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle ??
                      GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                // const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    subtitle,
                    style: subtitleStyle ??
                        GoogleFonts.manrope(
                          fontSize:  16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

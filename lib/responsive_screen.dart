import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopScreen;
  final Widget? tabletScreen;
  final Widget? mobileScreen;

  const ResponsiveWidget({
    super.key,
    required this.desktopScreen,
    this.tabletScreen,
    this.mobileScreen,
  });

  // Breakpoint checks
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 768 && width <=1024;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 1024;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1024) {
          // Desktop breakpoint
          return desktopScreen;
        } else if (constraints.maxWidth >= 768) {
          // Tablet breakpoint
          return tabletScreen ?? desktopScreen;
        } else {
          // Mobile breakpoint
          return mobileScreen ?? desktopScreen;
        }
      },
    );
  }
}

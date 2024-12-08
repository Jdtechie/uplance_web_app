import 'package:flutter/material.dart';
import 'package:uplance_flutter_web/responsive_screen.dart';
import 'package:uplance_flutter_web/utils/common/text_strings.dart';
import 'package:uplance_flutter_web/utils/common/widgets/custom_button.dart';
import 'package:uplance_flutter_web/utils/common/widgets/custom_search_bar.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isMobile = ResponsiveWidget.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 150
            : isTablet
                ? 50
                : 20,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Get More Done',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop
                  ? 100
                  : isTablet
                      ? 60
                      : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Post Any Task. Pick The Best Person. Get It Done.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop
                  ? 22
                  : isTablet
                      ? 18
                      : 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),
          const CustomSearchBar(),
          const SizedBox(height: 24),
          Image.asset(
            heroBannerImage,
            height: isDesktop
                ? 500
                : isTablet
                    ? 350
                    : 250,
            width: isDesktop
                ? 900
                : isTablet
                    ? 600
                    : double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          CustomButton(
            btnHeight: isMobile ? 38 : 50,
            btnWidth: isDesktop
                ? 300
                : isTablet
                    ? 280
                    : 227,
            buttonText: 'Earn Money as a Tasker',
            padding: EdgeInsets.symmetric(
               horizontal: isMobile ? 10 : 18),
            onPressed: () {},
            textStyle: TextStyle(
              fontSize: isMobile ? 14 : 17,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            gap: isMobile ? 8 : 12,
            trailingIcon: Icons.arrow_forward_sharp,
                   iconSize: isMobile ? 18 : 22,

          ),
        ],
      ),
    );
  }
}


// class HeroSection extends StatelessWidget {
//   const HeroSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenTypeLayout.builder(
//       mobile: (context) => _buildMobileLayout(),
//       tablet: (context) => _buildTabletLayout(),
//       desktop: (context) => _buildDesktopLayout(),
//     );
//   }

//   Widget _buildMobileLayout() {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//           horizontal: 20, vertical: 30), // Smaller padding for mobile
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'Get More Done',
//             textAlign: TextAlign.center,
//             style: GoogleFonts.manrope(
//               fontSize: 36, // Adjust font size for mobile
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Post Any Task. Pick The Best Person. Get It Done.',
//             textAlign: TextAlign.center,
//             style: GoogleFonts.manrope(
//               fontSize: 16, // Adjust font size for mobile
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[700],
//             ),
//           ),
//           const SizedBox(height: 24),
//           const CustomSearchBar(),
//           Image.asset(
//             heroBannerImage,
//             height: 250, // Adjust image size for mobile
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           CustomButton(
//             btnHeight: 50,
//             btnWidth: 270, // Adjust button size for mobile
//             buttonText: 'Earn Money as a Tasker',
//             onPressed: () {},
//             textStyle: GoogleFonts.manrope(
//               fontSize: 16, // Adjust font size for mobile
//               fontWeight: FontWeight.w500,
//               color: Colors.white,
//             ),
//             trailingIcon: Icons.arrow_forward_sharp,
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildTabletLayout() {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//           horizontal: 50, vertical: 50), // Medium padding for tablet
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'Get More Done',
//             style: GoogleFonts.manrope(
//               fontSize: 60, // Adjust font size for tablet
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Post Any Task. Pick The Best Person. Get It Done.',
//             style: GoogleFonts.manrope(
//               fontSize: 18, // Adjust font size for tablet
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[700],
//             ),
//           ),
//           const SizedBox(height: 24),
//           const CustomSearchBar(),
//           Image.asset(
//             heroBannerImage,
//             height: 350, // Adjust image size for tablet
//             width: 600, // Limit image width for tablet
//             fit: BoxFit.cover,
//           ),
//           CustomButton(
//             btnHeight: 50,
//             btnWidth: 280, // Adjust button size for tablet
//             buttonText: 'Earn Money as a Tasker',
//             onPressed: () {},
//             textStyle: GoogleFonts.manrope(
//               fontSize: 17, // Adjust font size for tablet
//               fontWeight: FontWeight.w500,
//               color: Colors.white,
//             ),
//             trailingIcon: Icons.arrow_forward_sharp,
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildDesktopLayout() {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//           horizontal: 175, vertical: 50), // Large padding for desktop
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'Get More Done',
//             style: GoogleFonts.manrope(
//               fontSize: 100, // Keep large font size for desktop
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Post Any Task. Pick The Best Person. Get It Done.',
//             style: GoogleFonts.manrope(
//               fontSize: 22, // Larger font size for desktop
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[700],
//             ),
//           ),
//           const SizedBox(height: 24),
//           const CustomSearchBar(),
//           Image.asset(
//             heroBannerImage,
//             height: 496, // Keep large image for desktop
//             width: 930, // Large width for desktop
//           ),
//           CustomButton(
//             btnHeight: 50,
//             btnWidth: 297, // Keep large button size for desktop
//             buttonText: 'Earn Money as a Tasker',
//             onPressed: () {},
//             textStyle: GoogleFonts.manrope(
//               fontSize: 17,
//               fontWeight: FontWeight.w500,
//               color: Colors.white,
//             ),
//             trailingIcon: Icons.arrow_forward_sharp,
//           )
//         ],
//       ),
//     );
//   }
// }


// //================ for Landing Page ======================///


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:uplance_flutter_web/utils/common/widgets/custom_search_bar.dart';
// import 'package:uplance_flutter_web/utils/common/widgets/custom_button.dart';
// import 'package:uplance_flutter_web/utils/common/text_strings.dart';

// class HeroSection extends StatelessWidget {
//   final bool isMobile;
//   final bool isTablet;

//   const HeroSection({super.key, this.isMobile = false, this.isTablet = false});

//   @override
//   Widget build(BuildContext context) {
//     double titleFontSize = isMobile
//         ? 32
//         : isTablet
//             ? 64
//             : 100;
//     double subtitleFontSize = isMobile ? 16 : 22;
//     EdgeInsets padding = isMobile
//         ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
//         : const EdgeInsets.symmetric(horizontal: 175, vertical: 50);

//     return Container(
//       padding: padding,
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Text(
//               'Get More Done',
//               style: GoogleFonts.manrope(
//                 fontSize: titleFontSize,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Post Any Task. Pick The Best Person. Get It Done.',
//             style: GoogleFonts.manrope(
//               fontSize: subtitleFontSize,
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[700],
//             ),
//           ),
//           const SizedBox(height: 24),
//           const CustomSearchBar(),
//           if (!isMobile)
//             Image.asset(
//               heroBannerImage,
//               height: isTablet ? 400 : 496,
//               width: isTablet ? 720 : 930,
//             ),
//           CustomButton(
//             btnHeight: 50,
//             btnWidth: isMobile ? double.infinity : 297,
//             buttonText: 'Earn Money as a Tasker',
//             onPressed: () {},
//             textStyle: GoogleFonts.manrope(
//               fontSize: 17,
//               fontWeight: FontWeight.w500,
//               color: Colors.white,
//             ),
//             trailingIcon: Icons.arrow_forward_sharp,
//           ),
//         ],
//       ),
//     );
//   }
// }


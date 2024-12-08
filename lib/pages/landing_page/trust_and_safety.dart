import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uplance_flutter_web/responsive_screen.dart';
import 'package:uplance_flutter_web/utils/common/text_strings.dart';
import 'package:uplance_flutter_web/utils/common/widgets/custom_container.dart';

class TrustAndSafetySection extends StatelessWidget {
  const TrustAndSafetySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isMobile = ResponsiveWidget.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 45
            : isTablet
                ? 25
                : 0,
      ),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: isDesktop ? 635 : null,
          decoration: BoxDecoration(
            borderRadius: isMobile ? null : BorderRadius.circular(16),
            color: 
            // Colors.amber,
            const Color(0xffFBFBF8),
          ),
          child: _buildContent(context)),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (ResponsiveWidget.isDesktop(context)) {
      return Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 2,
            child: _buildLeftPart(context, largeLogo: true),
          ),
          Expanded(
            flex: 1,
            child: _buildGreenPart(context),
          ),
        ],
      );
    } else if (ResponsiveWidget.isTablet(context)) {
      return Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 2,
            child: _buildLeftPart(context),
          ),
          Expanded(
            flex: 1,
            child: _buildGreenPart(context),
          ),
        ],
      );
    } else {
      return Flex(
        direction: Axis.vertical,
        children: [
          _buildLeftPart(context),
          _buildGreenPart(context),
        ],
      );
    }
  }

  Widget _buildLeftPart(BuildContext context, {bool largeLogo = false}) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isMobile = ResponsiveWidget.isMobile(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile ? 12.0 : 14.0, horizontal: isDesktop ? 25 : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitle(context),
          SizedBox(height: isDesktop ? 0 : 45),
          _buildFeature(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    return Text(
      'Trust and safety\nfeatures for your\nprotection',
      style: GoogleFonts.manrope(
        fontSize: isDesktop
            ? 65
            : isTablet
                ? 42
                : 35,
        height: 1.2,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget _buildFeature(BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isMobile = ResponsiveWidget.isMobile(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFeatureItems(
            svgPath: roundedDollarIcon,
            title: 'Secure payments',
            subtitle: isMobile
                ? 'Only release payment when the task is\ncompleted to your satisfaction'
                : isTablet
                    ? 'Only release payment when the task is\ncompleted to your satisfaction'
                    : 'Only release payment when the task is completed to\nyour satisfaction',
            context: context),
        const SizedBox(height: 12),
        _buildFeatureItems(
            svgPath: trustedRatingsIcon,
            title: 'Trusted ratings and reviews',
            subtitle: isMobile
                ? 'Pick the right person for the task based on\nreal ratings and reviews from other users'
                : isTablet
                    ? 'Pick the right person for the task based on\nreal ratings and reviews from other users'
                    : 'Pick the right person for the task based on real\nratings and reviews from other users',
            context: context),
        const SizedBox(height: 12),
        _buildFeatureItems(
            svgPath: trustedRatingsIcon,
            title: 'Insurance for peace of mind',
            subtitle: isDesktop
                ? 'We provide liability insurance for Taskers performing\nmost task activities'
                : 'We provide liability insurance for Taskers\nperforming most task activities',
            context: context),
      ],
    );
  }

  Widget _buildFeatureItems(
      {required String svgPath,
      required String title,
      required String subtitle,
      required BuildContext context}) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isMobile = ResponsiveWidget.isMobile(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: isMobile
              ? const EdgeInsets.only(top: 2.0)
              : const EdgeInsets.only(top: 4.0),
          child: SvgPicture.asset(
            svgPath,
            height: 18,
            width: 18,
            //  alignment: Alignment.center,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.manrope(
                  fontSize: isDesktop
                      ? 22
                      : isTablet
                          ? 19
                          : 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.manrope(
                  fontSize: isDesktop
                      ? 17
                      : isTablet
                          ? 13
                          : 12,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGreenPart(BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isMobile = ResponsiveWidget.isMobile(context);
    return Container(
      width: isMobile ? MediaQuery.of(context).size.width : 400,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16.0 : isTablet? 25 : 35 , vertical: isMobile ? 16.0 : isTablet? 25 : 35),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: isMobile ? null : BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildRatingBox(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: isMobile ? 15.0 : 50.0),
                child: Text(
                  'We’re\nthe world’s work\nmarketplace',
                  style: GoogleFonts.manrope(
                    fontSize: isDesktop
                        ? 38
                        : isTablet
                            ? 28
                            : 35,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 15 : 45),
              CustomContainer(
                containerHeight: isMobile ? 92 : 65,
                containerWidth: double.infinity,
                leadingSvgPath: whiteStarRatingIcon,
                title: '4.9/5',
                titleStyle: GoogleFonts.manrope(
                    fontSize: isDesktop ? 21 : 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                subtitle: isMobile
                    ? 'Clients rate\nprofessionals on\nUpwork'
                    : 'Clients rate professionals on Upwork',
                subtitleStyle: GoogleFonts.manrope(
                    fontSize: isDesktop ? 15 : 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              CustomContainer(
                containerHeight: isMobile ? 92 : 65,
                containerWidth: double.infinity,
                leadingSvgPath: g2Icon,
                title: 'Award winner',
                titleStyle: GoogleFonts.manrope(
                    fontSize: isDesktop ? 21 : 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                subtitle: isMobile
                    ? 'G2’s 2021 Best\nSoftware Awards'
                    : 'G2’s 2021 Best Software Awards',
                subtitleStyle: GoogleFonts.manrope(
                    fontSize: isDesktop ? 15 : 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBox(BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '5.0',
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.star, color: Colors.amber, size: 20),
            ],
          ),
          const SizedBox(width: 8),
          Text(
            'Overall Rating',
            style: GoogleFonts.manrope(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// class TrustAndSafetySection extends StatelessWidget {
//   const TrustAndSafetySection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenTypeLayout.builder(
//       mobile: (context) => _buildMobileLayout(),
//       tablet: (context) => _buildTabletLayout(),
//       desktop: (context) => _buildDesktopLayout(),
//     );
//   }

//   Widget _buildMobileLayout() {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal:20, vertical: 20),
//           decoration: const BoxDecoration(
//             // borderRadius: BorderRadius.circular(16),
//             color: Color(0xffFBFBF8),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Trust and safety\nfeatures for your\nprotection',
//                 style: GoogleFonts.manrope(
//                   fontSize: 35,
//                   fontWeight: FontWeight.bold,
//                   height: 1.2,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               featureMobile(
//                 svgPath: roundedDollarIcon,
//                 title: 'Secure payments',
//                 subtitle:
//                     'Only release payment when the task is\ncompleted to your satisfaction',
//               ),
//               const SizedBox(height: 12),
//               featureMobile(
//                 svgPath: trustedRatingsIcon,
//                 title: 'Trusted ratings and reviews',
//                 subtitle:
//                     'Pick the right person for the task based on\nreal ratings and reviews from other users',
//               ),
//               const SizedBox(height: 12),
//               featureMobile(
//                 svgPath: trustedRatingsIcon,
//                 title: 'Insurance for peace of mind',
//                 subtitle:
//                     'We provide liability insurance for\nTaskers performing most task activities',
//               ),

//             ],
//           ),
//         ),
//               greenSectionMobile(),
//       ],
//     );
//   }


//   Widget _buildDesktopLayout() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 145.0),
//       child: Container(
//         width: double.infinity,
//         height: 635,
//         //  padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 45),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: const Color(0xffFBFBF8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Left Section
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 50.0, vertical: 35.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Trust and safety\nfeatures for your\nprotection',
//                       style: GoogleFonts.manrope(
//                         fontSize: 68,
//                         fontWeight: FontWeight.bold,
//                         height: 1.2,
//                       ),
//                     ),
//                     const SizedBox(height: 27),
//                     _buildFeature(
//                       svgPath: roundedDollarIcon,
//                       title: 'Secure payments',
//                       subtitle:
//                           'Only release payment when the task is completed\nto your satisfaction',
//                     ),
//                     const SizedBox(height: 12),
//                     _buildFeature(
//                       svgPath: trustedRatingsIcon,
//                       title: 'Trusted ratings and reviews',
//                       subtitle:
//                           'Pick the right person for the task based on real\nratings and reviews from other users',
//                     ),
//                     const SizedBox(height: 12),
//                     _buildFeature(
//                       svgPath: trustedRatingsIcon,
//                       title: 'Insurance for peace of mind',
//                       subtitle:
//                           'We provide liability insurance for Taskers\nperforming most task activities',
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(width: 40),

//             // Right Section (Green Container)
//             _buildGreenSection(),
//           ],
//         ),
//         // ),
//       ),
//     );
//   }

//   // Desktops Helper Widget for Feature Item
//   Widget _buildFeature(
//       {required String svgPath,
//       required String title,
//       required String subtitle}) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 7.0),
//           child: SvgPicture.asset(
//             svgPath,
//             height: 18,
//             width: 18,
//             //  alignment: Alignment.center,
//           ),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: GoogleFonts.manrope(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 subtitle,
//                 style: GoogleFonts.manrope(
//                   fontSize: 18,
//                   color: Colors.grey[800],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // Helper Widget for Rating Box
//   Widget _buildRatingBox() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             '5.0',
//             style: GoogleFonts.manrope(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(width: 8),
//           const Icon(Icons.star, color: Colors.amber, size: 20),
//           const SizedBox(width: 8),
//           Text(
//             'Overall Rating',
//             style: GoogleFonts.manrope(
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildGreenSection() => Container(
//         width: 400,
//         padding: const EdgeInsets.all(45.0),
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildRatingBox(),
//             // const SizedBox(height: 85),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'We’re\nthe world’s work\nmarketplace',
//                   style: GoogleFonts.manrope(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 56),
//                 Row(
//                   children: [
//                     SvgPicture.asset(whiteStarRatingIcon, color: Colors.white),
//                     const SizedBox(width: 12),
//                     Text(
//                       '4.9/5',
//                       style: GoogleFonts.manrope(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Clients rate professionals on Upwork',
//                   style: GoogleFonts.manrope(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Row(
//                   children: [
//                     SvgPicture.asset(g2Icon, color: Colors.white),
//                     const SizedBox(width: 12),
//                     Text(
//                       'Award winner',
//                       style: GoogleFonts.manrope(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'G2’s 2021 Best Software Awards',
//                   style: GoogleFonts.manrope(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       );

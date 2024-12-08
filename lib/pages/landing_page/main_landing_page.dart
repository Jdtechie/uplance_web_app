// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uplance_flutter_web/pages/landing_page/browse_by_category.dart';
import 'package:uplance_flutter_web/pages/landing_page/footer_section.dart';
import 'package:uplance_flutter_web/pages/landing_page/hero_section.dart';
import 'package:uplance_flutter_web/pages/landing_page/highlight_section.dart';
import 'package:uplance_flutter_web/pages/landing_page/task_posting_section.dart';
import 'package:uplance_flutter_web/pages/landing_page/trust_and_safety.dart';
import 'package:uplance_flutter_web/responsive_screen.dart';
import 'package:uplance_flutter_web/utils/common/widgets/custom_drawer.dart';
import 'package:uplance_flutter_web/utils/common/widgets/navbar.dart';

class MainLandingPage extends StatelessWidget {
  MainLandingPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveWidget.isMobile(context);
    final bool isTablet = ResponsiveWidget.isTablet(context);
    final bool isDesktop = ResponsiveWidget.isDesktop(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer:
          isMobile ? const CustomDrawer() : null, // Show drawer only on mobile
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            isMobile ? 60 : 75), // Set the AppBar height based on device size
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0, // Remove shadow for flat design
          centerTitle: false,
          title: Navbar(
            onMenuTap: isMobile
                ? () {
                    _scaffoldKey.currentState?.openDrawer();
                  }
                : null,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            SizedBox(
                height: isDesktop
                    ? 60
                    : isTablet
                        ? 40
                        : 30),
            const TaskPostingSection(),
            SizedBox(
                height: isDesktop
                    ? 60
                    : isTablet
                        ? 40
                        : 30),
            const HighlightsSection(),
            SizedBox(
                height: isDesktop
                    ? 60
                    : isTablet
                        ? 40
                        : 30),
            const TrustAndSafetySection(),
            SizedBox(
                height: isDesktop
                    ? 60
                    : isTablet
                        ? 40
                        : 30),
            const BrowseByCategory(),
            SizedBox(
                height: isDesktop
                    ? 60
                    : isTablet
                        ? 40
                        : 30),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}


// class DesktopLandingPage extends StatelessWidget {
//   DesktopLandingPage({super.key});

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveBuilder(
//       builder: (context, sizingInformation) {
//         bool isMobile =
//             sizingInformation.deviceScreenType == DeviceScreenType.mobile;

//         return Scaffold(
//           key: _scaffoldKey,
//           backgroundColor: Colors.white,
//           drawer: isMobile
//               ? const CustomDrawer()
//               : null, // Show drawer only on mobile
//           body: Column(
//             children: [
//               Navbar(
//                 onMenuTap: isMobile
//                     ? () {
//                         _scaffoldKey.currentState?.openDrawer();
//                       }
//                     : null, // Assign drawer logic for mobile
//               ),
//               const Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       // Your page sections go here
//                       HeroSection(),
//                       SizedBox(height: 35),

//                       TaskPostingSection(),
//                       SizedBox(height: 35),

//                       HighlightsSection(),
//                       SizedBox(height: 35),

//                       TrustAndSafetySection(),
//                       SizedBox(height: 35),
                      
//                       BrowseByCategory(),
//                       SizedBox(height: 85),

//                       FooterSection(),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }



// class DesktopLandingPage extends StatelessWidget {
//   const DesktopLandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Navbar(),
//             // Padding(
//             //   padding: EdgeInsets.symmetric(horizontal: 145, vertical: 40),
//             //   child: Column(
//             //     children: [
//             //       HeroSection(),
//             //       TaskPostingSection(),
//             //       HighlightsSection(),
//             //       TrustAndSafetySection(),
//             //       SizedBox(height: 50),
//             //       BrowseByCategory(),
//             //     ],
//             //   ),
//             // ),
//             // FooterSection(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* ===================== Hero Section ======================== */

//   Widget _buildHeroSection() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 175, vertical: 50),
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Text(
//               'Get More Done',
//               style: GoogleFonts.manrope(
//                 fontSize: 100,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Post Any Task. Pick The Best Person. Get It Done.',
//             style: GoogleFonts.manrope(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[700]),
//           ),
//           const SizedBox(height: 24),
//           const CustomSearchBar(),
//           Image.asset(
//             heroBannerImage,
//             height: 496,
//             width: 930,
//           ),
//           CustomButton(
//             btnHeight: 50,
//             btnWidth: 297,
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

// /* ===================== Task Posting Section ======================== */

//   Widget _buildTaskPostingSection() {
//     return Container(
//       width: 1400,
//       height: 665,
//       padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 45),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: const Color(0xffE8FAF4),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SvgPicture.asset(uplanceLogo, height: 35.13, width: 192.55),
//               const SizedBox(height: 14),
//               Text(
//                 'Post your first\ntask in seconds',
//                 style: GoogleFonts.manrope(
//                     fontSize: 68, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.left,
//               ),
//               const SizedBox(height: 14),
//               Text(
//                 'Save yourself hours and get your to-do list\ncompleted in simple 3 steps.',
//                 style: GoogleFonts.manrope(
//                     fontSize: 22, fontWeight: FontWeight.w500),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 40.0),
//                 child: _buildStepsList(),
//               ),
//               CustomButton(
//                 btnHeight: 50,
//                 btnWidth: 228,
//                 buttonText: 'Post your task',
//                 textStyle: GoogleFonts.manrope(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white),
//                 trailingIcon: Icons.arrow_forward_sharp,
//                 onPressed: () {},
//               )
//             ],
//           ),
//           const SizedBox(width: 60),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 14.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     width: 630,
//                     height: 420,
//                     child: Image.asset(taskPostingImage),
//                   ),
//                   CustomTextButton(
//                       buttonText: 'Learn how uplancer works',
//                       trailingIcon: Icons.arrow_forward_sharp,
//                       onPressed: () {}),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStepsList() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildStepItem('Describe what you need done', taskSteps1Icon),
//         const SizedBox(height: 14),
//         _buildStepItem('Set your budget', taskSteps2Icon),
//         const SizedBox(height: 14),
//         _buildStepItem(
//             'Receive quotes and pick the best Tasker', taskSteps3Icon),
//       ],
//     );
//   }

//   Widget _buildStepItem(String text, String svgPath) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Row(
//         children: [
//           SvgPicture.asset(svgPath, color: Colors.green),
//           const SizedBox(width: 20),
//           Text(
//             text,
//             style: GoogleFonts.manrope(
//                 fontSize: 20, fontWeight: FontWeight.normal),
//             textAlign: TextAlign.left,
//           ),
//         ],
//       ),
//     );
//   }

// /* ===================== Highlights Section ======================== */
// // 
// // 
// /* ===================== Trust And Safety Section ======================== */
// // 
// // 
// // 
// /* ===================== Browse by Category Section ======================== */

//   Widget _buildCategoriesSection() {
//     return Container(
//       width: 1400,
//       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
//       // color: Colors.green[50],
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Browse talent by category',
//             style: GoogleFonts.manrope(
//               fontSize: 36,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 14),
//           RichText(
//             text: TextSpan(
//               text: 'Looking for work? ',
//               style: GoogleFonts.manrope(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//               children: [
//                 TextSpan(
//                   text: 'Browse jobs',
//                   style: GoogleFonts.manrope(
//                     color: Colors.green, // Green color for the link
//                     decoration: TextDecoration.underline,
//                   ),
//                   recognizer: TapGestureRecognizer()
//                     ..onTap = () {
//                       // Handle the click event here
//                       debugPrint('Browse jobs clicked');
//                     },
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),
//           Wrap(
//             spacing: 12,
//             runSpacing: 20,
//             children: [
//               _buildCategoryCard('Development & IT', 1853),
//               _buildCategoryCard('AI Services', 284),
//               _buildCategoryCard('Design & Crreative', 1853),
//               _buildCategoryCard('Sales & Marketing', 1853),
//               _buildCategoryCard('Writing & Translation', 1853),
//               _buildCategoryCard('Admin & Customer Support', 1853),
//               _buildCategoryCard('Finance & Accounting', 1853),
//               _buildCategoryCard('Engineering & Architecture', 1853),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryCard(String title, int skills) {
//     return Container(
//       width: 290,
//       height: 134,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xffFBFBF8),
//         borderRadius: BorderRadius.circular(8),
//         // border: Border.all(color: const Color(0xff707070),
//       ),
//       // ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.manrope(fontSize: 22),
//             textAlign: TextAlign.left,
//           ),
//           const Spacer(),
//           // Bottom Row with Rating and skills count
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   const Icon(Icons.star, color: Colors.greenAccent, size: 20),
//                   const SizedBox(width: 4),
//                   Text(
//                     '4.7/5',
//                     style: GoogleFonts.manrope(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 '$skills skills',
//                 style: GoogleFonts.manrope(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   /*========================== Footer Section ===================================*/
// }




// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:uplance_flutter_web/pages/landing_page/browse_by_category.dart';
// import 'package:uplance_flutter_web/pages/landing_page/footer_section.dart';
// import 'package:uplance_flutter_web/pages/landing_page/hero_section.dart';
// import 'package:uplance_flutter_web/pages/landing_page/highlight_section.dart';
// import 'package:uplance_flutter_web/pages/landing_page/task_posting_section.dart';
// import 'package:uplance_flutter_web/pages/landing_page/trust_and_safety.dart';
// import 'package:uplance_flutter_web/utils/common/widgets/custom_search_bar.dart';
// import 'package:uplance_flutter_web/utils/common/text_strings.dart';
// import 'package:uplance_flutter_web/utils/common/widgets/custom_button.dart';
// import 'package:uplance_flutter_web/utils/common/widgets/custom_textButton.dart';
// import 'package:uplance_flutter_web/utils/common/widgets/navbar.dart';
// import 'package:responsive_builder/responsive_builder.dart';

// class DesktopLandingPage extends StatelessWidget {
//   const DesktopLandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Navbar(),
//             ScreenTypeLayout(
//               mobile: _buildMobileLayout(),
//               tablet: _buildTabletLayout(),
//               desktop: _buildDesktopLayout(),
//             ),
//             FooterSection(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMobileLayout() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: Column(
//         children: [
//           HeroSection(),
//           TaskPostingSection(),
//           HighlightsSection(),
//           TrustAndSafetySection(),
//           BrowseByCategory(),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabletLayout() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
//       child: Column(
//         children: [
//           HeroSection(),
//           TaskPostingSection(),
//           HighlightsSection(),
//           TrustAndSafetySection(),
//           BrowseByCategory(),
//         ],
//       ),
//     );
//   }

//   Widget _buildDesktopLayout() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 145, vertical: 40),
//       child: Column(
//         children: [
//           HeroSection(),
//           TaskPostingSection(),
//           HighlightsSection(),
//           TrustAndSafetySection(),
//           SizedBox(height: 50),
//           BrowseByCategory(),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:uplance_flutter_web/pages/landing_page/browse_by_category.dart';
// import 'package:uplance_flutter_web/pages/landing_page/footer_section.dart';
// import 'package:uplance_flutter_web/pages/landing_page/hero_section.dart';
// import 'package:uplance_flutter_web/pages/landing_page/highlight_section.dart';
// import 'package:uplance_flutter_web/pages/landing_page/task_posting_section.dart';
// import 'package:uplance_flutter_web/pages/landing_page/trust_and_safety.dart';
// import 'package:uplance_flutter_web/utils/common/widgets/navbar.dart';

// class LandingPage extends StatelessWidget {
//   const LandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: ScreenTypeLayout.builder(
//           mobile: (context) => _buildMobileView(),
//           tablet:  (context) =>_buildTabletView(),
//           desktop: (context) => _buildDesktopView(),
//         ),
//       ),
//     );
//   }

//   Widget _buildMobileView() {
//     return Column(
//       children: [
//         Navbar(isMobile: true),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//           child: Column(
//             children: [
//               HeroSection(isMobile: true),
//               TaskPostingSection(isMobile: true),
//               HighlightsSection(isMobile: true),
//               TrustAndSafetySection(isMobile: true),
//               BrowseByCategory(isMobile: true),
//             ],
//           ),
//         ),
//         FooterSection(isMobile: true),
//       ],
//     );
//   }

//   Widget _buildTabletView() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//       child: Column(
//         children: [
//           Navbar(isMobile: false),
//           HeroSection(isMobile: false),
//           TaskPostingSection(isMobile: false),
//           HighlightsSection(isMobile: false),
//           TrustAndSafetySection(isMobile: false),
//           BrowseByCategory(isMobile: false),
//           FooterSection(isMobile: false),
//         ],
//       ),
//     );
//   }

//   Widget _buildDesktopView() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 145, vertical: 40),
//       child: Column(
//         children: [
//           Navbar(isMobile: false),
//           HeroSection(isMobile: false),
//           TaskPostingSection(isMobile: false),
//           HighlightsSection(isMobile: false),
//           TrustAndSafetySection(isMobile: false),
//           BrowseByCategory(isMobile: false),
//           FooterSection(isMobile: false),
//         ],
//       ),
//     );
//   }
// }

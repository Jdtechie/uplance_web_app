import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uplance_flutter_web/responsive_screen.dart';
import 'package:uplance_flutter_web/utils/common/text_strings.dart';
import 'package:uplance_flutter_web/utils/common/widgets/custom_button.dart';
import 'package:uplance_flutter_web/utils/common/widgets/custom_textButton.dart';

class TaskPostingSection extends StatelessWidget {
  const TaskPostingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isMobile = ResponsiveWidget.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 75
            : isTablet
                ? 25
                : 15,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // isDesktop ? 1400 : null,
        height: isDesktop ? 665 : null,
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 45 : 12,
          vertical: isDesktop ? 45 : 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffE8FAF4),
        ),
        child: isDesktop
            ? _buildDesktopContent(isDesktop: isDesktop, context: context)
            : isTablet
                ? _buildTabletContent(isTablet: isTablet, context: context)
                : _buildMobileContent(context),
      ),
    );
  }

  Widget _buildDesktopContent(
      {bool isDesktop = true, required BuildContext context}) {
    bool isTablet = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTextContent(context, largeLogo: true),
        SizedBox(width: 25,),
        Expanded(child: _buildImageContent(isDesktop, isTablet, context)),
      ],
    );
  }

  Widget _buildTabletContent(
      {bool isTablet = true, required BuildContext context}) {
    bool isDesktop = false; // Set isDesktop to false for tablet layout

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _buildTextContent(context),
        ),
        Expanded(
          flex: 1,
          child: _buildImageContent(isDesktop, isTablet, context),
        ),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLogo(),
        const SizedBox(height: 35),
        _buildTitle(context),
        const SizedBox(height: 28),
        _buildDescription(context),
        const SizedBox(height: 28),
        _buildStepsList(context),
        const SizedBox(height: 25),
        Center(child: _buildButton(context)),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, {bool largeLogo = false}) {
     final isDesktop = ResponsiveWidget.isDesktop(context);
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLogo(large: largeLogo),
         SizedBox(height: isDesktop? 14 : 10),
        _buildTitle(context),
         SizedBox(height: isDesktop? 14 : 10),
        _buildDescription(context),
         SizedBox(height: isDesktop? 35 : 15),
        _buildStepsList(context),
         SizedBox(height: isDesktop? 45 : 25),
        _buildButton(context),
      ],
    );
  }

  Widget _buildImageContent(
      bool isDesktop, bool isTablet, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          taskPostingImage,
          height: isDesktop ? 420 : 350,
          width: isDesktop ? 556 : 530,
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 15.0),
          child: CustomTextButton(
            buttonText: 'Learn how uplancer works',
            trailingIcon: Icons.arrow_forward_sharp,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildLogo({bool large = false}) {
    return SvgPicture.asset(
      uplanceLogo,
      height: large ? 35.13 : 19,
      width: large ? 192.55 : 104,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Post your first\ntask in seconds',
      style: TextStyle(
        fontSize: ResponsiveWidget.isDesktop(context)
            ? 68
            : ResponsiveWidget.isTablet(context)
                ? 42
                : 34,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      ResponsiveWidget.isMobile(context)
          ? 'Save yourself hours and get your\nto-do list completed in simple\n3 steps.'
          : 'Save yourself hours and get your to-do list\ncompleted in simple 3 steps.',
      style: TextStyle(
        fontSize: ResponsiveWidget.isDesktop(context)
            ? 22
            : ResponsiveWidget.isTablet(context)
                ? 16
                : 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }

  Widget _buildStepsList(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepItem('Describe what you need done', taskSteps1Icon,
         context ),
        const SizedBox(height: 14),
        _buildStepItem('Set your budget', taskSteps2Icon,  context),
        const SizedBox(height: 14),
        _buildStepItem(
            'Receive quotes and pick the best Tasker', taskSteps3Icon, context
            ),
      ],
    );
  }

  Widget _buildStepItem(String text, String svgPath, BuildContext context) {
     final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isMobile = ResponsiveWidget.isMobile(context);
    return Row(
      children: [
        SvgPicture.asset(
          svgPath,
          color: Colors.green,
          height: isMobile ? 19 : 24,
          width: isMobile ? 19 : 24,
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(
            fontSize: isDesktop ? 18 : isTablet? 16: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);
    return CustomButton(
      btnHeight: isMobile ? 38 : 50 ,
      btnWidth: isMobile ? 169 :228,
      buttonText: 'Post your task',
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 10 : 18),
      textStyle: TextStyle(
        fontSize: isMobile ? 14 : 17,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      gap: isMobile ? 8 : 12,
      trailingIcon: Icons.arrow_forward_sharp,
       iconSize: isMobile ? 18 : 22,
      onPressed: () {},
    );
  }
}



// class TaskPostingSection extends StatelessWidget {
//   const TaskPostingSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenTypeLayout.builder(
//       mobile: (context) => _buildMobileLayout(),
//       tablet: (context) => _buildTabletLayout(),
//       desktop: (context) => _buildDesktopLayout(),
//     );
//   }

//   Widget _buildMobileLayout() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: Container(
//         padding: const EdgeInsets.symmetric(
//             horizontal: 12, vertical: 24), // Smaller padding for mobile
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: const Color(0xffE8FAF4),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SvgPicture.asset(uplanceLogo,
//                 height: 24, width: 134), // Smaller logo for mobile
//             const SizedBox(height: 35),
//             Text(
//               'Post your first\ntask in seconds',
//               style: GoogleFonts.manrope(
//                 fontSize: 36,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 28),
//             Text(
//               'Save yourself hours and get your\nto-do list completed in simple\n3 steps.',
//               style: GoogleFonts.manrope(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(height: 28),
//             mobileStepsList(),
//             const SizedBox(height: 25.0),
//             Center(
//               child: CustomButton(
//                 btnHeight: 50.24,
//                 btnWidth: 180,
//                 buttonText: 'Post your task',
//                 textStyle: GoogleFonts.manrope(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white,
//                 ),
//                 trailingIcon: Icons.arrow_forward_sharp,
//                 onPressed: () {},
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTabletLayout() {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//           horizontal: 50, vertical: 50), // Medium padding for tablet
//       color: const Color(0xffE8FAF4),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SvgPicture.asset(uplanceLogo,
//                   height: 30, width: 180), // Medium logo for tablet
//               const SizedBox(height: 20),
//               Text(
//                 'Post your first\ntask in seconds',
//                 style: GoogleFonts.manrope(
//                   fontSize: 48, // Medium font size for tablet
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 14),
//               Text(
//                 'Save yourself hours and get your to-do list\ncompleted in simple 3 steps.',
//                 style: GoogleFonts.manrope(
//                   fontSize: 18, // Medium font size for tablet
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               desktopStepsList(),
//               CustomButton(
//                 btnHeight: 50,
//                 btnWidth: 230, // Medium button size for tablet
//                 buttonText: 'Post your task',
//                 textStyle: GoogleFonts.manrope(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white,
//                 ),
//                 trailingIcon: Icons.arrow_forward_sharp,
//                 onPressed: () {},
//               ),
//             ],
//           ),
//           const SizedBox(width: 40),
//           Column(
//             children: [
//               SizedBox(
//                 width: 600,
//                 height: 420,
//                 child: Image.asset(taskPostingImage),
//               ),
//               CustomTextButton(
//                 buttonText: 'Learn how uplancer works',
//                 trailingIcon: Icons.arrow_forward_sharp,
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDesktopLayout() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 145.0),
//       child: Container(
//         width: 1400,
//         height: 665,
//         padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 45),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: const Color(0xffE8FAF4),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SvgPicture.asset(uplanceLogo, height: 35.13, width: 192.55),
//                 const SizedBox(height: 14),
//                 Text(
//                   'Post your first\ntask in seconds',
//                   style: GoogleFonts.manrope(
//                       fontSize: 68, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.left,
//                 ),
//                 const SizedBox(height: 14),
//                 Text(
//                   'Save yourself hours and get your to-do list\ncompleted in simple 3 steps.',
//                   style: GoogleFonts.manrope(
//                       fontSize: 22, fontWeight: FontWeight.w500),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 40.0),
//                   child: desktopStepsList(),
//                 ),
//                 CustomButton(
//                   btnHeight: 50,
//                   btnWidth: 228,
//                   buttonText: 'Post your task',
//                   textStyle: GoogleFonts.manrope(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white),
//                   trailingIcon: Icons.arrow_forward_sharp,
//                   onPressed: () {},
//                 )
//               ],
//             ),
//             const SizedBox(width: 60),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 14.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                       width: 630,
//                       height: 420,
//                       child: Image.asset(taskPostingImage),
//                     ),
//                     CustomTextButton(
//                         buttonText: 'Learn how uplancer works',
//                         trailingIcon: Icons.arrow_forward_sharp,
//                         onPressed: () {}),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget desktopStepsList() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         desktopStepItem('Describe what you need done', taskSteps1Icon),
//         const SizedBox(height: 14),
//         desktopStepItem('Set your budget', taskSteps2Icon),
//         const SizedBox(height: 14),
//         desktopStepItem(
//             'Receive quotes and pick the best Tasker', taskSteps3Icon),
//       ],
//     );
//   }

//   Widget desktopStepItem(String text, String svgPath) {
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

//   // Mobile helper funtions

//   Widget mobileStepsList() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         mobileStepItem('Describe what you need done', taskSteps1Icon),
//         const SizedBox(height: 12),
//         mobileStepItem('Set your budget', taskSteps2Icon),
//         const SizedBox(height: 12),
//         mobileStepItem(
//             'Receive quotes and pick the best Tasker', taskSteps3Icon),
//       ],
//     );
//   }

//   Widget mobileStepItem(String text, String svgPath) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Row(
//         children: [
//           SvgPicture.asset(
//             svgPath,
//             color: Colors.green,
//             height: 19,
//             width: 19,
//           ),
//           const SizedBox(width: 20),
//           Text(
//             text,
//             style: GoogleFonts.manrope(
//                 fontSize: 12, fontWeight: FontWeight.normal),
//             textAlign: TextAlign.left,
//           ),
//         ],
//       ),
//     );
//   }
// }
 


















// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class TaskPostingSection extends StatelessWidget {
//    final bool isMobile;
//   final bool isTablet;

//   const TaskPostingSection({super.key, required this.isMobile, required this.isTablet});

//   @override
//   Widget build(BuildContext context) {
//  double containerWidth = isMobile
//         ? double.infinity
//         : isTablet
//             ? 1000
//             : 1400;
//     double? containerHeight = isMobile ? null : 665;

//     return Container(
//       width: containerWidth,
//       height: containerHeight,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: const Color(0xffE8FAF4),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SvgPicture.asset(uplanceLogo, height: 25),
//           const SizedBox(height: 14),
//           Text(
//             'Post your first\ntask in seconds',
//             style: GoogleFonts.manrope(
//               fontSize: isMobile ? 32 : 68,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 14),
//           Text(
//             'Save yourself hours and get your to-do list\ncompleted in simple 3 steps.',
//             style: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 40),
//           _buildStepsList(),
//           const SizedBox(height: 20),
//           CustomButton(
//             btnHeight: 50,
//             btnWidth: 228,
//             buttonText: 'Post your task',
//             textStyle: GoogleFonts.manrope(
//               fontSize: 17,
//               fontWeight: FontWeight.w500,
//               color: Colors.white,
//             ),
//             trailingIcon: Icons.arrow_forward_sharp,
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper functions

//     Widget _buildStepsList() {
//     return Column(
//       children: [
//         _buildStepCard(
//           stepNumber: 1,
//           title: 'Tell us what you need',
//           subtitle:
//               'Select a category & tell us about your task. Add a budget and a deadline to post your task.',
//         ),
//         const SizedBox(height: 20),
//         _buildStepCard(
//           stepNumber: 2,
//           title: 'Choose the best Tasker',
//           subtitle:
//               'Review offers from our Taskers and select the right person for your task.',
//         ),
//         const SizedBox(height: 20),
//         _buildStepCard(
//           stepNumber: 3,
//           title: 'Get it done!',
//           subtitle:
//               'Connect with your Tasker and get your task done. It’s that simple!',
//         ),
//       ],
//     );
//   }

//   Widget _buildStepCard({
//     required int stepNumber,
//     required String title,
//     required String subtitle,
//   }) {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 20,
//           backgroundColor: const Color(0xffB8E6CE),
//           child: Text(
//             '$stepNumber',
//             style: GoogleFonts.manrope(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: const Color(0xff1A7740),
//             ),
//           ),
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: GoogleFonts.manrope(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 subtitle,
//                 style: GoogleFonts.manrope(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.grey[700],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
  // }

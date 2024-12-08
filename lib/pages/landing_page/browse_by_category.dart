import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplance_flutter_web/responsive_screen.dart';

class BrowseByCategory extends StatelessWidget {
  const BrowseByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isMobile = ResponsiveWidget.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 56
            : isTablet
                ? 25
                : 15,
        vertical: isDesktop ? 25 : 15,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isMobile
                  ? 'Browse talent by\ncategory'
                  : 'Browse talent by category',
              style: GoogleFonts.manrope(
                fontSize: isDesktop ? 42 : 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: isDesktop ? 16 : 14),
            RichText(
              text: TextSpan(
                text: 'Looking for work? ',
                style: GoogleFonts.manrope(
                  fontSize: isDesktop
                      ? 17
                      : isTablet
                          ? 15
                          : 14,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Browse jobs',
                    style: GoogleFonts.manrope(
                      color: Colors.green,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint('Browse jobs clicked');
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: isDesktop ? 24 : 16),
            _buildContentLayout(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContentLayout(BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isMobile = ResponsiveWidget.isMobile(context);
    return Container(
      // padding: const EdgeInsets.all(16), // Adjust as needed
      child: isMobile
          ? Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryCard('Development & IT', 1853, context),
                      const SizedBox(width: 12),
                      _buildCategoryCard('AI Services', 284, context),
                      const SizedBox(width: 12),
                      _buildCategoryCard('Design & Creative', 1853, context),
                      const SizedBox(width: 12),
                      _buildCategoryCard('Sales & Marketing', 1853, context),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryCard(
                          'Writing & Translation', 1853, context),
                      const SizedBox(width: 12),
                      _buildCategoryCard(
                          'Admin & Customer Support', 1853, context),
                      const SizedBox(width: 12),
                      _buildCategoryCard('Finance & Accounting', 1853, context),
                      const SizedBox(width: 12),
                      _buildCategoryCard(
                          'Engineering & Architecture', 1853, context),
                    ],
                  ),
                ),
              ],
            )
          : isTablet
              ? Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCategoryCard('Development & IT', 1853, context),
                          const SizedBox(width: 12),
                          _buildCategoryCard('AI Services', 284, context),
                          const SizedBox(width: 12),
                          _buildCategoryCard(
                              'Design & Creative', 1853, context),
                          const SizedBox(width: 12),
                          _buildCategoryCard(
                              'Sales & Marketing', 1853, context),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCategoryCard(
                              'Writing & Translation', 1853, context),
                          const SizedBox(width: 12),
                          _buildCategoryCard(
                              'Admin & Customer Support', 1853, context),
                          const SizedBox(width: 12),
                          _buildCategoryCard(
                              'Finance & Accounting', 1853, context),
                          const SizedBox(width: 12),
                          _buildCategoryCard(
                              'Engineering & Architecture', 1853, context),
                        ],
                      ),
                    ),
                  ],
                )
              : Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    _buildCategoryCard('Development & IT', 1853, context),
                    _buildCategoryCard('AI Services', 284, context),
                    _buildCategoryCard('Design & Creative', 1853, context),
                    _buildCategoryCard('Sales & Marketing', 1853, context),
                    _buildCategoryCard('Writing & Translation', 1853, context),
                    _buildCategoryCard(
                        'Admin & Customer Support', 1853, context),
                    _buildCategoryCard('Finance & Accounting', 1853, context),
                    _buildCategoryCard(
                        'Engineering & Architecture', 1853, context),
                  ],
                ),
    );
  }

  Widget _buildCategoryCard(String title, int skills, BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    final isTablet = ResponsiveWidget.isTablet(context);
    final isMobile = ResponsiveWidget.isMobile(context);

    final screenWidth = MediaQuery.of(context).size.width;

    // Use percentages of the screen width for container dimensions
    final containerWidth = screenWidth *
        (isMobile
            ? 0.6
            : isTablet
                ? 0.4
                : 0.2246);
    final containerHeight = containerWidth * 0.4;
    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: EdgeInsets.all(isMobile ? 12 : 14),
      decoration: BoxDecoration(
        color: const Color(0xffFBFBF8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.manrope(fontSize: isMobile ? 16 : 22),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.greenAccent, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '4.7/5',
                    style: GoogleFonts.manrope(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                '$skills skills',
                style: GoogleFonts.manrope(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// class BrowseByCategory extends StatelessWidget {
//   const BrowseByCategory({super.key});

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
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Browse talent by\ncategory',
//               style: GoogleFonts.manrope(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 14),
//             RichText(
//               text: TextSpan(
//                 text: 'Looking for work? ',
//                 style: GoogleFonts.manrope(
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: 'Browse jobs',
//                     style: GoogleFonts.manrope(
//                       color: Colors.green,
//                       decoration: TextDecoration.underline,
//                     ),
//                     recognizer: TapGestureRecognizer()
//                       ..onTap = () {
//                         debugPrint('Browse jobs clicked');
//                       },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//                     // Horizontally Scrollable Grid
//           // Horizontally Scrollable Grid with Two Rows
//           // Row 1 - Independently Scrollable
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 mobileCategoryCard('Development & IT', 1853),
//                 const SizedBox(width: 12),
//                 mobileCategoryCard('AI Services', 284),
//                 const SizedBox(width: 12),
//                 mobileCategoryCard('Design & Creative', 1853),
//                 const SizedBox(width: 12),
//                 mobileCategoryCard('Sales & Marketing', 1853),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Row 2 - Independently Scrollable
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 mobileCategoryCard('Writing & Translation', 1853),
//                 const SizedBox(width: 12),
//                 mobileCategoryCard('Admin & Customer Support', 1853),
//                 const SizedBox(width: 12),
//                 mobileCategoryCard('Finance & Accounting', 1853),
//                 const SizedBox(width: 12),
//                 mobileCategoryCard('Engineering & Architecture', 1853),
//               ],
//             ),
//           ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTabletLayout() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Browse talent by category',
//             style: GoogleFonts.manrope(
//               fontSize: 30,
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
//                     color: Colors.green,
//                     decoration: TextDecoration.underline,
//                   ),
//                   recognizer: TapGestureRecognizer()
//                     ..onTap = () {
//                       debugPrint('Browse jobs clicked');
//                     },
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),
//           Wrap(
//             spacing: 16,
//             runSpacing: 20,
//             children: [
//               _buildCategoryCard('Development & IT', 1853),
//               _buildCategoryCard('AI Services', 284),
//               _buildCategoryCard('Design & Creative', 1853),
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

//   Widget _buildDesktopLayout() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 40),
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
//                     color: Colors.green,
//                     decoration: TextDecoration.underline,
//                   ),
//                   recognizer: TapGestureRecognizer()
//                     ..onTap = () {
//                       debugPrint('Browse jobs clicked');
//                     },
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),
//           Wrap(
//             spacing: 18,
//             runSpacing: 18,
//             children: [
//               _buildCategoryCard('Development & IT', 1853),
//               _buildCategoryCard('AI Services', 284),
//               _buildCategoryCard('Design & Creative', 1853),
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
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.manrope(fontSize: 22),
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

//   Widget mobileCategoryCard(String title, int skills) {
//     return Container(
//       width: 220,
//       height: 100,
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: const Color(0xffFBFBF8),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.manrope(fontSize: 16),
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
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 '$skills skills',
//                 style: GoogleFonts.manrope(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

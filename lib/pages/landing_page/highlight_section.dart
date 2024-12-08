import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplance_flutter_web/responsive_screen.dart';
import 'package:uplance_flutter_web/utils/common/widgets/custom_button.dart';

class HighlightsSection extends StatefulWidget {
  const HighlightsSection({super.key});

  @override
  State<HighlightsSection> createState() => _HighlightsSectionState();
}

class _HighlightsSectionState extends State<HighlightsSection> {
  int _selectedIndex = 0; // Track the selected tab

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveWidget.isDesktop(context);
    final bool isTablet = ResponsiveWidget.isTablet(context);
    final bool isMobile = ResponsiveWidget.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 75
            : isTablet
                ? 25
                : 15,
      ),
      child: SizedBox(
        width: isDesktop ? 1400 : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            _buildTitle(isMobile),
            const SizedBox(height: 16),

            // Tab Row
            _buildMenuItems(context),

            const SizedBox(height: 24),

            // Task Cards
            isDesktop ?  _buildWrapTaskCards() : _buildScrollableCards(),

            const SizedBox(height: 45),

            // Post Task Button
            _buildPostTaskButton(isMobile),
          ],
        ),
      ),
    );
  }

  // Title builder for Highlights section
  Widget _buildTitle(bool isMobile) {
     final bool isDesktop = ResponsiveWidget.isDesktop(context);
    final bool isTablet = ResponsiveWidget.isTablet(context);
    
    return Text(
      'What others are getting done',
      style: GoogleFonts.manrope(
        fontSize: isDesktop? 65 : isTablet ? 42 : 35,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Tab Row builder
  Widget _buildMenuItems(BuildContext context) {
    final tabs = [
      'Popular',
      'UX/UI Design',
      'Web Dev',
      'Video & Animation',
      'Ecommerce Dev',
      'AI & ML',
    ];

    // For Mobile, display menu items in rows
    if (ResponsiveWidget.isMobile(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) {
              return Expanded(
                child: _buildMenuTab(tabs[index], index),
              );
            }),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(2, (index) {
              return Expanded(
                child: _buildMenuTab(tabs[index + 3], index + 2),
              );
            }),
          ),
        ],
      );
    } 
    else {
      // For Desktop and Tablet, display items in a horizontal row
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(tabs.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: _buildMenuTab(tabs[index], index),
          );
        }),
      );
    }
  }

  // Individual menu tab builder
  Widget _buildMenuTab(String title, int index) {
     final bool isDesktop = ResponsiveWidget.isDesktop(context);
    final bool isTablet = ResponsiveWidget.isTablet(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding:  EdgeInsets.symmetric(vertical: 6, horizontal:  isDesktop? 12 : 8),
        // margin:  EdgeInsets.symmetric(horizontal: isDesktop? 6 : 4),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (index == 0)
              Icon(
                Icons.trending_up,
                color:
                    _selectedIndex == index ? Colors.greenAccent : Colors.black,
                size: 16,
              ),
            if (index == 0) 
            const SizedBox(width: 4),
            Text(
              title,
              style: GoogleFonts.manrope(
                fontSize:isDesktop? 16: isTablet? 14: 12 ,
                color: _selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Scrollable cards for mobile and tablets
  Widget _buildScrollableCards() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _buildTaskCard(true, 'Task ${index + 1}'),
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _buildTaskCard(true, 'Task ${index + 1} - Row 2'),
              );
            }),
          ),
        ),
      ],
    );
  }

  
  // Wrap for  desktop
  Widget _buildWrapTaskCards() {
    return Wrap(
      spacing: 14 ,
      runSpacing:14 ,
      children: List.generate(6, (index) {
        return _buildTaskCard(false, 'Task for AI & ML');
      }),
    );
  }

  // Post your task - button builder
  Widget _buildPostTaskButton(bool isMobile) {
    return Center(
      child: CustomButton(
        btnHeight: isMobile ? 38 : 50,
        btnWidth: isMobile ? 169 : 228,
        buttonText: 'Post your task',
        padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 10 : 18),
        textStyle: GoogleFonts.manrope(
          fontSize: isMobile ? 14 : 17,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        gap: isMobile ? 8 : 12,
        trailingIcon: Icons.arrow_forward_sharp,
        iconSize: isMobile ? 18 : 22,
        onPressed: () {},
      ),
    );
  }

  // Task card builder
  Widget _buildTaskCard(bool isMobile, String taskType) {
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
                : 0.294);
    final containerHeight =
        containerWidth * 0.4; // Adjust height proportionally
    return Container(
       width: containerWidth,
    height: containerHeight,
      // width: isMobile ? 300 : 406.96,
      // height: isMobile ? 130 : 192.78,
      padding: isMobile ? const EdgeInsets.all(16) : const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: const Color(0xffD9D9D9),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: isMobile ? 18 : 24,
                backgroundColor: Colors.grey,
                child: const Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskType,
                    style: GoogleFonts.manrope(
                      fontSize: isMobile ? 12 : 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Task details go here...',
                    style: GoogleFonts.manrope(
                      fontSize: isMobile ? 14 : 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: isMobile ? 16 : 22,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '5 Stars',
                    style: GoogleFonts.manrope(
                      fontSize: isMobile ? 12 : 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                '\$200',
                style: GoogleFonts.manrope(
                  fontSize: isMobile ? 12 : 16,
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







// class HighlightsSection extends StatefulWidget {
//   const HighlightsSection({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _HighlightsSectionState createState() => _HighlightsSectionState();
// }

// class _HighlightsSectionState extends State<HighlightsSection> {
//   int _selectedIndex = 0; // Track the selected tab

//   // Titles for the tabs
//   final List<String> _tabs = [
//     'Popular',
//     'UX/UI Design',
//     'Web Dev',
//     'Video & Animation',
//     'Ecommerce Dev',
//     'AI & ML',
//   ];

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
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title
//           Text(
//             'What others are getting done',
//             style: GoogleFonts.manrope(
//               fontSize: 34,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),

//           // Menu Items arranged in rows
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(3, (index) {
//                   return _buildMenuItem(index);
//                 }),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(2, (index) {
//                   return _buildMenuItem(
//                       index + 3); // Offset index by 3 for next row
//                 }),
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),

//          // Cards - Full width and two horizontally scrollable rows
// Column(
//   children: [
//     // First Row of Scrollable Cards
//     SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(4, (index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: taskCardMobile('Task ${index + 1} - Row 1'),
//           );
//         }),
//       ),
//     ),
//     const SizedBox(height: 16), // Space between rows

//     // Second Row of Scrollable Cards
//     SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(4, (index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: taskCardMobile('Task ${index + 1} - Row 2'),
//           );
//         }),
//       ),
//     ),
//   ],
// ),

//           const SizedBox(height: 45),

//           // Post Your Task Button
//           Center(
//             child: CustomButton(
//               btnHeight: 50,
//               btnWidth: 200,
//               buttonText: 'Post your task',
//               textStyle: GoogleFonts.manrope(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//               ),
//               trailingIcon: Icons.arrow_forward_sharp,
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// // Helper Widget for Menu Items
//   Widget _buildMenuItem(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//         decoration: BoxDecoration(
//           color: _selectedIndex == index ? Colors.black : Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           border: Border.all(color: Colors.black),
//         ),
//         child: Row(
//           children: [
//             if (index == 0) // Show the icon only for the first tab ("Popular")
//               Icon(
//                 Icons.trending_up,
//                 color:
//                     _selectedIndex == index ? Colors.greenAccent : Colors.black,
//                 size: 16,
//               ),
//             if (index == 0) const SizedBox(width: 4),
//             Text(
//               _tabs[index],
//               style: GoogleFonts.manrope(
//                 fontSize: 14,
//                 color: _selectedIndex == index ? Colors.white : Colors.black,
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
//           vertical: 30, horizontal: 40), // Medium padding for tablet
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title
//           Text(
//             'What otheres are getting done',
//             style: GoogleFonts.manrope(
//               fontSize: 28, // Medium font size for tablet
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),

//           // Tab Row
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: List.generate(_tabs.length, (index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedIndex = index;
//                     });
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 8, horizontal: 16), // Medium padding
//                     decoration: BoxDecoration(
//                       color:
//                           _selectedIndex == index ? Colors.black : Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.black),
//                     ),
//                     child: Row(
//                       children: [
//                         if (index == 0)
//                           Icon(
//                             Icons.trending_up,
//                             color: _selectedIndex == index
//                                 ? Colors.greenAccent
//                                 : Colors.black,
//                             size: 18,
//                           ),
//                         if (index == 0) const SizedBox(width: 4),
//                         Text(
//                           _tabs[index],
//                           style: GoogleFonts.manrope(
//                             fontSize: 16, // Medium font size for tablet
//                             color: _selectedIndex == index
//                                 ? Colors.white
//                                 : Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//           const SizedBox(height: 35),

//           // Content Display
//           Wrap(
//             spacing: 12,
//             runSpacing: 12,
//             children: List.generate(6, (index) {
//               return desktopTaskCard('Task for ${_tabs[_selectedIndex]}');
//             }),
//           ),
//           const SizedBox(height: 45),
//           Center(
//             child: CustomButton(
//               btnHeight: 50,
//               btnWidth: 228, // Adjusted button size for tablet
//               buttonText: 'Post your task',
//               textStyle: GoogleFonts.manrope(
//                 fontSize: 17,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//               ),
//               trailingIcon: Icons.arrow_forward_sharp,
//               onPressed: () {},
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildDesktopLayout() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 145.0),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(vertical: 40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Title
//             Text(
//               'What others are getting done',
//               style: GoogleFonts.manrope(
//                 fontSize: 68,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Tab Row
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(_tabs.length, (index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _selectedIndex = index; // Update selected tab
//                       });
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 8),
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 16),
//                       decoration: BoxDecoration(
//                         color: _selectedIndex == index
//                             ? Colors.black
//                             : Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         border: Border.all(color: Colors.black),
//                       ),
//                       child: Row(
//                         children: [
//                           if (index ==
//                               0) // Show the icon only for the first tab ("Popular")
//                             Icon(
//                               Icons.trending_up,
//                               color: _selectedIndex == index
//                                   ? Colors.greenAccent
//                                   : Colors.black,
//                               size: 16,
//                             ),
//                           if (index == 0)
//                             const SizedBox(
//                                 width:
//                                     4), // Space after icon only for "Popular"
//                           Text(
//                             _tabs[index],
//                             style: GoogleFonts.manrope(
//                               fontSize: 16,
//                               color: _selectedIndex == index
//                                   ? Colors.white
//                                   : Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             const SizedBox(height: 35),

//             // Content Display
//             Wrap(
//               spacing: 16,
//               runSpacing: 16,
//               children: List.generate(6, (index) {
//                 // Display different content for each tab
//                 if (_selectedIndex == 0) {
//                   return desktopTaskCard('Popular Task');
//                 } else if (_selectedIndex == 1) {
//                   return desktopTaskCard('UX/UI Design Task');
//                 } else if (_selectedIndex == 2) {
//                   return desktopTaskCard('Ecommerce Dev Task');
//                 } else {
//                   return desktopTaskCard('Other Tasks');
//                 }
//               }),
//             ),
//             const SizedBox(height: 45),
//             Center(
//               child: CustomButton(
//                 btnHeight: 50,
//                 btnWidth: 228,
//                 buttonText: 'Post your task',
//                 textStyle: GoogleFonts.manrope(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white),
//                 trailingIcon: Icons.arrow_forward_sharp,
//                 onPressed: () {},
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }


//  // task card for mobile layout

//   Widget taskCardMobile(String taskType) {
//     return Container(
//       width: 300,
//       height: 130,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(21),
//         border: Border.all(
//           color: const Color(0xffD9D9D9),
//           width: 2,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Top Row with Avatar and Text
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const CircleAvatar(
//                 radius: 24,
//                 backgroundColor: Colors.grey,
//                 child: Icon(Icons.person, color: Colors.white),
//               ),
//               const SizedBox(width: 18),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     taskType,
//                     style: GoogleFonts.manrope(
//                       color: Colors.black,
//                       fontSize: 8,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     'Task details go here...',
//                     style: GoogleFonts.manrope(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const Spacer(),
//           // Bottom Row with Rating and Price
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   const Icon(Icons.star, color: Colors.amber, size: 20),
//                   const SizedBox(width: 4),
//                   Text(
//                     '5 Stars',
//                     style: GoogleFonts.manrope(
//                       fontSize: 8,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 '\$500',
//                 style: GoogleFonts.manrope(
//                   fontSize: 8,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   // Task Card Widget with dynamic content
//   Widget desktopTaskCard(String taskType) {
//     return Container(
//       width: 402,
//       height: 192.78,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(21),
//         border: Border.all(
//           color: const Color(0xffD9D9D9),
//           width: 2,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Top Row with Avatar and Text
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const CircleAvatar(
//                 radius: 24,
//                 backgroundColor: Colors.grey,
//                 child: Icon(Icons.person, color: Colors.white),
//               ),
//               const SizedBox(width: 18),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     taskType,
//                     style: GoogleFonts.manrope(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     'Task details go here...',
//                     style: GoogleFonts.manrope(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const Spacer(),
//           // Bottom Row with Rating and Price
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   const Icon(Icons.star, color: Colors.amber, size: 20),
//                   const SizedBox(width: 4),
//                   Text(
//                     '5 Stars',
//                     style: GoogleFonts.manrope(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 '\$500',
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
// }

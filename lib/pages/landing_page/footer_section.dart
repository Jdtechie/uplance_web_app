import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplance_flutter_web/responsive_screen.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  // Maintain expansion state for each section
  final Map<String, ValueNotifier<bool>> _expandedSections = {
    'For Clients': ValueNotifier(false),
    'For Talent': ValueNotifier(false),
    'Resources': ValueNotifier(false),
    'Company': ValueNotifier(false),
  };

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);

    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveWidget.isDesktop(context)
              ? 75
              : ResponsiveWidget.isTablet(context)
                  ? 50
                  : 12,
          vertical: ResponsiveWidget.isDesktop(context)
              ? 45
              : ResponsiveWidget.isTablet(context)
                  ? 50
                  : 24,
        ),
        child: isMobile
            ? _buildMobileFooter(context)
            : _buildDesktopFooter(context),
      ),
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    final footerSections = {
      'For Clients': [
        'How to hire',
        'Talent Marketplace',
        'Project Catalog',
        'Hire an agency',
        'Enterprise'
      ],
      'For Talent': [
        'How to find work',
        'Direct Contracts',
        'Find freelance jobs worldwide',
        'Find freelance jobs in the USA'
      ],
      'Resources': [
        'Help & Support',
        'Success stories',
        'Blog',
        'Community',
        'Affiliate programme'
      ],
      'Company': ['About us', 'Leadership', 'Careers', 'Press'],
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add all expandable footer sections
        ...footerSections.entries.map((entry) {
          return Column(
            children: [
              _buildExpandableFooterSection(entry.key, entry.value),
              // Add a divider after each section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(thickness: 1.0, color: Colors.white),
              ),
            ],
          );
        }),

        const SizedBox(height: 20),
        // Add social and app links at the bottom
        _buildSocialAndAppLinks(context),

        // Divider between sections
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Divider(thickness: 1.0, color: Colors.white),
        ),

        // Add footer bottom with terms and other info
        _buildFooterBottom(context),
      ],
    );
  }

  Widget _buildExpandableFooterSection(String title, List<String> links) {
    final expansionNotifier = _expandedSections[title]!;

    return ValueListenableBuilder<bool>(
      valueListenable: expansionNotifier,
      builder: (context, isExpanded, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    expansionNotifier.value = !isExpanded;
                  },
                ),
              ],
            ),
            if (isExpanded)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: links.map((link) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                    child: _buildFooterLink(link),
                  );
                }).toList(),
              ),
          ],
        );
      },
    );
  }
}

// This ensures that the footer links are always clickable
Widget _buildFooterLink(String text) {
  return GestureDetector(
    onTap: () => debugPrint('$text clicked'),
    child: Text(
      text,
      style: GoogleFonts.manrope(
        color: Colors.white,
        decoration: TextDecoration.underline,
        fontSize: 14,
      ),
    ),
  );
}

Widget _buildDesktopFooter(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildFooterColumns(context),
      const SizedBox(height: 40),
      _buildSocialAndAppLinks(context),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Divider(thickness: 1.0, color: Colors.white),
      ),
      _buildFooterBottom(context),
    ],
  );
}

Widget _buildFooterColumns(BuildContext context) {
  final footerSections = {
    'For Clients': [
      'How to hire',
      'Talent Marketplace',
      'Project Catalog',
      'Hire an agency',
      'Enterprise',
      'Any Hire',
      'Contract-to-hire',
      'Direct Contracts',
      'Hire worldwide',
      'Hire in the USA',
    ],
    'For Talent': [
      'How to find work',
      'Direct Contracts',
      'Find freelance jobs worldwide',
      'Find freelance jobs in the USA',
      'Win work with ads',
      'Exclusive resources with Freelancer Plus',
    ],
    'Resources': [
      'Help & Support',
      'Success stories',
      'Uplance reviews',
      'Blog',
      'Community',
      'Affiliate programme',
      'Free Business Tools',
      'Trust & Safety',
      'Terms of Service',
      'Privacy Policy',
    ],
    'Company': [
      'About us',
      'Leadership',
      'Investor relations',
      'Careers',
      'Our Impact',
      'Press',
      'Contact us',
      'Partners',
      'Modern slavery statement',
    ],
  };

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: footerSections.entries.map((entry) {
      return Expanded(
        child: _buildFooterColumn(entry.key, entry.value, context),
      );
    }).toList(),
  );
}

Widget _buildFooterColumn(
    String title, List<String> links, BuildContext context) {
  final isDesktop = ResponsiveWidget.isDesktop(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.manrope(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: isDesktop ? 18 : 16,
        ),
      ),
      const SizedBox(height: 10),
      ...links.map((link) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: _buildFooterLink(link),
          )),
    ],
  );
}

Widget _buildFooterBottom(BuildContext context) {
  final isMobile = ResponsiveWidget.isMobile(context);
  return isMobile
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '© ${DateTime.now().year - 10} - ${DateTime.now().year} Uplance© Global Inc.',
              style: GoogleFonts.manrope(color: Colors.white),
            ),
            const SizedBox(height: 10),
            _buildFooterElements([
              'Terms of Service',
              'Accessibility',
              'CA Notice at Collection',
              'Privacy Policy'
            ], false),
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '© ${DateTime.now().year - 10} - ${DateTime.now().year} Uplance© Global Inc.',
              style: GoogleFonts.manrope(color: Colors.white),
            ),
            _buildFooterElements([
              'Terms of Service',
              'Accessibility',
              'CA Notice at Collection',
              'Privacy Policy'
            ], true),
          ],
        );
}

Widget _buildFooterElements(List<String> links, bool isRow) {
  return isRow
      ? Row(
          children: links
              .map((link) => Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: _buildFooterLink(link),
                  ))
              .toList(),
        )
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: links
              .map((link) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: _buildFooterLink(link),
                  ))
              .toList(),
        );
}

Widget _buildSocialAndAppLinks(
  BuildContext context,
) {
  final bool isMobile = ResponsiveWidget.isMobile(context);
  return isMobile
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Follow Us', context),
            Row(
              children: [
                _buildSocialIcon(FontAwesomeIcons.facebook, 'Facebook'),
                _buildSocialIcon(FontAwesomeIcons.twitter, 'Twitter'),
                _buildSocialIcon(FontAwesomeIcons.linkedin, 'LinkedIn'),
                _buildSocialIcon(FontAwesomeIcons.instagram, 'Instagram'),
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Mobile App', context),
            Row(
              children: [
                _buildSocialIcon(Icons.android, 'Android'),
                _buildSocialIcon(Icons.apple, 'iOS'),
              ],
            ),
          ],
        )
      : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSectionTitle('Follow Us', context),
            const SizedBox(width: 20),
            Row(
              children: [
                _buildSocialIcon(FontAwesomeIcons.facebook, 'Facebook'),
                _buildSocialIcon(FontAwesomeIcons.twitter, 'Twitter'),
                _buildSocialIcon(FontAwesomeIcons.linkedin, 'LinkedIn'),
                _buildSocialIcon(FontAwesomeIcons.instagram, 'Instagram'),
              ],
            ),
            const Spacer(),
            _buildSectionTitle('Mobile App', context),
            const SizedBox(width: 20),
            Row(
              children: [
                _buildSocialIcon(Icons.android, 'Android'),
                _buildSocialIcon(Icons.apple, 'iOS'),
              ],
            ),
          ],
        );
}

Widget _buildSocialIcon(IconData icon, String platform) {
  return IconButton(
    icon: FaIcon(icon, color: Colors.white),
    onPressed: () => debugPrint('$platform clicked'),
  );
}

Widget _buildSectionTitle(String title, BuildContext context) {
  return Text(
    title,
    style: GoogleFonts.manrope(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: ResponsiveWidget.isDesktop(context) ? 18 : 16,
    ),
  );
}



// class FooterSection extends StatefulWidget {
//   const FooterSection({super.key});

//   @override
//   State<FooterSection> createState() => _FooterSectionState();
// }

// class _FooterSectionState extends State<FooterSection> {
//   // Map to hold the expanded state for each footer element
//   Map<String, bool> footerElementsExpanded = {
//     'For Clients': false,
//     'For Talent': false,
//     'Resources': false,
//     'Company': false,
//   };

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
//       color: Colors.black,
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           mobileFooterRow(),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 4.0),
//             child: Divider(height: 1.0, color: Colors.white),
//           ),
//           const SizedBox(height: 15),
//           mobileSocialFollowAndAppLinks(),
//           const SizedBox(height: 15),
//           const Divider(height: 1.0, color: Colors.white),
//           const SizedBox(height: 15),
//           mobileFooterBottom(),
//         ],
//       ),
//     );
//   }

//   Widget mobileFooterRow() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildExpandableFooterElements('For Clients', [
//           'How to hire',
//           'Talent Marketplace',
//           'Project Catalog',
//           'Hire an agency',
//           'Enterprise',
//         ]),
//         const Padding(
//           padding: EdgeInsets.symmetric(vertical: 4.0),
//           child: Divider(height: 1.0, color: Colors.white),
//         ),
//         _buildExpandableFooterElements('For Talent', [
//           'How to find work',
//           'Direct Contracts',
//           'Find freelance jobs worldwide',
//           'Find freelance jobs in the USA',
//         ]),
//         const Padding(
//           padding: EdgeInsets.symmetric(vertical: 4.0),
//           child: Divider(height: 1.0, color: Colors.white),
//         ),
//         _buildExpandableFooterElements('Resources', [
//           'Help & Support',
//           'Success stories',
//           'Blog',
//           'Community',
//           'Affiliate programme',
//         ]),
//         const Padding(
//           padding: EdgeInsets.symmetric(vertical: 4.0),
//           child: Divider(height: 1.0, color: Colors.white),
//         ),
//         _buildExpandableFooterElements('Company', [
//           'About us',
//           'Leadership',
//           'Careers',
//           'Press',
//         ]),
//       ],
//     );
//   }

//   Widget _buildExpandableFooterElements(String title, List<String> links) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Title and Expand/Collapse Icon
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: GoogleFonts.manrope(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             IconButton(
//               icon: Icon(
//                 footerElementsExpanded[title] == true
//                     ? Icons.keyboard_arrow_up_sharp
//                     : Icons.keyboard_arrow_down_sharp,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 setState(() {
//                   footerElementsExpanded[title] =
//                       !footerElementsExpanded[title]!;
//                 });
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         // Display the list of links if expanded
//         if (footerElementsExpanded[title] == true)
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: links.map((link) {
//               return Padding(
//                 padding: const EdgeInsets.only(left: 15.0, bottom:  8.0),
//                 child: mobileFooterLink(link),
//               );
//             }).toList(),
//           ),
//       ],
//     );
//   }

//   Widget mobileSocialFollowAndAppLinks() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Follow Us',
//           style: GoogleFonts.manrope(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             IconButton(
//               icon:
//                   const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
//               onPressed: () => debugPrint('Facebook clicked'),
//             ),
//             IconButton(
//               icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
//               onPressed: () => debugPrint('Twitter clicked'),
//             ),
//             IconButton(
//               icon:
//                   const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
//               onPressed: () => debugPrint('LinkedIn clicked'),
//             ),
//             IconButton(
//               icon:
//                   const FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
//               onPressed: () => debugPrint('Instagram clicked'),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Text(
//           'Mobile App',
//           style: GoogleFonts.manrope(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.android, color: Colors.white),
//               onPressed: () => debugPrint('Android clicked'),
//             ),
//             IconButton(
//               icon: const Icon(Icons.apple, color: Colors.white),
//               onPressed: () => debugPrint('iOS clicked'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget mobileFooterBottom() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Text(
//           '© ${DateTime.now().year - 10} - ${DateTime.now().year} Uplance© Global Inc.',
//           style: GoogleFonts.manrope(color: Colors.white),
//         ),
//         mobileFooterElements(
//           '',
//           ['Terms of Service', 'Privacy Policy', 'Cookie Settings'],
//           isRow: false,
//         ),
//       ],
//     );
//   }

//   // Custom widget for Footer Elements
//   Widget mobileFooterElements(String title, List<String> links,
//       {bool isRow = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (title.isNotEmpty)
//           Text(
//             title,
//             style: GoogleFonts.manrope(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         const SizedBox(height: 10),
//         // If isRow is true, use a Row for horizontal layout
//         if (isRow)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: links
//                 .map((link) => Padding(
//                       padding: const EdgeInsets.only(right: 24.0),
//                       child: mobileFooterLink(link),
//                     ))
//                 .toList(),
//           )
//         else
//           ...links.map(
//             (link) => Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: mobileFooterLink(link),
//             ),
//           ),
//       ],
//     );
//   }

//   Widget mobileFooterLink(String text) {
//     return GestureDetector(
//       onTap: () {
//         debugPrint('$text clicked');
//         // Add navigation logic here
//       },
//       child: Text(
//         text,
//         style: GoogleFonts.manrope(
//           color: Colors.white,
//           decoration: TextDecoration.underline,
//           fontSize: 14,
//         ),
//       ),
//     );
//   }
// }


// Widget _buildDesktopLayout() {
//   return Container(
//     color: Colors.black,
//     padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 100),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildFooterRow(),
//         const SizedBox(height: 40),
//         _buildSocialFollowAndAppLinks(),
//         const Padding(
//           padding: EdgeInsets.symmetric(vertical: 14.0),
//           child: Divider(thickness: 1.0, color: Colors.white),
//         ),
//         _buildFooterBottom(),
//       ],
//     ),
//   );
// }

// Widget _buildFooterRow() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       _buildFooterElements('For Clients', [
//         'How to hire',
//         'Talent Marketplace',
//         'Project Catalog',
//         'Hire an agency',
//         'Enterprise',
//         'Any Hire',
//         'Contract-to-hire',
//         'Direct Contracts',
//         'Hire worldwide',
//         'Hire in the USA'
//       ]),
//       _buildFooterElements('For Talent', [
//         'How to find work',
//         'Direct Contracts',
//         'Find freelance jobs worldwide',
//         'Find freelance jobs in the USA',
//         'Win work with ads',
//         'Exclusive resources with Freelancer Plus',
//       ]),
//       _buildFooterElements('Resources', [
//         'Help & Support',
//         'Success stories',
//         'Uplance reviews',
//         'Resources',
//         'Blog',
//         'Community',
//         'Affiliate programme',
//         'Free Business Tools',
//         'Trust & Safety',
//         'Terms of Service',
//         'Privacy Policy',
//       ]),
//       _buildFooterElements('Company', [
//         'About us',
//         'Leadership',
//         'Investor relations',
//         'Careers',
//         'Our Impact',
//         'Press',
//         'Contact us',
//         'Partners',
//         'Trust, safety & security',
//         'Modern slavery statement',
//       ]),
//     ],
//   );
// }

// Widget _buildSocialFollowAndAppLinks() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Row(
//         children: [
//           Text(
//             'Follow Us',
//             style: GoogleFonts.manrope(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//           const SizedBox(width: 10),
//           IconButton(
//             icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
//             onPressed: () => debugPrint('Facebook clicked'),
//           ),
//           IconButton(
//             icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
//             onPressed: () => debugPrint('Twitter clicked'),
//           ),
//           IconButton(
//             icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
//             onPressed: () => debugPrint('LinkedIn clicked'),
//           ),
//           IconButton(
//             icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
//             onPressed: () => debugPrint('Instagram clicked'),
//           ),
//         ],
//       ),
//       Row(
//         children: [
//           Text(
//             'Mobile App',
//             style: GoogleFonts.manrope(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//           const SizedBox(width: 10),
//           IconButton(
//             icon: const Icon(Icons.android, color: Colors.white),
//             onPressed: () => debugPrint('Android clicked'),
//           ),
//           IconButton(
//             icon: const Icon(Icons.apple, color: Colors.white),
//             onPressed: () => debugPrint('iOS clicked'),
//           ),
//         ],
//       ),
//     ],
//   );
// }

// Widget _buildFooterBottom() {
//   return Row(
//     children: [
//       Text(
//         '© ${DateTime.now().year - 10} - ${DateTime.now().year} Uplance© Global Inc.',
//         style: GoogleFonts.manrope(color: Colors.white),
//       ),
//       const SizedBox(width: 35),
//       _buildFooterElements(
//         '',
//         [
//           'Terms of Service',
//           'Accessibility',
//           'CA Notice at Collection',
//           'Privacy Policy'
//         ],
//         isRow: true,
//       ),
//     ],
//   );
// }

// // Custom widget for Footer Elements
// Widget _buildFooterElements(String title, List<String> links,
//     {bool isRow = false}) {
//   return Expanded(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (title.isNotEmpty)
//           Text(
//             title,
//             style: GoogleFonts.manrope(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         if (title.isNotEmpty) const SizedBox(height: 14),
//         // If isRow is true, use a Row for horizontal layout
//         if (isRow)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: links
//                 .map((link) => Padding(
//                       padding: const EdgeInsets.only(right: 24.0),
//                       child: _buildFooterLink(link),
//                     ))
//                 .toList(),
//           )
//         else
//           ...links.map(
//             (link) => Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: _buildFooterLink(link),
//             ),
//           ),
//       ],
//     ),
//   );
// }

// Widget _buildFooterLink(String text) {
//   return GestureDetector(
//     onTap: () {
//       debugPrint('$text clicked');
//       // Add navigation logic here
//     },
//     child: Text(
//       text,
//       style: GoogleFonts.manrope(
//         color: Colors.white,
//         decoration: TextDecoration.underline,
//         fontSize: 14,
//       ),
//     ),
//   );
// }

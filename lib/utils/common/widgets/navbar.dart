import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplance_flutter_web/responsive_screen.dart';
import 'package:uplance_flutter_web/utils/common/text_strings.dart';

class Navbar extends StatelessWidget {
  final VoidCallback? onMenuTap; // Callback for menu icon tap (optional)

  const Navbar({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveWidget.isDesktop(context);
    final bool isTablet = ResponsiveWidget.isTablet(context);
    final bool isMobile = ResponsiveWidget.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  uplanceLogo,
                  height: 30,
                  width: 150,
                ),
                // const SizedBox(width: 50),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:  10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black,
                              // side: const BorderSide(
                              //   color: Colors.black,
                              //   width: 1.5,
                              // ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12,
                              ),
                            ),
                            child: Text(
                              'Post a Task',
                              style: GoogleFonts.manrope(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        navItems('Categories', context),
                        navItems('How It Works', context),
                        navItems('Browse Tasks', context),
                        const Spacer(),
                        Row(
                          children: [
                            navItems('Sign Up', context),
                            navItems('Log in', context),
                            const SizedBox(width: 10),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: Colors.black, width: 1.5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
                              child: Text(
                                'Become a Tasker',
                                style: GoogleFonts.manrope(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
           : isTablet
           ?  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            uplanceLogo,
            height: 26,
            width: 125,
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                final screenWidth = MediaQuery.of(context).size.width;

                // Check if screen width is exactly 1024
                bool isExact1024 = screenWidth == 1024;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Toggle navigation items based on screen width
                    isExact1024
                        ? Padding(
                          padding: const EdgeInsets.only(left : 20.0),
                          child: Row(
                              children: [
                                  OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black,
                              // side: const BorderSide(
                              //   color: Colors.black,
                              //   width: 1.5,
                              // ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12,
                              ),
                            ),
                            child: Text(
                              'Post a Task',
                              style: GoogleFonts.manrope(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                                navItems('Categories', context),
                                navItems('How It Works', context),
                                navItems('Browse Tasks', context),
                              ],
                            ),
                        )
                        : Row(
                            children: [
                              const SizedBox(width: 12),
                              OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black,
                              // side: const BorderSide(
                              //   color: Colors.black,
                              //   width: 1.5,
                              // ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12,
                              ),
                            ),
                            child: Text(
                              'Post a Task',
                              style: GoogleFonts.manrope(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                              navItems('Categories', context),
                              navItems('How It\nWorks', context),
                              navItems('Browse\n\tTasks', context),
                            ],
                          ),
                    const Spacer(),
                    Row(
                      children: [
                         // SignUp and LogIn items based on screen width
                        if (isExact1024) ...[
                          navItems('Sign Up', context),
                          navItems('Log in', context),
                        ] else ...[
                          navItems('Sign\n\t\tUp', context),
                          navItems('Log\n\t\tin', context),
                        ],
                   
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 12,
                            ),
                          ),
                          child: Text(
                            'Become a Tasker',
                            style: GoogleFonts.manrope(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      )
          //     ? Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           SvgPicture.asset(
          //             uplanceLogo,
          //             height: 26,
          //             width: 125,
          //           ),
          //           // const SizedBox(width: 50),
          //           Expanded(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 navItems('Post a Task', context),
          //                 navItems('Categories', context),
          //                 navItems('How It Works', context),
          //                 navItems('Browse Tasks', context),
          //                 // navItems('How It\nWorks', context),
          //                 // navItems('Browse\n\tTasks', context),
          //                 const Spacer(),
          //                 Row(
          //                   children: [
          //                     navItems('SignUp', context),
          //                     navItems('Log in', context),
          //                     // navItems('Sign\n\t\tUp', context),
          //                     // navItems('Log\n\t\tin', context),
          //                     OutlinedButton(
          //                       onPressed: () {},
          //                       style: OutlinedButton.styleFrom(
          //                         side: const BorderSide(
          //                             color: Colors.black, width: 1.5),
          //                         padding: const EdgeInsets.symmetric(
          //                             horizontal: 6, vertical: 12),
          //                       ),
          //                       child: Text(
          //                         'Become a Tasker',
          //                         style: GoogleFonts.manrope(
          //                           fontSize: 13,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.black,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //  IconButton(
                    //   icon: const Icon(Icons.menu),
                    //   onPressed: onMenuTap, // Open drawer or menu
                    // ),
                    SvgPicture.asset(
                      uplanceLogo,
                      height: 19.03,
                      width: 104.28,
                    ),
                    const Spacer(),

                    navItems('Sign Up', context),

                    Container(
                      height: 29,
                      width: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(21),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget mobileMenuIcon() {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: onMenuTap, // Trigger the callback to open the drawer
    );
  }

  Widget navItems(String title, BuildContext context) {
    final bool isDesktop = ResponsiveWidget.isDesktop(context);
    return TextButton(
      onPressed: () {
        // Add navigation logic here
      },
      child: Text(
        title,
        style: GoogleFonts.manrope(
          fontSize: isDesktop ? 16 : 13,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

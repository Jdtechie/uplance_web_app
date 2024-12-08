import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplance_flutter_web/utils/common/text_strings.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();

  // Method to perform search logic
  void _performSearch() {
    final query = _controller.text;
    // Perform your search logic here, for now, it prints the query
    debugPrint('Searching for: $query');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black, width: 4),
      ),
      child: Center(
        child: Row(
          // crossAxisAlignment:
          //     CrossAxisAlignment.center, // Ensures vertical centering
          children: [
            // TextField for entering search query
            Expanded(
              child: Container(
                height:
                    50, // Ensure the height is consistent with the container
                alignment: Alignment.center, // Centers the TextField vertically
                child: TextField(
                  controller: _controller,
                  onSubmitted: (_) =>
                      _performSearch(), // Trigger search on "Enter" key press
                  decoration: InputDecoration(
                    hintText: 'Post a Task with AI for Free',
                    hintStyle: GoogleFonts.manrope(
                        fontSize: 17, color: const Color(0xff575757)),
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.manrope(
                      fontSize: 17, color: const Color(0xff575757)),
                ),
              ),
            ),
            // SVG Search Icon
            const SizedBox(width: 10),
            // Container to scale the SVG icon to fill the button
            SizedBox(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                aiSearchIcon,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// class CustomSearchBar extends StatelessWidget {
//   const CustomSearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 400,
//       height: 50,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),  
//       decoration: BoxDecoration(
//         color: Colors.white, 
//         borderRadius: BorderRadius.circular(25),  
//         border: Border.all(color: Colors.black, width: 4),  
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         mainAxisSize: MainAxisSize.min,  // To avoid taking extra space
//         children: [
//           Text(
//             'Post a Task with AI for Free', 
//             style: GoogleFonts.manrope(fontSize: 17, color: const Color(0xff575757),),  // Text style
//           ),
//           const SizedBox(width: 10),  
//           SvgPicture.asset(
//             aiSearchIcon, 
//             height: 31.99,
//             width: 31.41, 
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  String? expandedItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
          width: MediaQuery.of(context).size.width, // Full screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Close icon and "Post a task" button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, size: 24, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Post a task clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child:  Text(
                      'Post a task',
                      style: GoogleFonts.manrope(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
        
            const Divider(thickness: 1, color: Colors.grey),
        
            // Expandable Drawer menu
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  expandableItems(
                    context,
                    title: 'Categories for Posters',
                    subItems: [
                      'Accountants',
                      'Admin',
                      'Alterations',
                      'Appliances',
                      'Assembly',
                      'Auto Electricians',
                      'Bakers',
                      'Barbers',
                      'Beauticians',
                      'Bicycle Service',
                      'Bricklaying',
                      'Building & Construction',
                      'Business',
                      'Car Body Work',
                    ],
                  ),
                  expandableItems(
                    context,
                    title: 'Categories for Taskers',
                    subItems: ['Option 1', 'Option 2', 'Option 3'],
                  ),
                  drawerItems(context, title: 'Log in'),
                  drawerItems(context, title: 'Join Airtasker'),
                  drawerItems(context, title: 'Browse tasks'),
                  drawerItems(context, title: 'How it works'),
                  drawerItems(context, title: 'Insurance'),
                  drawerItems(context, title: 'Community guidelines'),
                  drawerItems(context, title: 'Help'),
                  drawerItems(context, title: 'Terms & Conditions'),
                  drawerItems(context, title: 'Privacy policy'),
                  drawerItems(context, title: 'Contact us'),
                  drawerItems(context, title: 'About us'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget expandableItems(
    BuildContext context, {
    required String title,
    required List<String> subItems,
  }) {
    final bool isExpanded = expandedItem == title;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            title,
            style: GoogleFonts.manrope(fontSize: 16, color: Colors.black),
          ),
          trailing: Icon(
            isExpanded ? Icons.arrow_drop_up : Icons.arrow_forward_ios,
            size: 16,
            color: Colors.black,
          ),
          onTap: () {
            setState(() {
              expandedItem = isExpanded ? null : title;
            });
          },
        ),
        if (isExpanded)
          Container(
            color: Colors.grey[200], // Light background for sub-items
            child: Column(
              children: subItems.map((subItem) {
                return ListTile(
                  title: Text(
                    subItem,
                    style:GoogleFonts.manrope(fontSize: 14, color: Colors.black),
                  ),
                  onTap: () {
                    debugPrint('$subItem clicked');
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget drawerItems(
    BuildContext context, {
    required String title,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      onTap: () {
        debugPrint('$title clicked');
        Navigator.pop(context); // Close the drawer on tap
      },
    );
  }
}

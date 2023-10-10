import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding for content
      child: Row(
        children: [
          Icon(
            Icons.search, // Search icon
            color: Colors.grey, // Icon color
          ),
          SizedBox(width: 10), // Spacer between icon and text field
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search', // Hint text
                border: InputBorder.none, // Remove border
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 5), // Adjust the spacing between icon and text
          Text(title),
        ],
      ),
    );
  }
}

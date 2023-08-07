import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryWidget({
    required this.title,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Chip(
          label: Text(title),
          avatar: Icon(icon),
          backgroundColor: isSelected ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}

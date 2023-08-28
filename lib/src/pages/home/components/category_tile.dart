import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.category, required this.isSelected, required this.onPressed});
  
  final String category;
  final bool isSelected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text(category, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
import 'package:flutter/material.dart';

Widget tabItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? Colors.deepOrange : const Color(0xFF94A3B8),
              ),
            ),
          ),
          Container(
            height: 3,
            color: isSelected ? Colors.deepOrange : Colors.transparent,
          ),
        ],
      ),
    );
  }
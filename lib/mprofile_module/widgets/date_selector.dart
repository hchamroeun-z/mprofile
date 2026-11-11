import 'package:flutter/material.dart';
import 'package:mprofile/mprofile_module/notifier/search_result_notifier.dart';

Widget dateSelectorStrip(SearchResultNotifier notifier, int selectedIndex) {
    final dates = [
      {'day': 'NOV', 'date': '8'},
      {'day': 'NOV', 'date': '9'},
      {'day': 'NOV', 'date': '10'},
      {'day': 'NOV', 'date': '11'},
      {'day': 'NOV', 'date': '12'},
    ];

    return Container(
      height: 75,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final item = dates[index];

          return GestureDetector(
            onTap: () => notifier.selectDate(index),
            child: Container(
              width: 64,
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? Colors.deepOrange : const Color(0xFFE2E8F0),
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['day']!,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.deepOrange : const Color(0xFF94A3B8),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item['date']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.deepOrange : const Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
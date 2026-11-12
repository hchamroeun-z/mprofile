import 'package:flutter/material.dart';

Widget emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration placeholder
            Container(
              width: 90,
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2FE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  Positioned(
                    top: 24,
                    child: Text(
                      '!?',
                      style: TextStyle(
                        color: Color(0xFF0EA5E9),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Oops!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'It looks like you have not made any trips yet',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF94A3B8),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Book now',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
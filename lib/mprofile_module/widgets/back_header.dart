
import 'package:flutter/material.dart';

Widget backHeader(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://cdn.bookaway.com/media/files/660d746ced0816d0136cb391.webp?width=943&height=414&quality=60',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.4),
              Colors.black.withValues(alpha: 0.1),
              const Color(0xFFF8FAFC).withValues(alpha: 0.9),
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 4),
            const Text(
              'Bus Search',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black45, blurRadius: 4)],
              ),
            ),
          ],
        ),
      ),
    );
  }
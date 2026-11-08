import 'package:flutter/material.dart';

Widget headerBackground() {
    return Container(
      height: 270,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYIDwr8_NQKkH3aG_YmGfU3ZMbYEa4gr1z-G_-agHrpQ&s=10',
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
              const Color(0x4D000000), // Black with 30% opacity (0.3 * 255 = ~77 -> 4D)
              const Color(0x1A000000), // Black with 10% opacity (0.1 * 255 = ~26 -> 1A)
              const Color(0xE6F8FAFC), // #F8FAFC with 90% opacity (0.9 * 255 = ~230 -> E6)

            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 54, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Good afternoon,',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                shadows: [Shadow(color: Colors.black45, blurRadius: 4)],
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Traveller',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black45, blurRadius: 6)],
              ),
            ),
          ],
        ),
      ),
    );
  }
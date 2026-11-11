import 'package:flutter/material.dart';

Widget popularDestinationsList() {
    final destinations = [
      {
        'city': 'Phnom Penh',
        'image': 'https://pacifichotel.asia/wp-content/uploads/2024/08/palais-royal-du-cambodge-phnom-penh-scaled-1.jpg'
      },
      {
        'city': 'Kampot',
        'image': 'https://www.flexibletourism.com/userfiles/thumbs/Seahorse.jpg'
      },
      {
        'city': 'Siem Reap',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU5a3kC603qd09fkFCH6D9XK-LHUMxyypzYc22y4kw74zRTIK0qTP7TKP5&s=10'
      },
    ];

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final dest = destinations[index];
          return Container(
            width: 150,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(dest['image']!),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                gradient: LinearGradient(
                  colors: [Colors.black.withValues(alpha: 0.8), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Text(
                dest['city']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
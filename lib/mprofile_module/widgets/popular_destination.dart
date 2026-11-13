import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/models/popular_destination.dart';
import 'package:mprofile/mprofile_module/notifier/bus_search_notifier.dart';
import 'package:mprofile/mprofile_module/screens/bus_search.dart';
import 'package:mprofile/mprofile_module/screens/choose_location_screen.dart';

Widget popularDestinationsList(BuildContext context, WidgetRef ref) {
    final destinations = [
      const PopularDestinationItem(
        name: 'Phnom Penh',
        imageUrl: 'https://pacifichotel.asia/wp-content/uploads/2024/08/palais-royal-du-cambodge-phnom-penh-scaled-1.jpg'
      ),
      const PopularDestinationItem(
        name: 'Kampot',
        imageUrl: 'https://www.flexibletourism.com/userfiles/thumbs/Seahorse.jpg'
      ),
      const PopularDestinationItem(
        name: 'Siemreap',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU5a3kC603qd09fkFCH6D9XK-LHUMxyypzYc22y4kw74zRTIK0qTP7TKP5&s=10'
      ),
    ];

    return SizedBox(
    height: 220,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        final dest = destinations[index];
        return GestureDetector(
          onTap: () async {
            // Pre-fill the destination in Riverpod state
            ref.read(busSearchProvider.notifier).setDestination(dest.name);

            // Open ChooseLocationScreen so the user can pick their Origin
            final selectedOrigin = await Navigator.push<String>(
              context,
              MaterialPageRoute(
                builder: (_) => const ChooseLocationScreen(title: 'Choose Origin'),
              ),
            );

            // If an origin is selected, update state and proceed to BusSearchScreen
            if (selectedOrigin != null && context.mounted) {
              ref.read(busSearchProvider.notifier).setOrigin(selectedOrigin);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BusSearch()),
              );
            }
          },
          child: Container(
            width: 150,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(dest.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(12),
              child: Text(
                dest.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
  }
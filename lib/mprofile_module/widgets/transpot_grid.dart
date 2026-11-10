import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/notifier/home_notifier.dart';
import 'package:mprofile/mprofile_module/screens/bus_search.dart';

Widget transpotGrid(BuildContext context,WidgetRef ref, TransportType selectedType) {
    final items = [
      {
        'type': TransportType.train,
        'label': 'Train',
        'icon': Icons.train,
        'isNew': true,
      },
      {
        'type': TransportType.bus,
        'label': 'Bus',
        'icon': Icons.directions_bus,
        'isNew': false,
      },
      {
        'type': TransportType.ferry,
        'label': 'Ferry',
        'icon': Icons.directions_boat,
        'isNew': false,
      },
      {
        'type': TransportType.privateTaxi,
        'label': 'Private Taxi',
        'icon': Icons.local_taxi,
        'isNew': false,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          final type = item['type'] as TransportType;
          final isSelected = selectedType == type;
          final isNew = item['isNew'] as bool;

          return GestureDetector(
           onTap: () {
            ref.read(homeNotifierProvider.notifier).selectTransport(type);
             Navigator.of(context).pushNamed('/bussearch',arguments: item);
          },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFEFF6FF) : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        item['icon'] as IconData,
                        color: const Color(0xFF0EA5E9),
                        size: 28,
                      ),
                    ),
                    if (isNew)
                      Positioned(
                        top: -4,
                        right: -10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'New',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item['label'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? const Color(0xFF0EA5E9) : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifier/location_selection_notifier.dart';

class ChooseLocationScreen extends ConsumerWidget {
  final String title; // e.g., "Choose Origin" or "Choose Destination"
  
  const ChooseLocationScreen({super.key, this.title = 'Choose Origin'});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationSelectionProvider);
    final notifier = ref.read(locationSelectionProvider.notifier);
    final locations = state.filteredLocations;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close, color: Color(0xFF64748B), size: 24),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: (val) => notifier.setSearchQuery(val),
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 16),
                  prefixIcon: Icon(Icons.search, color: Color(0xFF94A3B8)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
          ),

          // Locations List
          Expanded(
            child: ListView.separated(
              itemCount: locations.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFFE2E8F0),
                indent: 16,
                endIndent: 16,
              ),
              itemBuilder: (context, index) {
                final location = locations[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pop(location.name);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          location.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        Text(
                          location.code,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
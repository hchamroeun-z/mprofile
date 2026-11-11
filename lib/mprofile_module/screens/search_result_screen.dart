import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/notifier/bus_search_notifier.dart';
import 'package:mprofile/mprofile_module/screens/choose_location_screen.dart';
import 'package:mprofile/mprofile_module/widgets/date_selector.dart';
import 'package:mprofile/mprofile_module/widgets/featured_trip_card.dart';
import 'package:mprofile/mprofile_module/widgets/trip_card.dart';
import '../notifier/search_result_notifier.dart';

class BusSearchResultsScreen extends ConsumerWidget {
  const BusSearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchResultProvider);
    final notifier = ref.read(searchResultProvider.notifier);

    final theme = Theme.of(context);
    final featuredTrips = state.trips.where((t) => t.isFeatured).toList();
    final allTrips = state.trips;

    String _getLocationCode(String fullName) {
  switch (fullName.toLowerCase()) {
    case 'phnom penh':
      return 'PNH';
    case 'siem reap':
      return 'SR';
    case 'sihanoukville':
      return 'SHV';
    case 'poi pet':
      return 'PPT';
    case 'kampot':
      return 'KP';
    case 'battambang':
      return 'BTB';
    case 'kep':
      return 'KEP';
    default:
      return fullName.isNotEmpty ? fullName.substring(0, 3).toUpperCase() : 'PNH';
  }
}

    final searchState = ref.watch(busSearchProvider);
    final originCode = _getLocationCode(searchState.origin.isNotEmpty ? searchState.origin : 'Phnom Penh');
    final destCode = _getLocationCode(searchState.destination.isNotEmpty ? searchState.destination : 'Kampot');

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.deepOrange, size: 20),
        ),
        title: Row(
          children: [
             Text(
              '$originCode → $destCode',
              style: TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () => _showEditRouteBottomSheet(context, ref), // Trigger bottom sheet
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
              child: Row(
                children: const [
                  Icon(Icons.edit, size: 12, color: Color(0xFF64748B)),
                  SizedBox(width: 4),
                  Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_list, color: Colors.deepOrange, size: 20),
            label: const Text(
              'Filter',
              style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Subheader: Passengers & Date Info
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Row(
              children: const [
                Icon(Icons.person_outline, size: 16, color: Color(0xFF94A3B8)),
                SizedBox(width: 4),
                Text('1', style: TextStyle(color: Color(0xFF64748B), fontSize: 13, fontWeight: FontWeight.w600)),
                SizedBox(width: 12),
                Icon(Icons.calendar_today_outlined, size: 14, color: Color(0xFF94A3B8)),
                SizedBox(width: 4),
                Text('Nov 09, 2026', style: TextStyle(color: Color(0xFF64748B), fontSize: 13, fontWeight: FontWeight.w600)),
              ],
            ),
          ),

          // Date Selector Strip
          dateSelectorStrip(notifier, state.selectedDateIndex),

          // Scrollable Trip Results
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (featuredTrips.isNotEmpty) ...[
                  Text(
                    'Featured Trips',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 205,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredTrips.length,
                      itemBuilder: (context, index) {
                        return featuredTripCard(featuredTrips[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                Text(
                  'All Trips',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12),
                ...allTrips.map((trip) => tripCard(trip)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _showEditRouteBottomSheet(BuildContext context, WidgetRef ref) {
  final currentSearchState = ref.read(busSearchProvider);
  String tempOrigin = currentSearchState.origin;
  String tempDestination = currentSearchState.destination;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (modalContext) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Edit Route',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(modalContext),
                      icon: const Icon(Icons.close, color: Color(0xFF64748B)),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Form Container for Origin & Destination
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Column(
                        children: [
                          // Origin Picker Field
                          InkWell(
                            onTap: () async {
                              final selected = await Navigator.push<String>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ChooseLocationScreen(title: 'Choose Origin'),
                                ),
                              );
                              if (selected != null) {
                                setModalState(() {
                                  tempOrigin = selected;
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  const Icon(Icons.trip_origin, color: Color(0xFF94A3B8), size: 20),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      tempOrigin.isEmpty ? 'Choose Origin' : tempOrigin,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: tempOrigin.isEmpty ? const Color(0xFF94A3B8) : const Color(0xFF1E293B),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          // Destination Picker Field
                          InkWell(
                            onTap: () async {
                              final selected = await Navigator.push<String>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ChooseLocationScreen(title: 'Choose Destination'),
                                ),
                              );
                              if (selected != null) {
                                setModalState(() {
                                  tempDestination = selected;
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_on_outlined, color: Color(0xFF94A3B8), size: 20),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      tempDestination.isEmpty ? 'Choose Destination' : tempDestination,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: tempDestination.isEmpty ? const Color(0xFF94A3B8) : const Color(0xFF1E293B),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Swap Button
                      Positioned(
                        right: 12,
                        child: GestureDetector(
                          onTap: () {
                            setModalState(() {
                              final swap = tempOrigin;
                              tempOrigin = tempDestination;
                              tempDestination = swap;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFE2E8F0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: const Icon(Icons.swap_vert, color: Colors.deepOrange, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                
                // Update Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      final notifier = ref.read(busSearchProvider.notifier);
                      notifier.setOrigin(tempOrigin);
                      notifier.setDestination(tempDestination);

                      // Optional: Fetch or refresh results state here
                      // ref.read(searchResultProvider.notifier).fetchResults();

                      Navigator.pop(modalContext);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Update Route',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
}
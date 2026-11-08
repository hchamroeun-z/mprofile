import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mprofile/mprofile_module/notifier/home_notifier.dart';
import 'package:mprofile/mprofile_module/widgets/header_background.dart';
import 'package:mprofile/mprofile_module/widgets/promo_banner.dart';
import 'package:mprofile/mprofile_module/widgets/special_offer.dart';
import 'package:mprofile/mprofile_module/widgets/transpot_grid.dart';
import '../notifier/route_search_notifier.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeNotifierProvider);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          // Top Illustrated Header & Floating Transport Grid
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                headerBackground(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 210, 16, 0),
                  child: Column(
                    children: [
                      transpotGrid(ref, homeState.selectedTransport),
                      const SizedBox(height: 16),
                      promoBanner(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Content Sections
          // Special Offers Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Special offers',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  specialOffersCarousel(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchCard(
    BuildContext context,
    WidgetRef ref,
    RouteSearchState state,
  ) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Column(
                  children: [
                    _buildLocationField(
                      icon: Icons.trip_origin,
                      iconColor: Colors.green,
                      label: 'From',
                      value: state.origin?.name ?? 'Select Departure',
                      onTap: () {},
                    ),
                    const Divider(height: 1, color: Color(0xFFE2E8F0)),
                    _buildLocationField(
                      icon: Icons.location_on,
                      iconColor: Colors.redAccent,
                      label: 'To',
                      value: state.destination?.name ?? 'Select Destination',
                      onTap: () {},
                    ),
                  ],
                ),
                Positioned(
                  right: 4,
                  child: RawMaterialButton(
                    onPressed: () => ref
                        .read(routeSearchProvider.notifier)
                        .swapLocations(),
                    elevation: 2,
                    fillColor: Colors.white,
                    shape: const CircleBorder(),
                    constraints: const BoxConstraints.tightFor(
                      width: 40,
                      height: 40,
                    ),
                    child: const Icon(Icons.swap_vert, color: Color(0xFF2563EB)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: state.travelDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 90)),
                );
                if (picked != null) {
                  ref.read(routeSearchProvider.notifier).updateDate(picked);
                }
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFCBD5E1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 20, color: Color(0xFF64748B)),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Departure Date',
                            style: TextStyle(
                                fontSize: 10, color: Color(0xFF64748B))),
                        Text(
                          DateFormat('EEE, dd MMM yyyy')
                              .format(state.travelDate),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF1E293B)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Search Schedules',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildLocationField({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 10, color: Color(0xFF64748B))),
                Text(
                  value,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingTripBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBFDBFE)),
      ),
      child: Row(
        children: [
          const Icon(Icons.confirmation_number,
              color: Color(0xFF2563EB), size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Upcoming Trip: Phnom Penh → Koh Rong',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xFF1E293B)),
                ),
                SizedBox(height: 2),
                Text(
                  'Tomorrow at 08:00 AM • Bus + Ferry',
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 11),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF64748B)),
        ],
      ),
    );
  }

  Widget _buildPopularRoutesList() {
    final routes = [
      {'from': 'Phnom Penh', 'to': 'Siem Reap', 'price': '\$12.00'},
      {'from': 'Phnom Penh', 'to': 'Sihanoukville', 'price': '\$10.00'},
      {'from': 'Siem Reap', 'to': 'Battambang', 'price': '\$8.00'},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: routes.length,
        itemBuilder: (context, index) {
          final item = routes[index];
          return Container(
            width: 180,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${item['from']} → ${item['to']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xFF1E293B)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('From',
                        style: TextStyle(
                            color: Color(0xFF64748B), fontSize: 11)),
                    Text(
                      item['price']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
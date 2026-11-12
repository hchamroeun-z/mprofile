import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/notifier/booking_notifier.dart';
import 'package:mprofile/mprofile_module/widgets/booking_card.dart';
import 'package:mprofile/mprofile_module/widgets/empty_state.dart';
import 'package:mprofile/mprofile_module/widgets/tab_item.dart';

class BookingsScreen extends ConsumerWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingsProvider);
    final notifier = ref.read(bookingsProvider.notifier);

    // Filter bookings based on active tab
    final filteredBookings = state.bookings
        .where((b) => state.selectedTab == 0 ? b.isUpcoming : !b.isUpcoming)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Bookings',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.receipt_long_outlined, color: Colors.deepOrange),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Custom Tab Bar Header
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: tabItem(
                    title: 'Upcoming',
                    isSelected: state.selectedTab == 0,
                    onTap: () => notifier.setTab(0),
                  ),
                ),
                Expanded(
                  child: tabItem(
                    title: 'Past bookings',
                    isSelected: state.selectedTab == 1,
                    onTap: () => notifier.setTab(1),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFE2E8F0)),

          // Body Content (List or Empty State)
          Expanded(
            child: filteredBookings.isEmpty
                ? emptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredBookings.length,
                    itemBuilder: (context, index) {
                      return bookingCard(filteredBookings[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
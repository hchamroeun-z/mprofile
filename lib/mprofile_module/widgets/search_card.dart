import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/notifier/bus_search_notifier.dart';
import 'package:mprofile/mprofile_module/screens/choose_location_screen.dart';
import 'package:intl/intl.dart';

Widget searchCard(BuildContext context, WidgetRef ref, BusSearchState state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Origin & Destination Inputs with Swap Button
          Stack(
            alignment: Alignment.centerRight,
            children: [
            Column(
              children: [
                _buildInputField(
                  context: context,
                  ref: ref,
                  icon: Icons.trip_origin,
                  iconColor: const Color(0xFF94A3B8),
                  hint: 'Choose Origin',
                  value: state.origin,
                  isOrigin: true,
                ),
                const Divider(height: 1, color: Color(0xFFE2E8F0)),
                _buildInputField(
                  context: context,
                  ref: ref,
                  icon: Icons.location_on_outlined,
                  iconColor: const Color(0xFF94A3B8),
                  hint: 'Choose Destination',
                  value: state.destination,
                  isOrigin: false,
                ),
              ],
            ),

              Positioned(
                right: 4,
                child: GestureDetector(
                  onTap: () => ref.read(busSearchProvider.notifier).swapLocations(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.swap_vert, color: Color(0xFF64748B), size: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Passenger Selector Field
          _buildPassengerSelectorField(context,ref,state.passengers),
            
          const SizedBox(height: 16),

          // Departure & Return Dates
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: state.departureDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (picked != null) {
                      ref.read(busSearchProvider.notifier).setDepartureDate(picked);
                    }
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Departure Date', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('EEE, d MMM').format(state.departureDate),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1E293B)),
                            ),
                            const Icon(Icons.calendar_today_outlined, size: 16, color: Color(0xFF94A3B8)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: state.returnDate ?? state.departureDate,
                      firstDate: state.departureDate,
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (picked != null) {
                      ref.read(busSearchProvider.notifier).setReturnDate(picked);
                    }
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Return Date', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.returnDate != null
                                  ? DateFormat('EEE, d MMM').format(state.returnDate!)
                                  : 'Add Return',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: state.returnDate != null ? const Color(0xFF1E293B) : Colors.deepOrange,
                              ),
                            ),
                            const Icon(Icons.calendar_today_outlined, size: 16, color: Color(0xFF94A3B8)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Search Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Trigger search action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Search',
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
  }

Widget _buildInputField({
  required BuildContext context,
  required WidgetRef ref,
  required IconData icon,
  required Color iconColor,
  required String hint,
  required String value,
  required bool isOrigin,
}) {
  return InkWell(
    onTap: () async {
      // 1. Open the selection screen and await the result
      final selectedCity = await Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseLocationScreen(
            title: isOrigin ? 'Choose Origin' : 'Choose Destination',
          ),
        ),
      );

      // 2. If a city was chosen, update the state via provider notifier
      if (selectedCity != null) {
        if (isOrigin) {
          ref.read(busSearchProvider.notifier).setOrigin(selectedCity);
        } else {
          ref.read(busSearchProvider.notifier).setDestination(selectedCity);
        }
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Text(
            value.isEmpty ? hint : value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: value.isEmpty ? const Color(0xFF94A3B8) : const Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    ),
  );
}

void _showPassengerPicker(BuildContext context, WidgetRef ref, int currentPassengers) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      int tempPassengers = currentPassengers;
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Select Passengers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Passengers',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF334155),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: tempPassengers > 1
                              ? () {
                                  setModalState(() {
                                    tempPassengers--;
                                  });
                                }
                              : null,
                          icon: const Icon(Icons.remove_circle_outline),
                          color: tempPassengers > 1 ? Colors.deepOrange : Colors.grey,
                          iconSize: 28,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            '$tempPassengers',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setModalState(() {
                              tempPassengers++;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline),
                          color: Colors.deepOrange,
                          iconSize: 28,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(busSearchProvider.notifier).setPassengers(tempPassengers);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Done',
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

Widget _buildPassengerSelectorField(BuildContext context, WidgetRef ref, int passengers) {
  return InkWell(
    onTap: () => _showPassengerPicker(context, ref, passengers),
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.people_outline, color: Color(0xFF94A3B8), size: 20),
          const SizedBox(width: 24),
          Text(
            '$passengers Passenger${passengers > 1 ? 's' : ''}',
            style: const TextStyle(
              color: Color(0xFF1E293B),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}
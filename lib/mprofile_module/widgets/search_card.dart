import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/notifier/bus_search_notifier.dart';
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
                    icon: Icons.trip_origin,
                    iconColor: const Color(0xFF94A3B8),
                    hint: 'Choose Origin',
                    value: state.origin,
                    onChanged: (val) => ref.read(busSearchProvider.notifier).setOrigin(val),
                  ),
                  const Divider(height: 1, color: Color(0xFFE2E8F0)),
                  _buildInputField(
                    icon: Icons.location_on_outlined,
                    iconColor: const Color(0xFF94A3B8),
                    hint: 'Choose Destination',
                    value: state.destination,
                    onChanged: (val) => ref.read(busSearchProvider.notifier).setDestination(val),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE2E8F0)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.people_outline, color: Color(0xFF94A3B8), size: 20),
                const SizedBox(width: 12),
                Text(
                  '${state.passengers} Passenger${state.passengers > 1 ? 's' : ''}',
                  style: const TextStyle(
                    color: Color(0xFF1E293B),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
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
    required IconData icon,
    required Color iconColor,
    required String hint,
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              controller: TextEditingController(text: value)
                ..selection = TextSelection.fromPosition(TextPosition(offset: value.length)),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
    );
  }
import 'package:flutter/material.dart';
import 'package:mprofile/mprofile_module/models/booking.dart';

Widget bookingCard(BookingItem booking) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top Section: Route & Icon
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.trip_origin, size: 14, color: Color(0xFF94A3B8)),
                        const SizedBox(width: 8),
                        Text(
                          booking.origin,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Container(
                        height: 16,
                        width: 2,
                        color: const Color(0xFFCBD5E1),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF94A3B8)),
                        const SizedBox(width: 8),
                        Text(
                          booking.destination,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined, size: 14, color: Color(0xFF94A3B8)),
                        const SizedBox(width: 6),
                        Text(
                          booking.dateTime,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2FE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.directions_bus, color: Color(0xFF0EA5E9), size: 26),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          // Bottom Section: Operator Name & Logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.local_shipping, size: 14, color: Colors.red),
                ),
                const SizedBox(width: 10),
                Text(
                  booking.operatorName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
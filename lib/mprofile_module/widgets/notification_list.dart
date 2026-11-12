import 'package:flutter/material.dart';
import 'package:mprofile/mprofile_module/models/notification.dart';

Widget notificationsList(List<NotificationItem> notifications) {
    return ListView.separated(
      itemCount: notifications.length,
      separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFE2E8F0)),
      itemBuilder: (context, index) {
        final item = notifications[index];
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Megaphone Icon Badge
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F2FE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.campaign,
                  color: Color(0xFF0EA5E9),
                  size: 20,
                ),
              ),
              const SizedBox(width: 14),
              // Notification Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.timeAgo,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF94A3B8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
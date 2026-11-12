import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/notifier/notification_notifier.dart';
import 'package:mprofile/mprofile_module/widgets/notification_list.dart';
import 'package:mprofile/mprofile_module/widgets/support.dart';
import 'package:mprofile/mprofile_module/widgets/tab_item.dart';

class InboxScreen extends ConsumerWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(inboxProvider);
    final notifier = ref.read(inboxProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Inbox',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Tab Bar Header
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: tabItem(
                    title: 'Notifications',
                    isSelected: state.selectedTab == 0,
                    onTap: () => notifier.setTab(0),
                  ),
                ),
                Expanded(
                  child: tabItem(
                    title: 'Support',
                    isSelected: state.selectedTab == 1,
                    onTap: () => notifier.setTab(1),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFE2E8F0)),

          // Tab Body Content
          Expanded(
            child: state.selectedTab == 0
                ? notificationsList(state.notifications)
                : supportView(),
          ),
        ],
      ),
    );
  }
}
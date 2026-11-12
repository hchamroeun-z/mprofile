import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/models/notification.dart';

class InboxState {
  final int selectedTab; // 0 = Notifications, 1 = Support
  final List<NotificationItem> notifications;

  const InboxState({
    this.selectedTab = 0,
    required this.notifications,
  });

  InboxState copyWith({
    int? selectedTab,
    List<NotificationItem>? notifications,
  }) {
    return InboxState(
      selectedTab: selectedTab ?? this.selectedTab,
      notifications: notifications ?? this.notifications,
    );
  }
}

class InboxNotifier extends Notifier<InboxState> {
  @override
  InboxState build() {
    return InboxState(
      selectedTab: 0,
      notifications: [
        const NotificationItem(
          title: '🇻🇳 Vietnam Calling! តោះ!ទៅលេងវៀតណាម!',
          subtitle: 'កក់សំបុត្រទៅ-មកជាមួយ EVGo Express ដោយប្រើកូដ RE...',
          timeAgo: '19 days ago',
        ),
        const NotificationItem(
          title: 'ទៅស្រុក កក់ទាំងទៅ ទាំងមក ចំណេញ!🚌',
          subtitle: 'ឆ្នាំថ្មីនេះ កក់ Round Trip ចំណេញរហូតដល់ 40% ប្រើកូដ ...',
          timeAgo: 'about a month ago',
        ),
        const NotificationItem(
          title: '🚌 តោះ! ទៅស្រុកឈប់សម្រាក ឆ្នាំថ្មីនេះ!',
          subtitle: 'កក់សំបុត្រទៅ-មកជាមួយ BookMeBus សន្សំបានរហូតដល់ 4...',
          timeAgo: 'about a month ago',
        ),
        const NotificationItem(
          title: 'កាន់តែពិសេស លើសពីពិសេស! 🤩 ភ្នំពេញ ទៅ ហូជីមីញ ត្រឹមតែ 15\$🔥',
          subtitle: 'ធ្វើដំណើរពី ភ្នំពេញ ទៅ ហូជីមីញ ជាមួយ EVGo Express គឺ...',
          timeAgo: 'about a month ago',
        ),
        const NotificationItem(
          title: 'តស់! \$5 ទៅសៀមរាប មើលថ្ងៃរះកំពូលអង្គរវត្ត! 🌅✨',
          subtitle: 'ខែក្រោយមានព្រឹត្តិការណ៍ «សមរត្រី (Equinox) » នៅអង្គរវត្ត!',
          timeAgo: '2 months ago',
        ),
      ],
    );
  }

  void setTab(int index) {
    state = state.copyWith(selectedTab: index);
  }
}

final inboxProvider = NotifierProvider<InboxNotifier, InboxState>(
  InboxNotifier.new,
);
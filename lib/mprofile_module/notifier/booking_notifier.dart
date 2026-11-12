import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mprofile/mprofile_module/models/booking.dart";

class BookingsState {
  final int selectedTab; // 0 = Upcoming, 1 = Past bookings
  final List<BookingItem> bookings;

  const BookingsState({
    this.selectedTab = 1, // Defaulting to Past bookings based on screenshot
    required this.bookings,
  });

  BookingsState copyWith({int? selectedTab, List<BookingItem>? bookings}) {
    return BookingsState(
      selectedTab: selectedTab ?? this.selectedTab,
      bookings: bookings ?? this.bookings,
    );
  }
}

class BookingsNotifier extends Notifier<BookingsState> {
  @override
  BookingsState build() {
    return BookingsState(
      selectedTab: 1,
      bookings: [
        const BookingItem(
          origin: 'Phnom Penh',
          destination: 'Kampot',
          dateTime: 'Dec 29, 2024 | 06:30 am',
          operatorName: 'Ekareach Express',
          isUpcoming: false,
        ),
        const BookingItem(
          origin: 'Phnom Penh',
          destination: 'Kampot',
          dateTime: 'Aug 10, 2024 | 06:30 am',
          operatorName: 'Ekareach Express',
          isUpcoming: false,
        ),
      ],
    );
  }

  void setTab(int index) {
    state = state.copyWith(selectedTab: index);
  }
}

final bookingsProvider =
    NotifierProvider<BookingsNotifier, BookingsState>(BookingsNotifier.new);
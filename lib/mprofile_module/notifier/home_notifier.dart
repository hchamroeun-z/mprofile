import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TransportType { train, bus, ferry, privateTaxi }

class HomeNavigationState {
  final int bottomNavIndex;
  final TransportType selectedTransport;

  const HomeNavigationState({
    this.bottomNavIndex = 0,
    this.selectedTransport = TransportType.train,
  });

  HomeNavigationState copyWith({
    int? bottomNavIndex,
    TransportType? selectedTransport,
  }) {
    return HomeNavigationState(
      bottomNavIndex: bottomNavIndex ?? this.bottomNavIndex,
      selectedTransport: selectedTransport ?? this.selectedTransport,
    );
  }
}

class HomeNotifier extends Notifier<HomeNavigationState> {
  @override
  HomeNavigationState build() {
    return const HomeNavigationState();
  }

  void setBottomNavIndex(int index) {
    state = state.copyWith(bottomNavIndex: index);
  }

  void selectTransport(TransportType type) {
    state = state.copyWith(selectedTransport: type);
  }
}

final homeNotifierProvider =
    NotifierProvider<HomeNotifier, HomeNavigationState>(HomeNotifier.new);
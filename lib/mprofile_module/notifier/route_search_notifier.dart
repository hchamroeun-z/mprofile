import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/models/location.dart';

class RouteSearchState {
  final Location? origin;
  final Location? destination;
  final DateTime travelDate;
  final int passengerCount;
  final TransportType selectedTransport;

  RouteSearchState({
    this.origin,
    this.destination,
    required this.travelDate,
    this.passengerCount = 1,
    this.selectedTransport = TransportType.bus,
  });

  RouteSearchState copyWith({
    Location? origin,
    Location? destination,
    DateTime? travelDate,
    int? passengerCount,
    TransportType? selectedTransport,
  }) {
    return RouteSearchState(
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      travelDate: travelDate ?? this.travelDate,
      passengerCount: passengerCount ?? this.passengerCount,
      selectedTransport: selectedTransport ?? this.selectedTransport,
    );
  }
}

enum TransportType { bus, ferry, privateTaxi }

class RouteSearchNotifier extends Notifier<RouteSearchState> {
  @override
  RouteSearchState build() {
    return RouteSearchState(
      origin: const Location(id: '1', name: 'Phnom Penh', code: 'PNH'),
      destination: const Location(id: '2', name: 'Siem Reap', code: 'REP'),
      travelDate: DateTime.now().add(const Duration(days: 1)),
    );
  }

  void swapLocations() {
    final currentOrigin = state.origin;
    final currentDestination = state.destination;
    state = state.copyWith(
      origin: currentDestination,
      destination: currentOrigin,
    );
  }

  void updateTransport(TransportType type) {
    state = state.copyWith(selectedTransport: type);
  }

  void updateDate(DateTime date) {
    state = state.copyWith(travelDate: date);
  }
}

final routeSearchProvider =
    NotifierProvider<RouteSearchNotifier, RouteSearchState>(
  RouteSearchNotifier.new,
);
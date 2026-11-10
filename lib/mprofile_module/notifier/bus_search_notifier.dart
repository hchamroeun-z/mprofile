import 'package:flutter_riverpod/flutter_riverpod.dart';

class BusSearchState {
  final String origin;
  final String destination;
  final int passengers;
  final DateTime departureDate;
  final DateTime? returnDate;

  const BusSearchState({
    this.origin = '',
    this.destination = '',
    this.passengers = 1,
    required this.departureDate,
    this.returnDate,
  });

  BusSearchState copyWith({
    String? origin,
    String? destination,
    int? passengers,
    DateTime? departureDate,
    DateTime? returnDate,
  }) {
    return BusSearchState(
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      passengers: passengers ?? this.passengers,
      departureDate: departureDate ?? this.departureDate,
      returnDate: returnDate ?? this.returnDate,
    );
  }
}

class BusSearchNotifier extends Notifier<BusSearchState> {
  @override
  BusSearchState build() {
    return BusSearchState(
      departureDate: DateTime.now(),
    );
  }

  void setOrigin(String origin) => state = state.copyWith(origin: origin);
  void setDestination(String dest) => state = state.copyWith(destination: dest);
  
  void swapLocations() {
    final temp = state.origin;
    state = state.copyWith(origin: state.destination, destination: temp);
  }

  void setPassengers(int count) => state = state.copyWith(passengers: count);
  void setDepartureDate(DateTime date) => state = state.copyWith(departureDate: date);
  void setReturnDate(DateTime? date) => state = state.copyWith(returnDate: date);
}

final busSearchProvider = NotifierProvider<BusSearchNotifier, BusSearchState>(BusSearchNotifier.new);
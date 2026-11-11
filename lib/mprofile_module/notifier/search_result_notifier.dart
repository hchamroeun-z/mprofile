import 'package:flutter_riverpod/flutter_riverpod.dart';

class TripResult {
  final String operatorName;
  final String rating;
  final String departureTime;
  final String duration;
  final String vehicleType;
  final int seatsLeft;
  final String price;
  final String? originalPrice;
  final String? discountTag;
  final bool isFeatured;
  final bool isDirect;

  const TripResult({
    required this.operatorName,
    required this.rating,
    required this.departureTime,
    required this.duration,
    required this.vehicleType,
    required this.seatsLeft,
    required this.price,
    this.originalPrice,
    this.discountTag,
    this.isFeatured = false,
    this.isDirect = true,
  });
}

class SearchResultState {
  final int selectedDateIndex;
  final List<TripResult> trips;

  const SearchResultState({
    this.selectedDateIndex = 1,
    required this.trips,
  });

  SearchResultState copyWith({int? selectedDateIndex, List<TripResult>? trips}) {
    return SearchResultState(
      selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
      trips: trips ?? this.trips,
    );
  }
}

class SearchResultNotifier extends Notifier<SearchResultState> {
  @override
  SearchResultState build() {
    return SearchResultState(
      trips: [
        const TripResult(
          operatorName: 'Kim Seng Express',
          rating: '4.7',
          departureTime: '06:30 am',
          duration: '3h',
          vehicleType: 'VIP VAN',
          seatsLeft: 7,
          price: 'USD 6.50',
          originalPrice: '8.00',
          discountTag: 'SAVE 19%',
          isFeatured: true,
          isDirect: true,
        ),
        const TripResult(
          operatorName: 'E-Booking',
          rating: '4.5',
          departureTime: '06:30 am',
          duration: '3h',
          vehicleType: 'VIP VAN',
          seatsLeft: 7,
          price: 'USD 8.00',
          originalPrice: '',
          discountTag: '',
          isFeatured: true,
          isDirect: true,
        ),
        
        const TripResult(
          operatorName: 'Kim Seng Express',
          rating: '4.7',
          departureTime: '08:00 am',
          duration: '3h',
          vehicleType: 'VIP VAN',
          seatsLeft: 3,
          price: 'USD 6.50',
          originalPrice: '8.00',
          discountTag: 'SAVE 19%',
          isFeatured: false,
          isDirect: true,
        ),
      ],
    );
  }

  void selectDate(int index) {
    state = state.copyWith(selectedDateIndex: index);
  }
}

final searchResultProvider =
    NotifierProvider<SearchResultNotifier, SearchResultState>(
  SearchResultNotifier.new,
);
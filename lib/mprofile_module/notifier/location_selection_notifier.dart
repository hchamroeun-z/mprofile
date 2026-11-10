import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationItem {
  final String name;
  final String code;

  const LocationItem({required this.name, required this.code});
}

class LocationSelectionState {
  final String searchQuery;
  final List<LocationItem> allLocations;

  const LocationSelectionState({
    this.searchQuery = '',
    required this.allLocations,
  });

  List<LocationItem> get filteredLocations {
    if (searchQuery.isEmpty) {
      return allLocations;
    }
    return allLocations
        .where((loc) =>
            loc.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
            loc.code.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  LocationSelectionState copyWith({
    String? searchQuery,
    List<LocationItem>? allLocations,
  }) {
    return LocationSelectionState(
      searchQuery: searchQuery ?? this.searchQuery,
      allLocations: allLocations ?? this.allLocations,
    );
  }
}

class LocationSelectionNotifier extends Notifier<LocationSelectionState> {
  @override
  LocationSelectionState build() {
    return const LocationSelectionState(
      allLocations: [
        LocationItem(name: 'Phnom Penh', code: 'PNH'),
        LocationItem(name: 'Siem Reap', code: 'SR'),
        LocationItem(name: 'Sihanoukville', code: 'SHV'),
        LocationItem(name: 'Poi Pet', code: 'PPT'),
        LocationItem(name: 'Kampot', code: 'KP'),
        LocationItem(name: 'Battambang', code: 'BTB'),
        LocationItem(name: 'Kep', code: 'KEP'),
      ],
    );
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }
}

final locationSelectionProvider =
    NotifierProvider<LocationSelectionNotifier, LocationSelectionState>(
  LocationSelectionNotifier.new,
);
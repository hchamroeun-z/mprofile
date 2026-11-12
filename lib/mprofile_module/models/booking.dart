class BookingItem {
  final String origin;
  final String destination;
  final String dateTime;
  final String operatorName;
  final bool isUpcoming;

  const BookingItem({
    required this.origin,
    required this.destination,
    required this.dateTime,
    required this.operatorName,
    required this.isUpcoming,
  });
}
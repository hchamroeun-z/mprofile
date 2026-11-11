// lib/features/booking/data/models/special_offer_model.dart
class SpecialOfferItem {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String discountCode;

  const SpecialOfferItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.discountCode,
  });
}
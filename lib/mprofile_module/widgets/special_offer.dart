import 'package:flutter/material.dart';
import '../models/special_offer.dart';

Widget specialOffersCarousel() {
    final offers = [
      const SpecialOfferItem(
        title: '20% OFF Phnom Penh Routes',
        subtitle: 'Use code: PNH20 at checkout',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ-iYZfL1g-DRDp9VHlWFvX12PcP34Ow9ALeCQ0FRW4w&s',
        discountCode: '20% OFF',
      ),
      const SpecialOfferItem(
        title: 'Free VIP Lounge Access',
        subtitle: 'Book any van to Siem Reap',
        imageUrl: 'https://cdn.bookmebus.com/uploads/home_page_slide_show_ad/image/309/standard_IMG_20261013_155547_756.jpg',
        discountCode: 'FREE VIP',
      ),
      const SpecialOfferItem(
        title: 'Weekend Getaway Deal',
        subtitle: 'Save big on round-trip tickets',
        imageUrl: 'https://assets.bookmebus.com/assets/slides/bookmebus-app-promotion-738426df0204d4cc596e6b2980f5e3b1.png',
        discountCode: 'SAVE \$5',
      ),
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return Container(
            width: 280,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(offer.imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.35),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      offer.discountCode,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        offer.subtitle,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mprofile/mprofile_module/notifier/home_notifier.dart';
import 'package:mprofile/mprofile_module/widgets/header_background.dart';
import 'package:mprofile/mprofile_module/widgets/nead_help.dart';
import 'package:mprofile/mprofile_module/widgets/popular_destination.dart';
import 'package:mprofile/mprofile_module/widgets/promo_banner.dart';
import 'package:mprofile/mprofile_module/widgets/special_offer.dart';
import 'package:mprofile/mprofile_module/widgets/testimonial.dart';
import 'package:mprofile/mprofile_module/widgets/transpot_grid.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: _buildBody(),
    );
  }
  Widget _buildBody(){
    final homeState = ref.watch(homeNotifierProvider);
    final theme = Theme.of(context);
    return CustomScrollView(
        slivers: [
          // Top Illustrated Header & Floating Transport Grid
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                headerBackground(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 210, 16, 0),
                  child: Column(
                    children: [
                      transpotGrid(context, ref, homeState.selectedTransport),
                      const SizedBox(height: 16),
                      promoBanner(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Content Sections
          // Special Offers Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Special offers',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  specialOffersCarousel(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular destinations',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  popularDestinationsList(),
                ],
              ),
            ),
          ),
          // Need Help? Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Need Help?',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  needHelpCard(context),
                ],
              ),
            ),
          ),
          // Why Traveler Trust Us? Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why Traveler Trust Us ?',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  testimonialCard(),
                ],
              ),
            ),
          ),
        ],
      );
  }
}
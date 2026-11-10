import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/notifier/bus_search_notifier.dart';
import 'package:mprofile/mprofile_module/widgets/back_header.dart';
import 'package:mprofile/mprofile_module/widgets/popular_destination.dart';
import 'package:mprofile/mprofile_module/widgets/search_card.dart';

class BusSearch extends ConsumerWidget {
  const BusSearch({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(busSearchProvider);
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          // Scenic Background Header & Search Floating Card
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                backHeader(context),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 150, 16, 0),
                  child: Column(
                    children: [
                      searchCard(context, ref, searchState),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 36),
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
        ]
      )
    );
  }
}
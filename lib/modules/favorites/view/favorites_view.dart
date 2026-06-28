import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/laptops_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/extensions/l10n_extensions.dart';

import '../../../components/no_data.dart';
import 'widget/favourite_item.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourite = ref.watch(favouriteLaptopsProvider);
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  context.l10n.favorites,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              const SizedBox(height: 16),
              favourite.isEmpty
                  ? NoData(
                      text: context.l10n.noFavorites,
                      image: 'assets/images/favourite_item.svg')
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: ListView.builder(
                          itemCount: favourite.length,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            return FavouriteItem(
                              laptop: favourite[index],
                            );
                          }),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

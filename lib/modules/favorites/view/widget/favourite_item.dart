import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/laptops_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/model/laptop.dart';
import '../../../../routes/app_routes.dart';

class FavouriteItem extends ConsumerWidget {
  const FavouriteItem({super.key, required this.laptop});

  final Laptop laptop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 0,
                top: 0,
                left: 8,
                child: InkWell(
                  onTap: () {
                    context.push(Routes.detailPath(laptop.id));
                  },
                  child: Image.asset(
                    laptop.image,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  laptop.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '\$${laptop.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Positioned(
            right: 16,
            top: 16,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  ref.read(laptopsProvider.notifier).toggleFavourite(laptop.id);
                },
                child: laptop.isFavourite
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.grey,
                      ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

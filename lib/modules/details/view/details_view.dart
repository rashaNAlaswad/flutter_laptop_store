import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/laptops_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/extensions/l10n_extensions.dart';
import 'package:go_router/go_router.dart';

import '../../../components/custome_btn.dart';

class DetailsView extends ConsumerWidget {
  const DetailsView({super.key, required this.laptopId});

  final int laptopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final laptop = ref.watch(laptopByIdProvider(laptopId));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  top: 40,
                  left: 8,
                  child: Image.asset(
                    laptop.image,
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(laptopsProvider.notifier)
                          .toggleFavourite(laptop.id);
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
                Positioned(
                    left: 16,
                    top: 16,
                    child: BackButton(
                      onPressed: () {
                        context.pop();
                      },
                    )),
              ]),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  laptop.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      '${laptop.price} \$',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    const Icon(Icons.star_rounded, color: Colors.amber),
                    Text(laptop.rating.toString(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  label: context.l10n.addToCart,
                  onPressed: () {
                    ref.read(laptopsProvider.notifier).addToCart(laptop.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${laptop.name} ${context.l10n.successSnackbarMessage}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.black87,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

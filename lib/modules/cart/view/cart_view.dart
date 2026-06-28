import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/l10n_extensions.dart';
import 'package:flutter_application_1/providers/laptops_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'widget/cart_item.dart';
import '../../../components/custome_btn.dart';
import '../../../components/no_data.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartLaptopsProvider);
    final totalPrice = ref.watch(totalPriceProvider);
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                context.l10n.cart,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: ListView.builder(
                  itemCount: carts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartItem(
                      laptop: carts[index],
                    );
                  }),
            ),
            carts.isEmpty
                ? NoData(
                    text: context.l10n.emptyCart,
                    image: 'assets/images/empty_cart.svg')
                : Column(
                    children: [
                      Text(context.l10n.total,
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 8),
                      Text(
                        '\$ ${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: CustomButton(
                            label: context.l10n.checkout,
                            onPressed: () {
                              Get.snackbar(
                                context.l10n.faildSnackbarTitle,
                                context.l10n.faildSnackbarMessage,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackStyle: SnackStyle.FLOATING,
                                snackPosition: SnackPosition.TOP,
                              );
                            }),
                      )
                    ],
                  ),
          ],
        ),
      ],
    )));
  }
}

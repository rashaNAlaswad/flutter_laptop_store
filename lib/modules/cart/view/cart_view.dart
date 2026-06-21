import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/laptops_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
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
                Strings.cart.tr,
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
                    text: Strings.emptyCart.tr,
                    image: 'assets/images/empty_cart.svg')
                : Column(
                    children: [
                      Text(Strings.total.tr,
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
                            label: Strings.checkout.tr,
                            onPressed: () {
                              Get.snackbar(
                                Strings.faildSnackbarTitle.tr,
                                Strings.faildSnackbarMessage.tr,
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

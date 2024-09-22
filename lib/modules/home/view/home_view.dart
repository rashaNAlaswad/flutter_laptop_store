import 'package:flutter/material.dart';
import '../../../config/translations/strings_enum.dart';
import 'package:get/get.dart';

import 'widget/laptop_item.dart';
import '../controllers/home_controller.dart';
import 'widget/banner_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  Strings.home.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              const SizedBox(height: 16),
              BannerSection(controller: controller),
              const SizedBox(height: 12),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Text(
                  Strings.newLaptops.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 250,
                    ),
                    itemCount: controller.laptops.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return LaptopItemWidget(
                        laptop: controller.laptops[index],
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


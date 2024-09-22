import '../../../utils/dummy_data.dart';
import 'package:get/get.dart';

import '../../../data/model/laptop.dart';
import '../../favorites/controllers/favorite_controller.dart';

class HomeController extends GetxController {
  List<String> banners = [];
  List<Laptop> laptops = [];

  @override
  void onInit() {
    getBanners();
    getLaptops();
    super.onInit();
  }

  getBanners() {
    banners = DummyData.banners;
    update();
  }

  getLaptops() {
    laptops = DummyData.laptops;
    update();
  }

  setFavorite(int laptopId) {
    var item = laptops.firstWhere((laptop) => laptop.id == laptopId);
    if (item.isFavourite) {
      item.isFavourite = false;
      Get.find<FavoriteController>().getfavoriteLaptops();
    } else {
      item.isFavourite = true;
      Get.find<FavoriteController>().getfavoriteLaptops();
    }
    update(['favorite']);
  }
}

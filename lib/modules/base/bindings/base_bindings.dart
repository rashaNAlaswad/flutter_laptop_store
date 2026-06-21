import 'package:get/get.dart';

import '../../settings/controller/settings_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}

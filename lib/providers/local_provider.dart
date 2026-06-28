import 'dart:ui';
import 'package:get/get.dart';

import 'package:flutter_application_1/data/local/app_shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalNotifier extends Notifier<Locale> {
  @override
  Locale build() => Locale(AppSharedPreference.getLocal());

  Future<void> updateLanguage(String languageCode) async {
    await AppSharedPreference.setLocal(languageCode);
    final locale = Locale(languageCode);
    state = locale;

    // TODO: remove after migrating GetxMaterialApp to MaterialApp
    Get.updateLocale(locale);
  }
}

final localProvider =
    NotifierProvider<LocalNotifier, Locale>(() => LocalNotifier());

import 'package:flutter/material.dart';
import 'config/translations/localization_service.dart';
import 'package:get/get.dart';

import 'data/local/app_shared_pref.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreference.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laptop Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      translations: LocalizationService.getInstance(),
      locale: LocalizationService.getCurrentLocal(),
    );
  }
}

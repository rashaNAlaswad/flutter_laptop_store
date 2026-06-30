import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/local_provider.dart';
import 'package:flutter_application_1/routes/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/local/app_shared_pref.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreference.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Laptop Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

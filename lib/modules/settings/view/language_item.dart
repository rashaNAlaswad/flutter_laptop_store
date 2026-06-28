import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/local_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageItem extends ConsumerWidget {
  const LanguageItem({
    super.key,
    required this.title,
    required this.languageCode,
  });
  final String title;
  final String languageCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(localProvider);

    return ListTile(
      title: Text(title),
      trailing: (selectedLanguage.languageCode == languageCode)
          ? const Icon(Icons.check)
          : const SizedBox(),
      onTap: () {
        ref.read(localProvider.notifier).updateLanguage(languageCode);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/l10n_extensions.dart';

import 'language_item.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              context.l10n.settings,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              context.l10n.language,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          LanguageItem(title: context.l10n.english, languageCode: 'en'),
          const Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
            height: 0,
          ),
          LanguageItem(title: context.l10n.arabic, languageCode: 'ar'),
        ],
      ),
    );
  }
}

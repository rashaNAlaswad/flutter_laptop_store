import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_application_1/extensions/l10n_extensions.dart';
import 'package:go_router/go_router.dart';
import '../../../../components/custome_btn.dart';
import '../../../../data/local/app_shared_pref.dart';
import '../../../../routes/app_routes.dart';
import '../model/on_boarding_item.dart';

class OnBoaringWidget extends StatelessWidget {
  const OnBoaringWidget(
      {Key? key, required this.item, required this.showGetStartedButton})
      : super(key: key);

  final OnBoardingItem item;
  final bool showGetStartedButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          item.image,
          height: 300,
        ),
        const SizedBox(height: 24),
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            item.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        showGetStartedButton
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  onPressed: () async {
                    await AppSharedPreference.setOnBoardingState(true);
                    if (context.mounted) context.go(Routes.home);
                  },
                  label: context.l10n.start,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/onboarding/view/model/on_boarding_item.dart';
import 'package:flutter_application_1/utils/dummy_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter_application_1/extensions/l10n_extensions.dart';
import 'widget/custome_boarding_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int pageIndex = 0;

  List<OnBoardingItem> onBoardingList = DummyData.onBoarding;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final bool isLastPage = pageIndex == onBoardingList.length - 1;

    return Scaffold(
        body: PageView.builder(
          controller: pageController,
          onPageChanged: (int index) {
            setState(() {
              pageIndex = index;
            });
          },
          itemCount: onBoardingList.length,
          itemBuilder: (context, index) {
            return OnBoaringWidget(
              item: onBoardingList[index],
              showGetStartedButton: index == onBoardingList.length - 1,
            );
          },
        ),
        bottomSheet: Container(
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              !isLastPage
                  ? TextButton(
                      onPressed: () =>
                          pageController.jumpToPage(onBoardingList.length - 1),
                      child: Text(
                        context.l10n.skip,
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  : const SizedBox(),
              SmoothPageIndicator(
                controller: pageController,
                count: onBoardingList.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.black,
                ),
              ),
              !isLastPage
                  ? TextButton(
                      onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                      child: Text(
                        context.l10n.next,
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ));
  }
}

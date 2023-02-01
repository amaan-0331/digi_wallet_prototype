// ignore_for_file: lines_longer_than_80_chars

import 'package:digi_wallet_prototype/src/shared/components/hero_logo.dart';
import 'package:digi_wallet_prototype/src/shared/components/main_button.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:digi_wallet_prototype/src/signin_view/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  static const routeName = '/onboarding';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding_background.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: SafeArea(
          child: PageView.builder(
            controller: controller,
            itemCount: 3,
            onPageChanged: (value) => setState(() {
              currentPageIndex = value;
            }),
            itemBuilder: (context, index) {
              return ContentScreen(
                controller: controller,
                currentPageIndex: index,
              );
            },
          ),
        ),
      ),
      bottomSheet: Container(
        height: 150,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //indicator
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                expansionFactor: 2,
                activeDotColor: AppColors.orange,
              ),
              onDotClicked: (index) {
                controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),

            //button
            MainButton(
              buttonWidget: Text(
                'Get Started',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: AppColors.white),
              ),
              buttonFunction: () => Navigator.push(
                context,
                MaterialPageRoute<SignInView>(
                  builder: (context) => const SignInView(),
                ),
              ),
              size: Size(size.width / 2.5, 66),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentScreen extends StatelessWidget {
  const ContentScreen({
    super.key,
    required this.controller,
    required this.currentPageIndex,
  });

  final PageController controller;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //skip button
          Align(
            alignment: Alignment.centerRight,
            child: (currentPageIndex != 2)
                ? TextButton(
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    onPressed: () => controller.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  )
                : const SizedBox(),
          ),

          // app logo
          const AppLogo(direction: Axis.vertical),

          //description
          Column(
            children: [
              Text(
                'Investing for everybody',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              Text(
                r'We let you easily invest in fractional shares for as little as $1',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

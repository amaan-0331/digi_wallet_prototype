import 'package:digi_wallet_prototype/src/auth/views/setup_face_view.dart';
import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/components/main_button.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class VerificationSuccessView extends StatelessWidget {
  const VerificationSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentTheme = Provider.of<SettingsController>(context).themeMode;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              //image
              SvgPicture.asset(
                'assets/illustrations/verification_background.svg',
                width: size.width,
              ),
              const SizedBox(height: 20),

              //description
              Column(
                children: [
                  Text(
                    'Hello Militao!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: currentTheme == ThemeMode.dark
                              ? AppColors.white
                              : AppColors.black900,
                        ),
                  ),
                  Text(
                    'Welcome to DigiWallet',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: currentTheme == ThemeMode.dark
                              ? AppColors.white
                              : AppColors.black900,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'It’s great to have you here',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: currentTheme == ThemeMode.dark
                              ? AppColors.lightGrey
                              : AppColors.darkGrey,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              //button
              MainButton(
                buttonWidget: Text(
                  'Submit',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: AppColors.white),
                ),
                buttonFunction: () => Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(
                    builder: (context) => const SetupFaceView(),
                  ),
                ),
                size: Size(size.width, 66),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

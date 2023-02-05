// ignore_for_file: lines_longer_than_80_chars

import 'package:digi_wallet_prototype/src/auth/views/verification_success_view.dart';
import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/components/form_field.dart';
import 'package:digi_wallet_prototype/src/shared/components/hero_logo.dart';
import 'package:digi_wallet_prototype/src/shared/components/main_button.dart';
import 'package:digi_wallet_prototype/src/shared/components/secondary_button.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentTheme = Provider.of<SettingsController>(context).themeMode;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 24)
              .copyWith(top: 12),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              //app logo
              const AppLogo(direction: Axis.horizontal),
              const SizedBox(height: 24),

              //description
              Column(
                children: [
                  Text(
                    'Signin',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: currentTheme == ThemeMode.dark
                              ? AppColors.white
                              : AppColors.black900,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Fill all information to continue our app and enjoy our services',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // social buttons
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      buttonWidget: SvgPicture.asset('assets/icons/google.svg'),
                      buttonFunction: () {},
                      height: 66,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: SecondaryButton(
                      buttonWidget: SvgPicture.asset(
                        'assets/icons/apple.svg',
                        color: currentTheme == ThemeMode.dark
                            ? AppColors.white
                            : null,
                      ),
                      buttonFunction: () {},
                      height: 66,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              //divider
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      endIndent: 15,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  Text(
                    'Or Continue with',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Expanded(
                    child: Divider(
                      indent: 15,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              //email form field
              const FormTextInput(
                labelText: 'Email',
                iconLocation: 'assets/icons/mail.svg',
                hintText: 'enter email address',
              ),
              const SizedBox(height: 24),

              //password form field
              FormTextInput(
                labelText: 'Password',
                iconLocation: 'assets/icons/lock.svg',
                hintText: 'enter password',
                trailing: Text(
                  'forgot password',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: currentTheme == ThemeMode.light
                            ? AppColors.darkGrey
                            : AppColors.flashWhite,
                      ),
                ),
              ),
              const SizedBox(height: 24),

              //button
              MainButton(
                buttonWidget: Text(
                  'Sign In',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: AppColors.white),
                ),
                buttonFunction: () => Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(
                    builder: (context) => const VerificationSuccessView(),
                  ),
                ),
                size: Size(size.width, 66),
              ),
              const Expanded(child: SizedBox()),

              //signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Signup',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.orange),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

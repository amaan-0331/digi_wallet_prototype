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

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentTheme = Provider.of<SettingsController>(context).themeMode;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 12),
          height: size.height,
          width: size.width,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                //app logo
                const AppLogo(direction: Axis.horizontal),
                SizedBox(height: size.height * 0.03),

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
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),

                // social buttons
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        buttonWidget:
                            SvgPicture.asset('assets/icons/google.svg'),
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
                SizedBox(height: size.height * 0.015),

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
                      'Or continue with',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 16),
                    ),
                    const Expanded(
                      child: Divider(
                        indent: 15,
                        color: AppColors.lightGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),

                //email form field
                FormTextInput(
                  labelText: 'Email',
                  iconLocation: 'assets/icons/mail.svg',
                  hintText: 'enter email address',
                  validatorFunc: (value) {
                    final isEmailValid =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value!);
                    if (!isEmailValid) {
                      return 'Email Address Invalid';
                    } else {
                      return null;
                    }
                  },
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: size.height * 0.015),

                //password form field
                FormTextInput(
                  labelText: 'Password',
                  iconLocation: 'assets/icons/lock.svg',
                  hintText: 'enter password',
                  trailing: Text(
                    'forgot password',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 14,
                          color: currentTheme == ThemeMode.light
                              ? AppColors.darkGrey
                              : AppColors.flashWhite,
                        ),
                  ),
                  validatorFunc: (value) {
                    final isPasswordValid = (value?.length ?? 0) >= 8;
                    if (!isPasswordValid) {
                      return 'Passsword not Valid';
                    } else {
                      return null;
                    }
                  },
                  inputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: size.height * 0.015),

                //button
                MainButton(
                  buttonWidget: Text(
                    'Sign In',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: AppColors.white),
                  ),
                  buttonFunction: () {
                    if (formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (context) => const VerificationSuccessView(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fill all fields properly'),
                        ),
                      );
                    }
                  },
                  size: Size(size.width, 66),
                ),
                Expanded(child: SizedBox(height: size.height * 0.015)),

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
                SizedBox(height: size.height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

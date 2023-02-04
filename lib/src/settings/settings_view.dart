import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/components/app_bar.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //general
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'General',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(color: AppColors.flashWhite),
          ),
          buildSettingsTile(
            context,
            'Dark Mode',
            Switch(
              value: controller.themeMode == ThemeMode.dark,
              activeColor: AppColors.blueGrey,
              inactiveThumbColor: AppColors.white,
              inactiveTrackColor: AppColors.blueGrey,
              thumbColor: MaterialStateProperty.resolveWith<Color?>(
                (states) => Colors.white,
              ),
              onChanged: (bool value) {
                if (value) {
                  controller.updateThemeMode(ThemeMode.dark);
                } else {
                  controller.updateThemeMode(ThemeMode.light);
                }
              },
            ),
          ),
          buildSettingsTile(
            context,
            'Notifications',
          ),
          buildSettingsTile(
            context,
            'Reset Password',
          ),

          //abour digi
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'About Digiwallet',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(color: AppColors.flashWhite),
          ),
          buildSettingsTile(
            context,
            'Disclosure',
          ),
          buildSettingsTile(
            context,
            'Privacy and Policy',
          ),
          buildSettingsTile(
            context,
            'Feedback',
          ),
          ListTile(
            title: Text(
              'Log Out',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.orange),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          ),
        ],
      ),
    );
  }

  Widget buildSettingsTile(
    BuildContext context,
    String title, [
    Widget? trailing,
  ]) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: AppColors.blackGrey),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios_rounded),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    );
  }
}

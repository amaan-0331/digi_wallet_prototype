import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.direction,
  });

  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<SettingsController>(context).themeMode;
    return Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: 'app-logo-image',
          child: Image.asset(
            'assets/images/app_logo.png',
            height: (direction == Axis.vertical) ? null : 25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Hero(
            tag: 'app-logo-text',
            child: Text(
              'Digi-Wallet',
              style: (direction == Axis.vertical)
                  ? Theme.of(context).textTheme.titleLarge
                  : Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: currentTheme == ThemeMode.light
                            ? AppColors.blackGrey
                            : AppColors.flashWhite,
                      ),
            ),
          ),
        ),
      ],
    );
  }
}

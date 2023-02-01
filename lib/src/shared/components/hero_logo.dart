import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.direction,
  });

  final Axis direction;

  @override
  Widget build(BuildContext context) {
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
                  : Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.blackLogo),
            ),
          ),
        ),
      ],
    );
  }
}

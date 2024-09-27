import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.buttonWidget,
    required this.buttonFunction,
    required this.height,
  });

  final Widget buttonWidget;
  final void Function()? buttonFunction;
  final double height;

  @override
  Widget build(BuildContext context) {
    final outlineButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: AppColors.navy,
      minimumSize: Size.fromHeight(height),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ).copyWith(
      side: WidgetStateProperty.resolveWith<BorderSide?>(
        (Set<WidgetState> states) {
          return const BorderSide(
            color: AppColors.lightGrey,
          );
        },
      ),
    );

    return OutlinedButton(
      style: outlineButtonStyle,
      onPressed: buttonFunction,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: buttonWidget,
      ),
    );
  }
}

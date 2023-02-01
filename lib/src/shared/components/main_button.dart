import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.buttonWidget,
    required this.buttonFunction,
    required this.size,
    this.buttonColor,
  });

  final Widget buttonWidget;
  final void Function()? buttonFunction;
  final Color? buttonColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.orange,
      minimumSize: size,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );

    return ElevatedButton(
      onPressed: buttonFunction,
      style: buttonStyle,
      child: buttonWidget,
    );
  }
}

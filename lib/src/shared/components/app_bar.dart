import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
  });
  final Widget? title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Overide the default Back button
      automaticallyImplyLeading: false,
      leadingWidth: 120,
      leading: ElevatedButton.icon(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.keyboard_arrow_left_rounded,
          size: 40,
          color: AppColors.black900,
        ),
        label: Text(
          'Back',
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: AppColors.darkGrey),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      centerTitle: true,
      title: title,
    );
  }
}

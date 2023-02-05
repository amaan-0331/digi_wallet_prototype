import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
  });
  final Widget? title;
  final List<Widget>? actions;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<SettingsController>(context).themeMode;
    return AppBar(
      // Overide the default Back button
      automaticallyImplyLeading: false,
      leadingWidth: 120,
      leading: ElevatedButton.icon(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.keyboard_arrow_left_rounded,
          size: 40,
          color: currentTheme == ThemeMode.dark
              ? AppColors.white
              : AppColors.black900,
        ),
        label: Text(
          'Back',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: currentTheme == ThemeMode.dark
                    ? AppColors.lightGrey
                    : AppColors.darkGrey,
              ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      centerTitle: true,
      title: title,
      actions: [...?actions],
    );
  }
}

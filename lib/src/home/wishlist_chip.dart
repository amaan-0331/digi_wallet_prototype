import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListChip extends StatelessWidget {
  const WishListChip({
    super.key,
    required this.child,
    required this.title,
    required this.subTitle,
  });
  final Widget child;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentTheme = Provider.of<SettingsController>(context).themeMode;
    return Container(
      width: width / 2.75,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          //logo
          Container(
            //parent container size minus both paddings
            height: 60 - 8 - 8,
            width: 60 - 8 - 8,
            decoration: BoxDecoration(
              color: const Color(0xFFEDF2F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: child,
            ),
          ),
          const SizedBox(width: 7),

          //info
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // price
              Text(
                title,
                style: TextStyle(
                  fontSize: width * 0.035,
                  color: currentTheme == ThemeMode.dark
                      ? AppColors.white
                      : AppColors.blackGrey,
                ),
              ),

              //percentage
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: width * 0.035,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

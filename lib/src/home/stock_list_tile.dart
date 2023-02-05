import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StockListTile extends StatelessWidget {
  const StockListTile({
    super.key,
    required this.leading,
    required this.name,
    required this.price,
    required this.date,
    required this.percentage,
  });

  final Widget leading;
  final String name;
  final String price;
  final String date;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentTheme = Provider.of<SettingsController>(context).themeMode;
    return Container(
      decoration: BoxDecoration(
        color: currentTheme == ThemeMode.dark
            ? AppColors.blackCharcoal
            : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      width: width,
      height: 72,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: currentTheme == ThemeMode.dark
                  ? AppColors.lightGrey
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: leading,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // name / price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: currentTheme == ThemeMode.dark
                            ? AppColors.white
                            : AppColors.blackGrey,
                        fontSize: width * 0.038,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: width * 0.038,
                        color: currentTheme == ThemeMode.dark
                            ? AppColors.white
                            : AppColors.blackGrey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: width * 0.034,
                        color: currentTheme == ThemeMode.dark
                            ? AppColors.flashWhite
                            : AppColors.darkGrey,
                      ),
                    ),
                    Text(
                      percentage,
                      style: TextStyle(
                        fontSize: width * 0.034,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

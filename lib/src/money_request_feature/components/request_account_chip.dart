import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestAccountChip extends StatelessWidget {
  const RequestAccountChip({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image;
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
          SizedBox(
            //parent container size minus both paddings
            height: 60 - 8 - 8,
            width: 60 - 8 - 8,
            child: Image.asset(image),
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

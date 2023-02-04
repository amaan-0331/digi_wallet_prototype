import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      width: width,
      height: 72,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
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
                // price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: AppColors.blackGrey,
                        fontSize: width * 0.038,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: width * 0.038,
                        color: AppColors.blackGrey,
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
                        color: AppColors.darkGrey,
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

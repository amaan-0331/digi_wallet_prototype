import 'package:digi_wallet_prototype/src/shared/components/app_bar.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Notification',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/setting.svg',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //today title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //title
                  Text(
                    'Today',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          fontSize: 13,
                        ),
                  ),

                  // mark all button
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Mark as Read',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.orange),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            //ListTiles
            buildListTile(
              context,
              title: 'Cashback 50%',
              subTitle: 'Get the 50% cashback for the next top-up',
              leading: 'assets/icons/discount.svg',
            ),
            buildListTile(
              context,
              title: 'New extra deposit offer',
              subTitle: 'Only this weekend we have special offer for you...',
              leading: 'assets/icons/bookmark.svg',
            ),
            const SizedBox(height: 14),

            //yesterdat
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Yesterday',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      fontSize: 13,
                    ),
              ),
            ),
            const SizedBox(height: 14),

            //listtiles
            buildListTile(
              context,
              title: 'Salary income',
              subTitle: 'American multinational technology company',
              leading: 'assets/icons/dollar.svg',
            ),
            buildListTile(
              context,
              title: 'Change your card to new one',
              subTitle: 'Your card will be unsupported into few weeks...',
              leading: 'assets/icons/exchange.svg',
            ),
            buildListTile(
              context,
              title: 'Return',
              subTitle: 'Ferniture store',
              leading: 'assets/icons/arrow_down.svg',
            ),
            buildListTile(
              context,
              title: 'Lottery win',
              subTitle: 'Lottery NYC',
              leading: 'assets/icons/tick.svg',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(
    BuildContext context, {
    required String title,
    required String subTitle,
    required String leading,
  }) {
    return ListTile(
      leading: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.flashWhite),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(leading),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.blackGrey,
            ),
      ),
      subtitle: Text(
        subTitle,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.darkGrey,
              fontSize: 14,
            ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    );
  }
}

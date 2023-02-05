import 'package:digi_wallet_prototype/src/money_request_feature/components/money_counter.dart';
import 'package:digi_wallet_prototype/src/money_request_feature/components/oval_top_container.dart';
import 'package:digi_wallet_prototype/src/money_request_feature/components/request_account_chip.dart';
import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/components/app_bar.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MoneyRequestView extends StatelessWidget {
  const MoneyRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    var requestType = RequestType.send;
    final currentTheme = Provider.of<SettingsController>(context).themeMode;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Text(
          'Money Request',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Choose Amount',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: currentTheme == ThemeMode.dark
                          ? AppColors.white
                          : AppColors.blackCharcoal,
                    ),
              ),
            ),
            const SizedBox(height: 10),

            //counter
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: MoneyCounter(),
            ),
            const SizedBox(height: 24),

            //request title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //title
                  Text(
                    'Request account',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: currentTheme == ThemeMode.dark
                              ? AppColors.white
                              : AppColors.blackCharcoal,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                  ),

                  // view all button
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See All',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.orange,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            //request accounts
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: const [
                  RequestAccountChip(
                    title: 'Jennifer',
                    subTitle: 'Paypal',
                    image: 'assets/images/jennifer.png',
                  ),
                  SizedBox(width: 15),
                  RequestAccountChip(
                    title: 'Walker',
                    subTitle: 'Visa',
                    image: 'assets/images/walker.png',
                  ),
                  SizedBox(width: 15),
                  RequestAccountChip(
                    title: 'Sophia',
                    subTitle: 'Paypal',
                    image: 'assets/images/sophia.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            //type title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Type of Request',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: currentTheme == ThemeMode.dark
                          ? AppColors.white
                          : AppColors.blackCharcoal,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGrey),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: DropdownButton<RequestType>(
                  value: RequestType.send,
                  isExpanded: true,
                  icon: const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  ),
                  elevation: 16,
                  underline: const SizedBox(),
                  onChanged: (value) => requestType = value ?? requestType,
                  items: RequestType.values
                      .map<DropdownMenuItem<RequestType>>((value) {
                    return DropdownMenuItem<RequestType>(
                      value: value,
                      child: Text(
                        value.name,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: currentTheme == ThemeMode.dark
                                  ? AppColors.flashWhite
                                  : AppColors.blackCharcoal,
                            ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const Expanded(child: SizedBox()),

            // fingerprint
            OvalTopContainer(
              height: 150,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset('assets/icons/fingerprint.svg'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Press & Hold to Send request for money',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum RequestType { send, request }

extension CatExtension on RequestType {
  String get name {
    switch (this) {
      case RequestType.send:
        return 'Send money';
      case RequestType.request:
        return 'Reuqest money';
    }
  }
}

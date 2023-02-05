import 'package:digi_wallet_prototype/src/home/bottom_nav_bar.dart';
import 'package:digi_wallet_prototype/src/home/card_widget.dart';
import 'package:digi_wallet_prototype/src/home/stock_list_tile.dart';
import 'package:digi_wallet_prototype/src/home/wishlist_chip.dart';
import 'package:digi_wallet_prototype/src/money_request_feature/money_request_view.dart';
import 'package:digi_wallet_prototype/src/notifications/notifications_view.dart';
import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<SettingsController>(context).themeMode;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (context) => const MoneyRequestView(),
            ),
          ),
          shape: const CircleBorder(),
          child: SvgPicture.asset('assets/icons/scan.svg'),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // welcome appbar
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user_demo.png'),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  'Hello Bonna.',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                subtitle: Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (context) => const NotificationView(),
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/notification_active.svg',
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              const SizedBox(height: 15),

              //cards
              SizedBox(
                height: MediaQuery.of(context).size.width / 2,
                width: double.infinity,
                child: Center(
                  child: PageView.builder(
                    itemCount: 3,
                    controller: controller,
                    itemBuilder: (context, pagePosition) {
                      return const CardWidget();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              //indicators
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 2,
                  dotColor: currentTheme == ThemeMode.dark
                      ? AppColors.white
                      : AppColors.darkGrey,
                  activeDotColor: AppColors.orange,
                ),
                onDotClicked: (index) {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              const SizedBox(height: 14),

              //wishlist title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //title
                    Text(
                      'Wishlist',
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
              // wishlist
              SizedBox(
                height: 65,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    WishListChip(
                      title: r'$4,357.04',
                      subTitle: '+ 49,50%',
                      child: SvgPicture.asset(
                        'assets/icons/amazon.svg',
                      ),
                    ),
                    const SizedBox(width: 15),
                    WishListChip(
                      title: r'$4,357.04',
                      subTitle: '+ 49,50%',
                      child: SvgPicture.asset(
                        'assets/icons/google_stock.svg',
                      ),
                    ),
                    const SizedBox(width: 15),
                    WishListChip(
                      title: r'$4,357.04',
                      subTitle: '+ 49,50%',
                      child: SvgPicture.asset(
                        'assets/icons/tesla.svg',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              //stocks title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //title
                    Text(
                      'Stocks',
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
              //listtile
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  StockListTile(
                    leading: SvgPicture.asset(
                      'assets/icons/amazon.svg',
                    ),
                    name: 'Amazone',
                    price: r'$4357.04',
                    date: '12 January 2022',
                    percentage: '+49.50',
                  ),
                  const SizedBox(height: 10),
                  StockListTile(
                    leading: SvgPicture.asset(
                      'assets/icons/apple.svg',
                    ),
                    name: 'Apple',
                    price: r'$4357.04',
                    date: '12 January 2022',
                    percentage: '+49.50',
                  ),
                  const SizedBox(height: 10),
                  StockListTile(
                    leading: SvgPicture.asset(
                      'assets/icons/tesla.svg',
                    ),
                    name: 'Tesla',
                    price: r'$4357.04',
                    date: '12 January 2022',
                    percentage: '+49.50',
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

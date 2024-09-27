import 'package:digi_wallet_prototype/src/home/components/bottom_nav_bar.dart';
import 'package:digi_wallet_prototype/src/home/components/card_widget.dart';
import 'package:digi_wallet_prototype/src/home/components/stock_list_tile.dart';
import 'package:digi_wallet_prototype/src/home/components/wishlist_chip.dart';
import 'package:digi_wallet_prototype/src/home/models/stock_model.dart';
import 'package:digi_wallet_prototype/src/home/services/api_service.dart';
import 'package:digi_wallet_prototype/src/money_request_feature/money_request_view.dart';
import 'package:digi_wallet_prototype/src/notifications/notifications_view.dart';
import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController controller;
  late Future<List<StockItem>> futureStockItems;
  @override
  void initState() {
    controller = PageController();
    futureStockItems = StockApi().fetchStocks();
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
                        'assets/icons/amzn.svg',
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
                        'assets/icons/tsla.svg',
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
              FutureBuilder<List<StockItem>>(
                future: futureStockItems,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final stockItems = snapshot.data;
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: stockItems?.length ?? 0,
                      itemBuilder: (context, index) {
                        final stock = stockItems?[index];
                        return StockListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/${stock!.symbol.toLowerCase()}.svg',
                          ),
                          name: stock.symbol,
                          price: stock.high.toString(),
                          date: DateFormat('dd MMMM yyyy').format(stock.date),
                          percentage: generatePercentage(stock),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(24),
                          child: Row(
                            children: [
                              Icon(Icons.error_outline_rounded),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  // ignore: lines_longer_than_80_chars
                                  'Something went Wrong with Real time fetching, Following is dummy Demo Data',
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          children: [
                            StockListTile(
                              leading: SvgPicture.asset(
                                'assets/icons/amzn.svg',
                              ),
                              name: 'Amazone',
                              price: r'$4357.04',
                              date: '12 January 2022',
                              percentage: '+49.50',
                            ),
                            const SizedBox(height: 10),
                            StockListTile(
                              leading: SvgPicture.asset(
                                'assets/icons/aapl.svg',
                              ),
                              name: 'Apple',
                              price: r'$4357.04',
                              date: '12 January 2022',
                              percentage: '+49.50',
                            ),
                            const SizedBox(height: 10),
                            StockListTile(
                              leading: SvgPicture.asset(
                                'assets/icons/tsla.svg',
                              ),
                              name: 'Tesla',
                              price: r'$4357.04',
                              date: '12 January 2022',
                              percentage: '+49.50',
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              // ListView(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   padding: const EdgeInsets.symmetric(horizontal: 24),
              //   children: [
              //     StockListTile(
              //       leading: SvgPicture.asset(
              //         'assets/icons/amzn.svg',
              //       ),
              //       name: 'Amazone',
              //       price: r'$4357.04',
              //       date: '12 January 2022',
              //       percentage: '+49.50',
              //     ),
              //     const SizedBox(height: 10),
              //     StockListTile(
              //       leading: SvgPicture.asset(
              //         'assets/icons/aapl.svg',
              //       ),
              //       name: 'Apple',
              //       price: r'$4357.04',
              //       date: '12 January 2022',
              //       percentage: '+49.50',
              //     ),
              //     const SizedBox(height: 10),
              //     StockListTile(
              //       leading: SvgPicture.asset(
              //         'assets/icons/tsla.svg',
              //       ),
              //       name: 'Tesla',
              //       price: r'$4357.04',
              //       date: '12 January 2022',
              //       percentage: '+49.50',
              //     ),
              //   ],
              // ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  String generatePercentage(StockItem stock) {
    final value = (stock.high - stock.low) / stock.open;
    final sign = value > 0 ? '+' : '-';
    return '$sign ${value.toStringAsFixed(2)} %';
  }
}

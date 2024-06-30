import 'package:bitlux_app_1/core/constants/colors.dart';
import 'package:bitlux_app_1/features/convert_order/presentation/pages/convert_page.dart';
import 'package:bitlux_app_1/features/home/presentation/pages/home_page.dart';
import 'package:bitlux_app_1/features/markets/presentation/pages/market_page.dart';
import 'package:bitlux_app_1/features/new_order/presentation/widgets/new_order_floating_action_button.dart';
import 'package:bitlux_app_1/features/skeleton/bottum_navigation_model.dart';
import 'package:bitlux_app_1/features/skeleton/providers/bottum_bar_index_provider.dart';
import 'package:bitlux_app_1/features/skeleton/widgets/bitlux_bottum_nav_bar.dart';
import 'package:bitlux_app_1/features/wallet/presentation/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  final homeButtomNavigationKey = GlobalKey<NavigatorState>();
  final marketsButtomNavigationKey = GlobalKey<NavigatorState>();
  final tradesButtomNavigationKey = GlobalKey<NavigatorState>();
  final walletButtomNavigationKey = GlobalKey<NavigatorState>();

  List<BottumNavigationBarModel> pages = [];

  @override
  void initState() {
    super.initState();
    _initializeBottomNavigationPages();
    _fetchInitialData();
    _setupWebSocket();
  }

  void _initializeBottomNavigationPages() {
    pages = [
      BottumNavigationBarModel(
        page: HomePage(),
        buttomNavigationKey: homeButtomNavigationKey,
      ),
      BottumNavigationBarModel(
        page: const MarketPage(),
        buttomNavigationKey: marketsButtomNavigationKey,
      ),
      BottumNavigationBarModel(
        page: const ConvertPage(),
        buttomNavigationKey: tradesButtomNavigationKey,
      ),
      BottumNavigationBarModel(
        page: const WalletPage(),
        buttomNavigationKey: walletButtomNavigationKey,
      ),
    ];
  }

  Future<void> _fetchInitialData() async {
    // Fetch initial data from the server
  }
  void _setupWebSocket() {
    // Set up WebSocket connection and handle updates
  }

  void _onPopScope(bool didPop) {
    final NavigatorState currentNavigatorState = pages[
            Provider.of<BottumBarIndexProvider>(context, listen: false)
                .selectedPage]
        .buttomNavigationKey
        .currentState!;
    if (didPop && currentNavigatorState.canPop()) {
      currentNavigatorState.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // int selectedPage = Provider.of<BottumBarIndexProvider>(context).selectedPage;
    return PopScope(
      canPop: false,
      onPopInvoked: _onPopScope,
      child: Scaffold(
        backgroundColor: BitLuxColors.primary,
        body: IndexedStack(
          index: Provider.of<BottumBarIndexProvider>(context).selectedPage,
          children: pages
              .map(
                (page) => Navigator(
                  key: page.buttomNavigationKey,
                  onGenerateInitialRoutes: (navigator, initialRoute) {
                    return [MaterialPageRoute(builder: (context) => page.page)];
                  },
                ),
              )
              .toList(),
        ),
        floatingActionButton: CreateNewOrder(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BitLuxBottomNavBar(
            pageIndex:
                Provider.of<BottumBarIndexProvider>(context).selectedPage,
            onTap: (index) {
              if (index ==
                  Provider.of<BottumBarIndexProvider>(context, listen: false)
                      .selectedPage) {
                pages[index]
                    .buttomNavigationKey
                    .currentState
                    ?.popUntil((route) => route.isFirst);
              } else {
                Provider.of<BottumBarIndexProvider>(context, listen: false)
                    .changePage(index);
              }
            }),
      ),
    );
  }
}

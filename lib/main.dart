import 'package:bitlux_app_1/core/constants/colors.dart';
import 'package:bitlux_app_1/features/balance/presentation/providers/balance_board_provider.dart';
import 'package:bitlux_app_1/features/new_order/presentation/providers/slider_value_provider.dart';
import 'package:bitlux_app_1/features/skeleton/providers/bottum_bar_index_provider.dart';
import 'package:bitlux_app_1/features/skeleton/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottumBarIndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BalanceBoardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SliderValueProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Skeleton();
  }
}

import 'package:bitlux_app_1/core/constants/colors.dart';
import 'package:bitlux_app_1/core/constants/sizes.dart';
import 'package:bitlux_app_1/features/balance/presentation/pages/balace_board.dart';
import 'package:bitlux_app_1/features/orderbook/presentation/pages/order_list.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BitLuxColors.primary,
      appBar: AppBar(
        backgroundColor: BitLuxColors.primary,
        // centerTitle: true,
        title: Text('BitLux', style: GoogleFonts.roboto(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(BitLuxSizes.xs),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceBoard(),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return OrderList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

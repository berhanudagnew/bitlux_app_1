import 'package:bitlux_app_1/core/common_UI_UX/styles/border_radious_style.dart';
import 'package:bitlux_app_1/core/common_UI_UX/styles/divider_style.dart';
import 'package:bitlux_app_1/core/common_UI_UX/widgets/appbar/bitlux_search_app_bar.dart';
import 'package:bitlux_app_1/core/common_UI_UX/widgets/card/bitlux_round_card.dart';
import 'package:bitlux_app_1/core/common_UI_UX/widgets/radio_button/custom_radio_button.dart';
import 'package:bitlux_app_1/core/common_UI_UX/widgets/slider/slider_screen.dart';
import 'package:bitlux_app_1/core/common_UI_UX/widgets/text_field/bitlux_text_field.dart';
import 'package:bitlux_app_1/core/constants/colors.dart';
import 'package:bitlux_app_1/core/constants/sizes.dart';
import 'package:bitlux_app_1/features/new_order/presentation/providers/slider_value_provider.dart';
import 'package:bitlux_app_1/features/skeleton/providers/bottum_bar_index_provider.dart';
import 'package:bitlux_app_1/features/skeleton/widgets/bitlux_bottum_nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';

class AddNewOrder extends StatefulWidget {
  const AddNewOrder({super.key});
  @override
  State<AddNewOrder> createState() => _AddNewOrderState();
}

class _AddNewOrderState extends State<AddNewOrder> {
  double _value = 0;
  double total = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BitLuxColors.primary,
      appBar: AppBar(
        title: Text('Add new order', style: TextStyle(color: Colors.white)),
        backgroundColor: BitLuxColors.primary,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            delegate: BitLuxSearchAppBar(),
            pinned: true,
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(
                    top: 0, left: BitLuxSizes.sm, right: BitLuxSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BitLuxDividerStyle(
                      color: BitLuxColors.primary,
                    ),
                    CustomRadioButtons(
                      options: ['Limit', 'Market', 'Stop Limit'],
                      onSelected: (index) {
                        print('Selected index: $index');
                      },
                    ),
                    BitLuxDividerStyle(
                      color: BitLuxColors.primary,
                    ),
                    Text('Avbl: 9,500.0564107 USDT',
                        style: GoogleFonts.roboto(color: Colors.grey)),
                    SizedBox(height: 10),
                    BitLuxTextField(
                      textLable: 'Price',
                      textSuffix: 'USDT',
                      hintColor: BitLuxColors.grey,
                      inputColor: BitLuxColors.light,
                      fillColor: BitLuxColors.secondary,
                      inputType: TextInputType.number,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 10),

                    BitLuxTextField(
                      textLable: 'Amount',
                      textSuffix: 'BTC',
                      hintColor: BitLuxColors.grey,
                      inputColor: BitLuxColors.light,
                      fillColor: BitLuxColors.secondary,
                      inputType: TextInputType.number,
                      controller: TextEditingController(
                        text: (Provider.of<SliderValueProvider>(context)
                                    .totalAmount *
                                (Provider.of<SliderValueProvider>(context)
                                        .sliderValue /
                                    10))
                            .toStringAsFixed(2),
                      ),
                    ),

                    SliderScreen(),
                    BitLuxTextField(
                      textLable: 'Total',
                      textSuffix: 'USDT',
                      hintColor: BitLuxColors.grey,
                      inputColor: BitLuxColors.light,
                      fillColor: BitLuxColors.secondary,
                      inputType: TextInputType.number,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 10),
                    BitLuxTextField(
                      textLable: 'Risk Limit',
                      textSuffix: '%',
                      hintColor: BitLuxColors.grey,
                      inputColor: BitLuxColors.light,
                      fillColor: BitLuxColors.secondary,
                      inputType: TextInputType.number,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 10),

                    BitLuxDividerStyle(
                      color: BitLuxColors.primary,
                    ),
                    Stack(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CustomRadioButtons(
                            options: [
                              '',
                              '1s',
                              '1m',
                              '3m',
                              '5m',
                              '30m',
                              '1h',
                              '2h',
                              '6h',
                              '8h',
                              '12h',
                              '1D',
                              '3D',
                              '1W',
                              '1M'
                            ],
                            onSelected: (index) {
                              print('Selected index: $index');
                            },
                          ),
                        ),
                        Positioned(
                          // left: 16.0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            color: BitLuxColors.secondary,
                            // padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Time:',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: BitLuxSizes.md,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    BitLuxDividerStyle(
                      color: BitLuxColors.primary,
                    ),
                    SizedBox(height: 10),
                    BitLuxDividerStyle(
                      color: BitLuxColors.primary,
                    ),
                    Stack(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CustomRadioButtons(
                            options: ['', 'GTC', 'IOC', 'FOK'],
                            onSelected: (index) {
                              print('Selected index: $index');
                            },
                          ),
                        ),
                        Positioned(
                          // left: 16.0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            color: BitLuxColors.secondary,
                            // padding: EdgeInsets.all(8.0),
                            child: Text(
                              'T I F ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: BitLuxSizes.md,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    BitLuxDividerStyle(
                      color: BitLuxColors.primary,
                    ),
                    SizedBox(height: 10),
                    BitLuxTextField(
                      textLable: 'Total',
                      textSuffix: 'USDT',
                      hintColor: BitLuxColors.grey,
                      inputColor: BitLuxColors.light,
                      fillColor: BitLuxColors.secondary,
                      inputType: TextInputType.number,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 10),
                    // Buy SellButtons
                    BitLuxRoundCard(
                      borderRadius: BitLuxBorderRadius(
                              0, 0, BitLuxSizes.md, BitLuxSizes.md)
                          .borderRadius,
                      backgroundColor: BitLuxColors.primary,
                      // margin: EdgeInsets.symmetric(vertical: BitLuxSizes.xs),
                      padding: EdgeInsets.all(BitLuxSizes.sm),
                      width: double.infinity,
                      // height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                print('Another Button Pressed!');
                              },
                              child: BitLuxRoundCard(
                                borderRadius: BitLuxBorderRadius(
                                        BitLuxSizes.sm,
                                        BitLuxSizes.sm,
                                        BitLuxSizes.sm,
                                        BitLuxSizes.sm)
                                    .borderRadius,
                                margin: EdgeInsets.symmetric(
                                    horizontal: BitLuxSizes.sm),
                                backgroundColor: BitLuxColors.buttonGreen,
                                padding: EdgeInsets.all(BitLuxSizes.xs),
                                child: Text(
                                  'Buy',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    color: BitLuxColors.light,
                                    fontSize: BitLuxSizes.fontSizeMd,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // padding: EdgeInsets.all(16.0),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                print('Another Button Pressed!');
                              },
                              child: BitLuxRoundCard(
                                borderRadius: BitLuxBorderRadius(
                                        BitLuxSizes.sm,
                                        BitLuxSizes.sm,
                                        BitLuxSizes.sm,
                                        BitLuxSizes.sm)
                                    .borderRadius,
                                margin: EdgeInsets.symmetric(
                                    horizontal: BitLuxSizes.sm),
                                backgroundColor: BitLuxColors.buttonRed,
                                padding: EdgeInsets.all(BitLuxSizes.xs),
                                child: Text(
                                  'SELL',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    color: BitLuxColors.light,
                                    fontSize: BitLuxSizes.fontSizeMd,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // padding: EdgeInsets.all(16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: BitLuxSizes.xl),
                  ],
                ),
              );
            }, childCount: 1),
          ),
        ],
      ),
      bottomNavigationBar: BitLuxBottomNavBar(
        pageIndex: Provider.of<BottumBarIndexProvider>(context).selectedPage,
        onTap: (index) {
          Provider.of<BottumBarIndexProvider>(context, listen: false)
              .changePage(index);
          Navigator.of(context).pop(); // Close the add order screen
        },
      ),
    );
  }
}

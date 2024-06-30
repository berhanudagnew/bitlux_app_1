import 'package:flutter/material.dart';

import 'package:bitlux_app_1/core/constants/colors.dart';
import 'package:bitlux_app_1/core/constants/sizes.dart';

/// A circular loader widget with customizable foreground and background colors.
class TCircularLoader extends StatelessWidget {
  /// Default constructor for the TCircularLoader.
  ///
  /// Parameters:
  ///   - foregroundColor: The color of the circular loader.
  ///   - backgroundColor: The background color of the circular loader.
  const TCircularLoader({
    super.key,
    this.foregroundColor = BitLuxColors.white,
    this.backgroundColor = BitLuxColors.primary,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(BitLuxSizes.lg),
      decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle), // Circular background
      child: Center(
        child: CircularProgressIndicator(
            color: foregroundColor,
            backgroundColor: Colors.transparent), // Circular loader
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../card/bitlux_round_card.dart';

class BitLuxButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final BoxBorder? border;

  BitLuxButton({
    required this.onTap,
    required this.child,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.blue,
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          border: border,
        ),
        padding: padding ?? EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}

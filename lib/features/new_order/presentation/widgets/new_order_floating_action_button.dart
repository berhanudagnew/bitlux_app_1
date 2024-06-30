import 'package:bitlux_app_1/core/constants/colors.dart';
import 'package:bitlux_app_1/features/new_order/presentation/pages/add_new_order.dart';
import 'package:flutter/material.dart';

class CreateNewOrder extends StatelessWidget {
  const CreateNewOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 64,
      width: 64,
      child: FloatingActionButton(
        backgroundColor: BitLuxColors.secondary,
        elevation: 0,
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNewOrder(),
            ),
          ),
        },
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 4, color: BitLuxColors.buttonGold),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.add,
          color: BitLuxColors.buttonGold,
        ),
      ),
    );
  }
}

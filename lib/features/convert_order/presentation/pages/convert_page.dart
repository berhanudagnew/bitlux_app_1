import 'package:bitlux_app_1/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({super.key});

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Convert',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: BitLuxColors.primary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildConversionSection(),
            SizedBox(height: 20),
            // _buildKeypad(),
            SizedBox(height: 20),
            _buildPreviewButton(),
          ],
        ),
      ),
      backgroundColor: BitLuxColors.primary,
    );
  }

  Widget _buildConversionSection() {
    return Column(
      children: [
        _buildConversionRow(
            'From', 'USDT', 'Available 82.40442496 USDT', '0.01 - 8000'),
        SizedBox(height: 20),
        _buildConversionRow('To', 'IO', '', '0.0017 - 1300'),
      ],
    );
  }

  Widget _buildConversionRow(
      String label, String asset, String available, String range) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: BitLuxColors.secondary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              if (available.isNotEmpty)
                Text(
                  available,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                asset,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Text(
                range,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          if (label == 'From')
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'MAX',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.amber,
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildKeypadRow(List<String> keys) {
    return keys.map((key) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey[800],
              minimumSize: Size(60, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              key,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildPreviewButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.amber,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Preview Conversion',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

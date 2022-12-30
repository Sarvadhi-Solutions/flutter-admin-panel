import 'package:admin_dash/src/constant/color.dart';
import 'package:admin_dash/src/constant/string.dart';
import 'package:admin_dash/src/constant/text.dart';
import 'package:admin_dash/src/views/dashboard/piechart.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({Key? key}) : super(key: key);

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        constraints: const BoxConstraints(minHeight: 465),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstText.lightText(
              text: Strings.salesReport,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h24,
            _dateAndPrice(),
            FxBox.h40,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 240,
              child: const PieChartSample2(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'November 01 - November 30',
          softWrap: true,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '\$${2730}',
          softWrap: true,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

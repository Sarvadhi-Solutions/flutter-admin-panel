import 'package:admin_dash/src/constant/color.dart';
import 'package:admin_dash/src/constant/string.dart';
import 'package:admin_dash/src/constant/text.dart';
import 'package:admin_dash/src/utils/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class Salesanalytics extends StatefulWidget {
  const Salesanalytics({Key? key}) : super(key: key);

  @override
  State<Salesanalytics> createState() => _SalesanalyticsState();
}

class _SalesanalyticsState extends State<Salesanalytics> {
  final List<FlSpot> _offlineChart = const [
    FlSpot(0, 4),
    FlSpot(0.5, 1.5),
    FlSpot(1, 3),
    FlSpot(1.5, -2),
    FlSpot(2, 5),
    FlSpot(2.5, -1),
    FlSpot(3, 3),
  ];
  final List<FlSpot> _onlineChart = const [
    FlSpot(0, 4),
    FlSpot(0.5, 1.5),
    FlSpot(1, 3),
    FlSpot(1.5, 1),
    FlSpot(2, 4),
    FlSpot(2.5, 3.5),
    FlSpot(3, 0),
  ];
  final List<FlSpot> _marketingChart = const [
    FlSpot(0, 4),
    FlSpot(0.5, 1.5),
    FlSpot(1, 3),
    FlSpot(1.5, 1),
    FlSpot(2, 4),
    FlSpot(2.5, 3.5),
    FlSpot(3, 0),
  ];
  LineChartData mainData(List<FlSpot> list) {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) {
            double value = 0.0;
            for (LineBarSpot lineBarSpot in touchedSpots) {
              value = lineBarSpot.y;
            }
            return [
              LineTooltipItem(
                value.toString(),
                const TextStyle(
                  color: ColorConst.darkFontColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ];
          },
          tooltipBgColor: ColorConst.grey800,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        drawVerticalLine: false,
        drawHorizontalLine: false,
      ),
      titlesData: FlTitlesData(
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      minX: 0,
      maxX: 4,
      minY: 0,
      maxY: 4,
      lineBarsData: [
        LineChartBarData(
          dotData: FlDotData(show: true),
          spots: list,
          color: ColorConst.primary,
          barWidth: 2,
          isStrokeCapRound: true,
          isCurved: true,
          belowBarData: BarAreaData(
            show: true,
            color: ColorConst.primary.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 465),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstText.lightText(
                text: Strings.salesAnalytics,
                fontWeight: FontWeight.bold,
              ),
              _statusAndvalueWithChart(
                status: 'Website',
                value: '10,942',
                list: _onlineChart,
              ),
              _statusAndvalueWithChart(
                status: 'Desktop',
                value: '8,451',
                list: _offlineChart,
              ),
              _statusAndvalueWithChart(
                status: 'Mobile',
                value: '1,574',
                list: _marketingChart,
              ),
              FxBox.shrink,
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusAndvalueWithChart({
    required String status,
    required String value,
    required List<FlSpot> list,
  }) {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _statusAndvalue(
                status: status,
                value: value,
              ),
              Responsive.isMobile(context) ? FxBox.h2 : FxBox.shrink,
              SizedBox(
                height: 50,
                child: LineChart(
                  mainData(list),
                ),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                flex: 1,
                child: _statusAndvalue(
                  status: status,
                  value: value,
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 50,
                  child: LineChart(
                    mainData(list),
                  ),
                ),
              )
            ],
          );
  }

  Widget _statusAndvalue({
    required String status,
    required String value,
  }) {
    return Column(
      children: [
        ConstText.lightText(
          text: status,
          fontWeight: FontWeight.w500,
        ),
        Responsive.isMobile(context) ? FxBox.h2 : FxBox.h20,
        ConstText.lightText(
          text: value,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}

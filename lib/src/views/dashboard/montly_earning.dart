import 'package:admin_dash/src/constant/color.dart';
import 'package:admin_dash/src/constant/string.dart';
import 'package:admin_dash/src/constant/text.dart';
import 'package:admin_dash/src/utils/responsive.dart';
import 'package:admin_dash/src/widget/half_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class Monthlyearning extends StatefulWidget {
  const Monthlyearning({Key? key}) : super(key: key);

  @override
  State<Monthlyearning> createState() => _MonthlyearningState();
}

class _MonthlyearningState extends State<Monthlyearning> {
  final double width = 16;
  static const Color chartJsBarChart = Color(0xff37a499);

  BarChart mainData() {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData(context),
        titlesData: titlesData,
        borderData: FlBorderData(show: false),
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
    // return LineChartData(
    //   lineTouchData: LineTouchData(
    //     enabled: true,
    //     touchTooltipData: LineTouchTooltipData(
    //       getTooltipItems: (touchedSpots) {
    //         double value = 0.0;
    //         for (LineBarSpot lineBarSpot in touchedSpots) {
    //           value = lineBarSpot.y;
    //         }
    //         return [
    //           LineTooltipItem(
    //             value.toString(),
    //             const TextStyle(
    //               color: ColorConst.darkFontColor,
    //               fontWeight: FontWeight.w700,
    //             ),
    //           ),
    //         ];
    //       },
    //       tooltipBgColor: ColorConst.grey800,
    //     ),
    //   ),
    //   borderData: FlBorderData(
    //     show: false,
    //   ),
    //   gridData: FlGridData(
    //     drawVerticalLine: true,
    //   ),
    //   titlesData: FlTitlesData(
    //     rightTitles: AxisTitles(
    //       sideTitles: SideTitles(showTitles: false),
    //     ),
    //     topTitles: AxisTitles(
    //       sideTitles: SideTitles(showTitles: false),
    //     ),
    //     bottomTitles: AxisTitles(
    //       sideTitles: SideTitles(
    //         showTitles: true,
    //         reservedSize: 30,
    //         interval: 1,
    //       ),
    //     ),
    //   ),
    //   minX: 0,
    //   maxX: 11,
    //   minY: 0,
    //   maxY: 6,
    //   lineBarsData: [
    //     LineChartBarData(
    //       spots: const [
    //         FlSpot(0, 3),
    //         FlSpot(2, 5.5),
    //         FlSpot(4, 4),
    //         FlSpot(6, 5),
    //         FlSpot(8, 3),
    //         FlSpot(9.5, 2),
    //         FlSpot(11, 4),
    //       ],
    //       isCurved: true,
    //       color: ColorConst.primary,
    //       barWidth: 2,
    //       isStrokeCapRound: true,
    //       belowBarData: BarAreaData(
    //         show: true,
    //         color: ColorConst.chartForgoundColor,
    //       ),
    //     ),
    //   ],
    // );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            interval: 5,
            // getTitlesWidget: leftTitles,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  BarTouchData barTouchData(BuildContext context) {
    return BarTouchData(
      enabled: true,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: ColorConst.grey800,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            rod.toY.toString(),
            const TextStyle(
              color: ColorConst.darkFontColor,
              fontWeight: FontWeight.w700,
            ),
          );
        },
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      default:
        text = 'Dec';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(text, style: style),
    );
  }

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            _barChartRodData(toY: 15),
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            _barChartRodData(toY: 10),
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            _barChartRodData(toY: 14),
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            _barChartRodData(toY: 15),
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            _barChartRodData(toY: 13),
          ],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            _barChartRodData(toY: 10),
          ],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            _barChartRodData(toY: 13),
          ],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            _barChartRodData(toY: 5),
          ],
        ),
        BarChartGroupData(
          x: 8,
          barRods: [
            _barChartRodData(toY: 10),
          ],
        ),
        BarChartGroupData(
          x: 9,
          barRods: [
            _barChartRodData(toY: 20),
          ],
        ),
        BarChartGroupData(
          x: 10,
          barRods: [
            _barChartRodData(toY: 10),
          ],
        ),
        BarChartGroupData(
          x: 11,
          barRods: [
            _barChartRodData(toY: 17),
          ],
        ),
        BarChartGroupData(
          x: 12,
          barRods: [
            _barChartRodData(toY: 19),
          ],
        ),
      ];

  BarChartRodData _barChartRodData({required double toY}) {
    return BarChartRodData(
      width: width,
      toY: toY,
      color: chartJsBarChart,
      borderRadius: BorderRadius.zero,
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
        constraints:
            BoxConstraints(maxHeight: Responsive.isMobile(context) ? 978 : 455),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstText.lightText(
                text: Strings.monthlyEarning,
                fontWeight: FontWeight.bold,
              ),
              FxBox.h24,
              Responsive.isMobile(context)
                  ? Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            // child: LineChart(mainData()),
                            child: mainData(),
                          ),
                          FxBox.h16,
                          Expanded(
                            child: _monthEarning(
                              durationText: 'This month',
                              salesAmount: '\u{20B9}25,234',
                              descriptionText:
                                  'Lorem Ipsum is simply dummy text.',
                            ),
                          ),
                          FxBox.h16,
                          Expanded(
                            child: _monthEarning(
                              durationText: 'Last month',
                              salesAmount: '\u{20B9}76,321',
                              descriptionText:
                                  'Lorem Ipsum is simply dummy text.',
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            // child: LineChart(mainData()),
                            child: mainData(),
                          ),
                          FxBox.w32,
                          Expanded(
                            child: _monthEarning(
                              durationText: 'This month',
                              salesAmount: '\u{20B9}25,234',
                              descriptionText:
                                  'Lorem Ipsum is simply dummy text.',
                            ),
                          ),
                          FxBox.w32,
                          Expanded(
                            child: _monthEarning(
                              durationText: 'Last month',
                              salesAmount: '\u{20B9}76,321',
                              descriptionText:
                                  'Lorem Ipsum is simply dummy text.',
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _monthEarning({
    required String durationText,
    required String salesAmount,
    required String descriptionText,
  }) {
    final screenwidth = MediaQuery.of(context).size.width - 48;
    final radius = (screenwidth / 4) - 8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstText.lightText(
          text: durationText,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        Responsive.isMobile(context) ? FxBox.h8 : FxBox.h28,
        ConstText.largeText(
          text: salesAmount,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        Responsive.isMobile(context) ? FxBox.h8 : FxBox.h28,
        ConstText.lightText(
          textAlign: TextAlign.center,
          text: descriptionText,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        Responsive.isMobile(context) ? FxBox.h16 : FxBox.h28,
        // _circularProgress(),
        _halfCircleChart(
          radius: radius >= 77 ? 77 : radius,
          chartColor: ColorConst.primary,
          chartpercentage: 0.6,
        ),
      ],
    );
  }

  Widget _halfCircleChart({
    required double chartpercentage,
    required Color chartColor,
    required double radius,
  }) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircularPercentIndicator(
            radius: radius,
            lineWidth: 15,
            percent: 1,
            progressColor: ColorConst.drawerBG,
            circularStrokeCap: CircularStrokeCap.square,
            arcType: ArcType.HALF,
          ),
          CircularPercentIndicator(
            radius: 77,
            lineWidth: 15,
            percent: chartpercentage,
            backgroundColor: ColorConst.white,
            progressColor: chartColor,
            circularStrokeCap: CircularStrokeCap.square,
            arcType: ArcType.HALF,
          ),
        ],
      ),
    );
  }
}

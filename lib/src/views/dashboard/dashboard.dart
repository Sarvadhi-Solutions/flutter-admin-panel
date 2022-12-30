import 'package:admin_dash/src/utils/responsive.dart';
import 'package:admin_dash/src/views/dashboard/activity.dart';
import 'package:admin_dash/src/views/dashboard/chat_screen.dart';
import 'package:admin_dash/src/views/dashboard/client_review.dart';
import 'package:admin_dash/src/views/dashboard/list_item.dart';
import 'package:admin_dash/src/views/dashboard/montly_earning.dart';
import 'package:admin_dash/src/views/dashboard/sales_analytics.dart';
import 'package:admin_dash/src/views/dashboard/sales_report.dart';
import 'package:admin_dash/src/views/dashboard/status_box.dart';
import 'package:admin_dash/src/views/dashboard/top_producr_sales_box.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const Listitem(),
            FxBox.h24,
            const Monthlyearning(),
            FxBox.h24,
            Responsive.isWeb(context)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: SalesReport(),
                      ),
                      FxBox.w24,
                      const Expanded(
                        child: Salesanalytics(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const SalesReport(),
                      FxBox.h24,
                      const Salesanalytics(),
                    ],
                  ),
            FxBox.h24,
            Responsive.isWeb(context)
                ? Row(
                    children: [
                      const Expanded(
                        child: Chatscreen(),
                      ),
                      FxBox.w24,
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(child: StatusBox()),
                                FxBox.w24,
                                const Expanded(child: TopProductSale()),
                              ],
                            ),
                            FxBox.h24,
                            const Clienresponse(),
                          ],
                        ),
                      ),
                      FxBox.w24,
                      const Expanded(
                        child: Activity(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const Chatscreen(),
                      FxBox.h24,
                      Responsive.isTablet(context)
                          ? Row(
                              children: [
                                const Expanded(child: StatusBox()),
                                FxBox.w24,
                                const Expanded(child: TopProductSale()),
                              ],
                            )
                          : Column(
                              children: [
                                const StatusBox(),
                                FxBox.h24,
                                const TopProductSale(),
                              ],
                            ),
                      FxBox.h24,
                      const Clienresponse(),
                      FxBox.h24,
                      const Activity(),
                    ],
                  ),
          ],
        ),
      ],
    );
  }
}

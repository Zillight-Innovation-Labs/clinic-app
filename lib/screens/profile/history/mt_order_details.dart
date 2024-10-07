import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/screens/profile/history/mt_order_track.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timeline_tile/timeline_tile.dart';


class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(
            color: Colors.black,
          ),
          elevation: 0,
          title: Text(
            'Order Details',
            style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  elevation: 0,
                  enableScaleAnimation: false,
                  onTap: () => finish(context),
                  shapeBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: kBadgeColor)),
                  text: "Cancel",
                  textStyle: TextStyle(color: kBadgeColor, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppButton(
                  elevation: 0,
                  enableScaleAnimation: false,
                  onTap: () => const TrackOrderScreen().launch(context),
                  shapeBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                  color: kMainColor,
                  text: "Track My Order",
                  textStyle: TextStyle(color: kElevatedButtonTextColor, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Color(0xFFF8F8FC),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "12 May, 2022",
                    style: TextStyle(color: kSubTitleColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: context.width() * 2,
                    height: 60.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TimelineTile(
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.3,
                            isFirst: true,
                            indicatorStyle: IndicatorStyle(
                                indicator: Icon(
                                  Icons.check_circle,
                                  color: kMainColor,
                                ),
                                padding: const EdgeInsets.only(right: 4.0)),
                            endChild: Text(
                              'Confirmed',
                              style: TextStyle(color: kSubTitleColor),
                            ),
                            beforeLineStyle: LineStyle(color: kMainColor, thickness: 1),
                          ),
                          TimelineTile(
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.3,
                            indicatorStyle: IndicatorStyle(
                                indicator: Icon(
                                  Icons.check_circle,
                                  color: kMainColor,
                                ),
                                color: Colors.green,
                                padding: const EdgeInsets.only(right: 4.0)),
                            endChild: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Prepered',
                                  style: TextStyle(color: kSubTitleColor),
                                ),
                              ],
                            ),
                            beforeLineStyle: LineStyle(color: kMainColor, thickness: 1),
                          ),
                          TimelineTile(
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.3,
                            indicatorStyle: IndicatorStyle(
                                indicator: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: kDividerColor,
                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(40),
                                            color: kMainColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // color: Colors.green,
                                padding: const EdgeInsets.only(right: 4.0)),
                            endChild: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Picked',
                                  style: TextStyle(color: kSubTitleColor),
                                ),
                              ],
                            ),
                            beforeLineStyle: LineStyle(color: kDividerColor, thickness: 1),
                          ),
                          TimelineTile(
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.3,
                            indicatorStyle: IndicatorStyle(
                                indicator: Stack(children: [
                                  Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: kDividerColor),
                                    child: Center(
                                      child: Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: kMainColor),
                                      ),
                                    ),
                                  ),
                                ]),
                                // color: Colors.green,
                                padding: const EdgeInsets.only(right: 4.0)),
                            endChild: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Delivered',
                                  style: TextStyle(color: kSubTitleColor),
                                ),
                              ],
                            ),
                            beforeLineStyle: LineStyle(color: kDividerColor, thickness: 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: kSubTitleColor.withOpacity(0.10))),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(50),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/napa.png",
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Maan Pharmacy Ltd.",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kTitleColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("(Paracetamol)", style: ksubTitleTextStyle),
                                          RichText(
                                            text: TextSpan(
                                              text: '\$6.99',
                                              style: TextStyle(color: kWatchColor, fontWeight: FontWeight.w600),
                                              children: [
                                                const WidgetSpan(
                                                  child: SizedBox(
                                                    width: 5,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '\$6.99',
                                                  style: TextStyle(color: kSubTitleColor, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '10 tablets',
                                            style: ksubTitleTextStyle,
                                          ),
                                          Text(
                                            'Qty: 01',
                                            style: ksubTitleTextStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Order Details",
                    style: TextStyle(color: kTitleColor, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your order Number:",
                        style: TextStyle(color: kTitleColor.withOpacity(0.7), fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "#s5jc-226",
                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your order from:",
                        style: TextStyle(
                          color: kTitleColor.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        "Maan Pharmacy Ltd.",
                        style: TextStyle(
                          color: kTitleColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Addesss:",
                        style: TextStyle(color: kTitleColor.withOpacity(0.7), fontWeight: FontWeight.w400),
                      ),
                      RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(text: "Home", style: TextStyle(color: kTitleColor, fontWeight: FontWeight.w600), children: [
                            TextSpan(
                              text: "\nNew York, NY 10001-4374\nRoad NO: 17, Floor 27",
                              style: TextStyle(color: kSubTitleColor, fontWeight: FontWeight.w400),
                            )
                          ]))
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Payment Method",
                    style: TextStyle(fontWeight: FontWeight.bold, color: kTitleColor),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: kMainColor),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, color: kLikeWhiteColor),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/images/credit.png",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/images/visa.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: "View  Details ",
                      style: TextStyle(color: kTitleColor, fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                          text: "(2 Items)",
                          style: TextStyle(color: kSubTitleColor, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: "1. ",
                          style: TextStyle(
                            color: kTitleColor,
                          ),
                          children: [
                            TextSpan(
                              text: "Napa extend tablet",
                              style: TextStyle(color: kSubTitleColor, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text("\$3.59", style: TextStyle(color: kTitleColor, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: "2. ",
                          style: TextStyle(
                            color: kTitleColor,
                          ),
                          children: [
                            TextSpan(
                              text: "Xpa Pediatric Drop",
                              style: TextStyle(
                                color: kSubTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text("\$5.59", style: TextStyle(color: kTitleColor, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Subtotal",
                    style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "VAT",
                        style: TextStyle(color: kSubTitleColor, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "\$0.00",
                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total (incl. VAT)",
                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "\$9.59",
                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

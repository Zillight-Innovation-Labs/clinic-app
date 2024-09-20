import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/screens/auth/profile/history/mt_order_details.dart';
import 'package:kivicare_patient/screens/auth/profile/history/mt_past_prescription_history.dart';
import 'package:nb_utils/nb_utils.dart';



class MyPrescriptionHistoryScreen extends StatefulWidget {
  const MyPrescriptionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<MyPrescriptionHistoryScreen> createState() => _MyPrescriptionHistoryScreenState();
}

class _MyPrescriptionHistoryScreenState extends State<MyPrescriptionHistoryScreen> {
  List conditions = ["Delivered", 'Processed', "Received"];
  List condition = ["Cancel", 'Processed', "Received"];
  List colors = [kWatchColor, kStarColor, kMainColor];
  List color = [kBadgeColor, kStarColor, kMainColor];

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Prescription",
      appBarVerticalSize: Get.height * 0.12,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      elevation: 0,
                      enableScaleAnimation: false,
                      onTap: () {},
                      shapeBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                      color: kMainColor,
                      text: "Upcoming",
                      textStyle: TextStyle(color: kElevatedButtonTextColor, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppButton(
                      elevation: 0,
                      enableScaleAnimation: false,
                      onTap: () {
                        const PastPrescriptionHistoryScreen().launch(context);
                      },
                      shapeBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: kMainColor)),
                      text: "Past",
                      textStyle: TextStyle(color: kMainColor, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: kbigContainerColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today - 12 July 2022",
                      style: TextStyle(fontWeight: FontWeight.w600, color: kSubTitleColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: colors.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: kSubTitleColor.withOpacity(0.10))),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(35),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: const DecorationImage(image: AssetImage('assets/images/diagnostics_lab.png'), fit: BoxFit.fill)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Napa Extend Tablet",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "10 Tablets",
                                              style: ksubTitleTextStyle,
                                            ),
                                            Text(
                                              "Amount: \$6.99",
                                              style: ksubTitleTextStyle,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Qty: 01",
                                              style: ksubTitleTextStyle,
                                            ),
                                            Text(
                                              conditions[index],
                                              style: TextStyle(color: colors[index]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ).onTap(
                          () => const OrderDetailsScreen().launch(context),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Yesterday - 11 July 2022",
                      style: TextStyle(fontWeight: FontWeight.w600, color: kSubTitleColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: colors.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Card(
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: kSubTitleColor.withOpacity(0.10))),
                              child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                                    Container(
                                      padding: const EdgeInsets.all(35),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8), image: const DecorationImage(image: AssetImage('assets/images/diagnostics_lab.png'), fit: BoxFit.fill)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Napa Extend Tablet",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "10 Tablets",
                                                style: ksubTitleTextStyle,
                                              ),
                                              Text(
                                                "Amount: \$6.99",
                                                style: ksubTitleTextStyle,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Qty: 01",
                                                style: ksubTitleTextStyle,
                                              ),
                                              Text(
                                                condition[index],
                                                style: TextStyle(color: color[index]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ])),
                            )).onTap(() => const OrderDetailsScreen().launch(context));
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

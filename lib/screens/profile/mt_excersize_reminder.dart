import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/screens/profile/mt_cycling.dart';
import 'package:kivicare_patient/screens/profile/mt_indoor_runing.dart';
import 'package:kivicare_patient/screens/profile/mt_outdoor_running.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:get/get.dart';

class ExcersizeReminderScreen extends StatefulWidget {
  const ExcersizeReminderScreen({Key? key}) : super(key: key);

  @override
  State<ExcersizeReminderScreen> createState() =>
      _ExcersizeReminderScreenState();
}

class _ExcersizeReminderScreenState extends State<ExcersizeReminderScreen> {
  List exerciseType = [
    {
      "image": "assets/images/outdoor-run.png",
      'name': "Outdoor running",
    },
    {"image": "assets/images/trademil.png", 'name': "Indoor running"},
    {"image": "assets/images/cycle.png", 'name': "Cycling "},
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Exercise Reminder",
      appBarVerticalSize: Get.height * 0.12,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Text(
            //     "12 July, 2022",
            //     style:
            //         TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // const SizedBox(
            //   height: 12,
            // ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: kContainerBgColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kExcerSizeBannerColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/running.png"),
                              radius: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Indoor Running Done",
                                  style: TextStyle(
                                      color: kLikeWhiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "Total 30 Days (26 days Completed)",
                                  style: TextStyle(
                                    color: kLikeWhiteColor,
                                  ),
                                ),
                                LinearPercentIndicator(
                                  width: 200,
                                  padding: EdgeInsets.zero,
                                  lineHeight: 4.0,
                                  percent: 0.5,
                                  trailing: Text(
                                    "50.0%",
                                    style: TextStyle(color: kLikeWhiteColor),
                                  ),
                                  backgroundColor:
                                      kLikeWhiteColor.withOpacity(0.20),
                                  progressColor: kLikeWhiteColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: exerciseType.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: kLikeWhiteColor),
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          exerciseType[index]['image']),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              exerciseType[index]['name'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Icon(
                                                Icons.check_circle,
                                                color: kMainColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Your Goal 90 days",
                                          style:
                                              TextStyle(color: kSubTitleColor),
                                        ),
                                        Text(
                                          "You have completed 30 Days",
                                          style:
                                              TextStyle(color: kSubTitleColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ).onTap(() {
                            if (index == 0) {
                              Get.to(() => const OutdoorRunningScreen());
                            } else if (index == 1) {
                              Get.to(() => const IndoorRunningScreen());
                            } else {
                              Get.to(() => const CyclingRunningScreen());
                            }
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:healthcelerate/api/const/const.dart';
import 'package:healthcelerate/components/app_scaffold.dart';
import 'package:healthcelerate/screens/profile/history/mt_diag_offline_appointments_details.dart';
import 'package:healthcelerate/screens/profile/history/mt_past_ambulance_history.dart';
import 'package:nb_utils/nb_utils.dart';

class UpcomingAmbulanceHistoryScreen extends StatefulWidget {
  const UpcomingAmbulanceHistoryScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingAmbulanceHistoryScreen> createState() =>
      _UpcomingAmbulanceHistoryScreenState();
}

class _UpcomingAmbulanceHistoryScreenState
    extends State<UpcomingAmbulanceHistoryScreen> {
  List conditions = [
    "Cancel",
    'Accepted',
    'Accepted',
  ];
  List colors = [
    kBadgeColor,
    kWatchColor,
    kWatchColor,
  ];
  List packsColor = [kHeartBgColor, kLungsBgColor, kDaigLungsBGColor];
  List names = ["General Ambulance", "ICU Ambulance", "Freezing Ambulance"];
  List ambulanceImages = [
    "assets/images/general.png",
    "assets/images/icu.png",
    "assets/images/freege.png"
  ];
  List color = [
    kGAmbulanceBGColor,
    kIcuAmbulanceBGColor,
    kFreegeAmbulanceBGColor
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Ambluance",
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
                      shapeBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none),
                      color: kMainColor,
                      text: "Upcoming",
                      textStyle: TextStyle(
                          color: kElevatedButtonTextColor,
                          fontWeight: FontWeight.w700),
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
                        const PastAmbulanceHistoryScreen().launch(context);
                      },
                      shapeBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: kMainColor)),
                      text: "Past",
                      textStyle: TextStyle(
                          color: kMainColor, fontWeight: FontWeight.w700),
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
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today - 12 July 2022",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kSubTitleColor),
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: kSubTitleColor
                                              .withOpacity(0.10))),
                                  child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 96,
                                              decoration: BoxDecoration(
                                                  color: color[index],
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      color: kSubTitleColor
                                                          .withOpacity(0.1)),
                                                  image: DecorationImage(
                                                      scale: 2,
                                                      image: AssetImage(
                                                          ambulanceImages[
                                                              index]))),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    names[index],
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  RichText(
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    text: TextSpan(
                                                      text: "Pickup Point: ",
                                                      style: TextStyle(
                                                          color: kTitleColor),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              "2715 Ash Dr. San Jose, So... ",
                                                          style: TextStyle(
                                                            color:
                                                                kSubTitleColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  RichText(
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    text: TextSpan(
                                                      text:
                                                          "Destination Point: ",
                                                      style: TextStyle(
                                                          color: kTitleColor),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              "2715 Ash Dr. San Jose, So... ",
                                                          style: TextStyle(
                                                            color:
                                                                kSubTitleColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      RichText(
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          text: TextSpan(
                                                              text: "Date:",
                                                              style: TextStyle(
                                                                  color:
                                                                      kTitleColor),
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      " 26 Jun 2022",
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        kSubTitleColor,
                                                                  ),
                                                                )
                                                              ])),
                                                      Text(
                                                        conditions[index],
                                                        style: TextStyle(
                                                            color:
                                                                colors[index]),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ])),
                                ))
                            .onTap(() =>
                                const DiagnosticsOfflineAppoinmentScreen()
                                    .launch(context));
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Yesterday - 11 July 2022",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kSubTitleColor),
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: kSubTitleColor
                                              .withOpacity(0.10))),
                                  child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 96,
                                              decoration: BoxDecoration(
                                                  color: color[index],
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      color: kSubTitleColor
                                                          .withOpacity(0.1)),
                                                  image: DecorationImage(
                                                      scale: 2,
                                                      image: AssetImage(
                                                          ambulanceImages[
                                                              index]))),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    names[index],
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  RichText(
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    text: TextSpan(
                                                      text: "Pickup Point: ",
                                                      style: TextStyle(
                                                          color: kTitleColor),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              "2715 Ash Dr. San Jose, So... ",
                                                          style: TextStyle(
                                                            color:
                                                                kSubTitleColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  RichText(
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    text: TextSpan(
                                                      text:
                                                          "Destination Point: ",
                                                      style: TextStyle(
                                                          color: kTitleColor),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              "2715 Ash Dr. San Jose, So... ",
                                                          style: TextStyle(
                                                            color:
                                                                kSubTitleColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      RichText(
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          text: TextSpan(
                                                              text: "Date:",
                                                              style: TextStyle(
                                                                  color:
                                                                      kTitleColor),
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      " 26 Jun 2022",
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        kSubTitleColor,
                                                                  ),
                                                                )
                                                              ])),
                                                      Text(
                                                        conditions[index],
                                                        style: TextStyle(
                                                            color:
                                                                colors[index]),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ])),
                                ))
                            .onTap(() => const PastAmbulanceHistoryScreen()
                                .launch(context));
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

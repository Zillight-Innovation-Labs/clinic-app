import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:nb_utils/nb_utils.dart';

import 'mt_upcoming_nursing_care_history.dart';

class PastNursingCareHistoryScreen extends StatefulWidget {
  const PastNursingCareHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PastNursingCareHistoryScreen> createState() =>
      _PastNursingCareHistoryScreenState();
}

class _PastNursingCareHistoryScreenState
    extends State<PastNursingCareHistoryScreen> {

  List conditions = ["In Progress", 'Accepted', "Cancel"];
  List colors = [kWatchColor, kStarColor, kBadgeColor];
  List packsColor = [kHeartBgColor, kLungsBgColor, kDaigLungsBGColor];
  List texts = ["packs 1", "packs 3", "packs4"];
  List names = [
    "Name: Shaidul islma",
    "Name: Ibne Riead",
    "Name:Tarik Bin Aziz"
  ];
  List dayPacks = [
    "Day: 1 Day Pack",
    "Day: 3 Day Pack",
    "Day: 4 Day Pack"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: kTitleColor,
        ),
        title: Text(
          "Nursing Care History",
          style: ktitleTextStyle,
        ),
      ),
      body:  SingleChildScrollView(
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
                      onTap: () {
                        const UpcomingNursingCareHistoryScreen().launch(context);
                      },
                      shapeBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: kMainColor)),
                      color: kLikeWhiteColor,
                      text: "Upcoming",
                      textStyle: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppButton(
                      elevation: 0,
                      color: kMainColor,
                      enableScaleAnimation: false,
                      onTap: () {
                      },
                      shapeBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: kMainColor)),
                      text: "Past",
                      textStyle: TextStyle(
                          color: kLikeWhiteColor, fontWeight: FontWeight.w700),
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
                  )),
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
                                        Stack(
                                            alignment:
                                            AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color:
                                                    packsColor[index]),
                                                child: Align(
                                                    alignment:
                                                    Alignment.topLeft,
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(
                                                          bottom: 10.0),
                                                      child: Image.asset(
                                                        "assets/images/Ellipse 792.png",
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  texts[index],
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w900,
                                                      color:
                                                      kLikeWhiteColor),
                                                ),
                                              ),
                                            ],),
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
                                              Row(
                                                children: [
                                                  Icon(
                                                    FeatherIcons.mapPin,
                                                    color: kMainColor,
                                                    size: 18,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                        "2715 Ash Dr. San Jose, South Dakoterjrkel",
                                                        style:TextStyle(overflow: TextOverflow.ellipsis,color: kSubTitleColor )
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "Date: 26 Jun 2022 - 29 Jun 2022",
                                                style:
                                                ksubTitleTextStyle,
                                              ), const SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    dayPacks[index],
                                                    style:
                                                    ksubTitleTextStyle,
                                                  ),
                                                  Text(
                                                    "Reschedule",
                                                    style: TextStyle(
                                                        color:kMainColor),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ])),
                            ));

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

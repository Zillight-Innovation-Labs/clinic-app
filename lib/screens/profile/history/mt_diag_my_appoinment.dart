import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/screens/auth/model/mt_doctor_model.dart';
import 'package:kivicare_patient/screens/profile/history/mt_diag_offline_appointments_details.dart';
import 'package:nb_utils/nb_utils.dart';


class DiagnosticsMyAppoinmentScreen extends StatefulWidget {
  const DiagnosticsMyAppoinmentScreen({Key? key}) : super(key: key);

  @override
  State<DiagnosticsMyAppoinmentScreen> createState() => _DiagnosticsMyAppoinmentScreenState();
}

class _DiagnosticsMyAppoinmentScreenState extends State<DiagnosticsMyAppoinmentScreen> {
  List icons = ["assets/images/video2.png", "assets/images/phone.png", "assets/images/massege.png"];
  List<String> labProfile = ["assets/images/diagnostics_lab.png", "assets/images/female_lab.png", "assets/images/standlab.png"];
  List<String> labName = ["Tested Labs", "Safety Labs", "Diagnostics Wise"];
  List calls = [
    "Hospital-",
    "Home Service",
  ];
  List conditions = ["Accepted", 'In Progress', "Cancel"];
  List colors = [kWatchColor, kStarColor, kBadgeColor];

  List<String> titleList = [
    'Upcoming',
    'Past',
  ];
  String isSelected = 'Upcoming';

  bool isSelect = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Diagnostics",
      appBarVerticalSize: Get.height * 0.12,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: HorizontalList(
                padding: EdgeInsets.zero,
                itemCount: titleList.length,
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = titleList[i];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(color: isSelected == titleList[i] ? Colors.transparent : kMainColor),
                            color: isSelected == titleList[i] ? kMainColor : Colors.white,
                          ),
                          padding: const EdgeInsets.all(10.0),
                          width: 150,
                          child: Text(
                            titleList[i],
                            style: TextStyle(color: isSelected == titleList[i] ? Colors.white : kMainColor, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
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
                          style: TextStyle(fontWeight: FontWeight.w600, color: kSubTitleColor),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: calls.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Card(
                                elevation: 0,
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: kSubTitleColor.withOpacity(0.10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(46),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8), image: const DecorationImage(image: AssetImage('assets/images/diagnostics_lab.png'), fit: BoxFit.fill)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Safety Labs',
                                            style: TextStyle(fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Doctor: ",
                                                style: ksubTitleTextStyle,
                                              ),
                                              Text(
                                                "Dr. Josaiah Toor",
                                                style: ksubTitleTextStyle,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            allDoctors[index].speciality ?? '',
                                            style: TextStyle(fontWeight: FontWeight.w400, color: kMainColor),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "25 May 22 - 10:00 AM",
                                            style: ksubTitleTextStyle,
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: calls[index],
                                                  style: TextStyle(color: kTitleColor),
                                                  children: [
                                                    const WidgetSpan(
                                                        child: SizedBox(
                                                      width: 6,
                                                    )),
                                                    TextSpan(
                                                      text: conditions[index],
                                                      style: TextStyle(color: colors[index]),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ).onTap(() => const DiagnosticsOfflineAppoinmentScreen().launch(context)),
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
                          itemCount: calls.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Card(
                                elevation: 0,
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: kSubTitleColor.withOpacity(0.10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(46),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8), image: const DecorationImage(image: AssetImage('assets/images/diagnostics_lab.png'), fit: BoxFit.fill)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Safety Labs',
                                            style: TextStyle(fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Doctor: ",
                                                style: ksubTitleTextStyle,
                                              ),
                                              Text(
                                                "Dr. Josaiah Toor",
                                                style: ksubTitleTextStyle,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            allDoctors[index].speciality ?? '',
                                            style: TextStyle(fontWeight: FontWeight.w400, color: kMainColor),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "25 May 22 - 10:00 AM",
                                            style: ksubTitleTextStyle,
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: calls[index],
                                                  style: TextStyle(color: kTitleColor),
                                                  children: [
                                                    const WidgetSpan(
                                                        child: SizedBox(
                                                          width: 6,
                                                        )),
                                                    TextSpan(
                                                      text: conditions[index],
                                                      style: TextStyle(color: colors[index]),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ).onTap(() => const DiagnosticsOfflineAppoinmentScreen().launch(context)),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

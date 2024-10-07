import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/screens/profile/history/mt_diag_my_appoinment.dart';
import 'package:kivicare_patient/screens/profile/history/mt_my_prescription_history.dart';
import 'package:kivicare_patient/screens/profile/history/mt_upcoming_ambulance_history.dart';
import 'package:kivicare_patient/screens/profile/history/mt_upcoming_nursing_care_history.dart';
import 'package:nb_utils/nb_utils.dart';



class MyHistoryScreen extends StatelessWidget {
  const MyHistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "History",
      appBarVerticalSize: Get.height * 0.12,
        body: Container(
            decoration: BoxDecoration(
                color: kbigContainerColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                
                  Container(
                    decoration: BoxDecoration(color: kLikeWhiteColor, borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(color: kKedneyBgColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/images/diag-history.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Diagnostic History",
                          style: TextStyle(fontWeight: FontWeight.w500, color: kTitleColor),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: kSubTitleColor,
                          )
                        ),
                      ],
                    ),
                  ).onTap(() =>Get.to(const DiagnosticsMyAppoinmentScreen())),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(color: kLikeWhiteColor, borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(color: kDaigLungsBGColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/images/prescription-history.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Prescription History",
                          style: TextStyle(fontWeight: FontWeight.w500, color: kTitleColor),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: kSubTitleColor,
                          )
                        ),
                      ],
                    ),
                  ).onTap(() => Get.to(const MyPrescriptionHistoryScreen())),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(color: kLikeWhiteColor, borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(color: kLungsBgColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/images/nursing-his.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Nursing Care History",
                          style: TextStyle(fontWeight: FontWeight.w500, color: kTitleColor),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: kSubTitleColor,
                          )
                        ),
                      ],
                    ),
                  ).onTap(() => Get.to(const UpcomingNursingCareHistoryScreen())),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(color: kLikeWhiteColor, borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(color: k15DaysBGColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/images/ambulance-history.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Ambulance History",
                          style: TextStyle(fontWeight: FontWeight.w500, color: kTitleColor),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: kSubTitleColor,
                          )
                        ),
                      ],
                    ),
                  ).onTap(() => Get.to(const UpcomingAmbulanceHistoryScreen())),
                ],
              ),
            )));
  }
}

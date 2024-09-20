import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/screens/auth/profile/history/mt_write_review.dart';
import 'package:nb_utils/nb_utils.dart';


class DiagnosticsOfflineAppoinmentScreen extends StatefulWidget {
  const DiagnosticsOfflineAppoinmentScreen({Key? key}) : super(key: key);

  @override
  State<DiagnosticsOfflineAppoinmentScreen> createState() => _DiagnosticsOfflineAppoinmentScreenState();
}

class _DiagnosticsOfflineAppoinmentScreenState extends State<DiagnosticsOfflineAppoinmentScreen> {
  var index = 0;

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
          "Offline Appointments Details",
          style: ktitleTextStyle,
        ),
      ),
      bottomNavigationBar: Padding(
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
                    borderSide: BorderSide(color: kBadgeColor)),
                text: "Cancel",
                textStyle:
                    TextStyle(color: kBadgeColor, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AppButton(
                elevation: 0,
                enableScaleAnimation: false,
                onTap: () => const WriteReviewScreen().launch(context),
                shapeBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none),
                color: kMainColor,
                text: "Write a Review",
                textStyle: TextStyle(
                    color: kElevatedButtonTextColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide.none),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(46),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/images/diagnostics_lab.png",
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Tested Labs",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "Doctor: ",
                                    style: ksubTitleTextStyle,
                                    children: [
                                  TextSpan(
                                    text: "Dr. Josiah Toor",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kSubTitleColor),
                                  ),
                                ],),),
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
                            RichText(
                                text: TextSpan(
                                    text: "Hospital- ",
                                    style: ksubTitleTextStyle,
                                    children: [
                                  TextSpan(
                                    text: "Accepted",
                                    style: TextStyle(color: kWatchColor),
                                  ),
                                ],),),
                          ],
                        ),
                      ],),),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: context.height(),
              decoration: BoxDecoration(
                  color: kbigContainerColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kWatchColor),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: kLikeWhiteColor, shape: BoxShape.circle),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ImageIcon(
                                  const AssetImage(
                                    "assets/images/covid_diag.png",
                                  ),
                                  color: kWatchColor,
                                ),),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Covid RT PCR",
                            style: TextStyle(
                                color: kLikeWhiteColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageIcon(const AssetImage("assets/images/ic_hospital.png"),
                            color: kSubTitleColor),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Hospital",
                              style: TextStyle(
                                  color: kTitleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              width: context.width() - 100,
                              child: Text(
                                "National Institute of Cancer Research & Hospital",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: kSubTitleColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          IconlyBold.timeCircle,
                          color: kSubTitleColor,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Visit time",
                              style: TextStyle(
                                  color: kTitleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Afternoon",
                              style: TextStyle(
                                color: kSubTitleColor,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Today - 12 July, 2022",
                              style: TextStyle(
                                color: kSubTitleColor,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "01:00 PM",
                              style: TextStyle(
                                color: kMainColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          IconlyBold.profile,
                          color: kSubTitleColor,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Patient information",
                              style: TextStyle(
                                  color: kTitleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Name",
                                  style: ksubTitleTextStyle,
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  ":",
                                  style: ksubTitleTextStyle,
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  "Guy Hawkins",
                                  style: TextStyle(color: kTitleColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Age",
                                  style: ksubTitleTextStyle,
                                ),
                                const SizedBox(
                                  width: 36,
                                ),
                                Text(
                                  ":",
                                  style: ksubTitleTextStyle,
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  "25",
                                  style: TextStyle(color: kTitleColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Gender",
                                  style: ksubTitleTextStyle,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  ":",
                                  style: ksubTitleTextStyle,
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(color: kTitleColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Phone",
                                  style: ksubTitleTextStyle,
                                ),
                                const SizedBox(
                                  width: 22,
                                ),
                                Text(
                                  ":",
                                  style: ksubTitleTextStyle,
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  "01855671645",
                                  style: TextStyle(color: kTitleColor),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
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

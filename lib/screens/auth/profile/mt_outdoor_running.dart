import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';



class OutdoorRunningScreen extends StatefulWidget {
  const OutdoorRunningScreen({Key? key}) : super(key: key);

  @override
  State<OutdoorRunningScreen> createState() => _OutdoorRunningScreenState();
}

class _OutdoorRunningScreenState extends State<OutdoorRunningScreen> {
  List images = [
    "assets/images/outdoor-run.png",
    "assets/images/trademil.png",
    "assets/images/cycle.png",
    "assets/images/outdoor-run.png",
  ];
  List names = [
    "Outdoor Running",
    "Indoor Runing",
    "Cycling",
    "Outdoor Running",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: kLikeWhiteColor,
        elevation: 0,
        leading: BackButton(
          color: kTitleColor,
        ),
        title: Text(
          "Outdoor Running",
          style: ktitleTextStyle,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AppButton(
          text: "Start Running",
          textColor: kLikeWhiteColor,
          elevation: 0,
          color: kMainColor,
          onTap: () {},
          //  padding: EdgeInsets.zero,
          shapeBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(6)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 4.0,
              percent: 0.4,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/run.png",
                    width: 44,
                  ),
                  const Text(
                    "30 Min - 1.0 KM",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Text(
                    "Running",
                    style: TextStyle(color: kSubTitleColor),
                  ),
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: kMainColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
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
                    const Text(
                      "Total 90 Days",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    Text(
                      "You have completed 30 days",
                      style: TextStyle(color: kSubTitleColor),
                    ),
                    Image.asset("assets/images/meter.png"),
                    const Center(
                      child: Text(
                        "00:00:00",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "000.0",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                        ),
                        Text(
                          "KM",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("🔥0000",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "❤0000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

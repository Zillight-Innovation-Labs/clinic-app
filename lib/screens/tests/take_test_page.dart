// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/providers/test_provider.dart';
import 'package:kivicare_patient/screens/tests/bmi/bmi_test.dart';
import 'package:kivicare_patient/screens/tests/bmr/bmr_test.dart';
import 'package:kivicare_patient/screens/tests/body_fat/body_fat_test.dart';
import 'package:kivicare_patient/screens/tests/hydration/hydration_test.dart';
import 'package:kivicare_patient/screens/tests/resting_heart_rate/resting_heart_rate_test.dart';
import 'package:kivicare_patient/screens/tests/sleep/sleep_test.dart';
import 'package:kivicare_patient/screens/tests/whr/whr_test.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class TakeTestPage extends StatefulWidget {
  const TakeTestPage({Key? key}) : super(key: key);

  @override
  State<TakeTestPage> createState() => _TakeTestPageState();
}

class _TakeTestPageState extends State<TakeTestPage> {
  List takeTestData = [
    {
      "testName": "BMI",
      "textDesc": "",
      "testDesc":
          "Body mass index (BMI) is a medical screening tool that measures the ratio of your height to your weight to estimate the amount of body fat you have.",
      "testImg": "assets/images/insomnia.png",
      "route": const BMITestPage(),
      "modalHeight": 0.45,
    },
    {
      "testName": "WHR",
      "textDesc": "",
      "testDesc":
          "The waist–hip ratio or waist-to-hip ratio (WHR) is the dimensionless ratio of the circumference of the waist to that of the hips.",
      "testImg": "assets/icons/depression.png",
      "route": const WHRTestPage(),
      "modalHeight": 0.45,
    },
    {
      "testName": "BMR",
      "textDesc": "",
      "testDesc":
          "Basal Metabolic Rate (BMR) is the number of calories you burn as your body performs basic (basal) life-sustaining function. Commonly also termed as Resting Metabolic Rate (RMR), which is the calories burned if you stayed in bed all day.  In either case, many utilize the basal metabolic rate formula to calculate their body’s metabolism rate.",
      "testImg": "assets/images/depression.png",
      "route": const BMRTestPage(),
      "modalHeight": 0.55,
    },
    {
      "testName": "Body fat",
      "textDesc": "",
      "testDesc":
          "Body fat percentage is defined as the percentage of your body that consists of fat. Everyone has a different body fat distribution, and according to the World Health Organization, measuring body fat is key to assessing whether a person is overweight, obese or at a healthy weight",
      "testImg": "assets/images/psychosis.png",
      "route": const BodyFatTestPage(),
      "modalHeight": 0.55,
    },
    {
      "testName": "Resting Heart Rate",
      "textDesc": "",
      "testDesc":
          "Resting heart rate or pulse, is the number of times your heart beats per minute when you are at rest — such as when you are relaxed, sitting or lying down. Resting heart rate varies from person to person. Knowing yours can give you an important sign of your heart health.",
      "testImg": "assets/images/hostility.png",
      "route": const RestingHeartRateTestPage(),
      "modalHeight": 0.55,
    },
    {
      "testName": "Sleep Quality",
      "textDesc": "",
      "testDesc":
          "The evaluation of an individual's sleep patterns, duration, and characteristics to determine the quality and effectiveness of their sleep",
      "testImg": "assets/images/sensitivity.png",
      "route": const SleepTestPage(),
      "modalHeight": 0.40,
    },
    {
      "testName": "Hydration Levels",
      "textDesc": "",
      "testDesc":
          "The amount of water and electrolytes present in the body, essential for maintaining proper bodily functions",
      "testImg": "assets/images/somatization.png",
      "route": const HydrationTestPage(),
      "modalHeight": 0.40,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final testProvider = context.watch<UserTestProvider>();

    return AppScaffoldNew(
        appBartitleText: "Take Test",
        appBarVerticalSize: Get.height * 0.12,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 180,
                    crossAxisSpacing: 30,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: takeTestData.length,
                  itemBuilder: (context, index) {
                    final data = takeTestData[index];

                    return TakeTestCard(
                        testProvider: testProvider,
                        testName: data["testName"],
                        testImg: data["testImg"],
                        testDesc: data["testDesc"],
                        route: data["route"],
                        modalHeight: MediaQuery.of(context).size.height *
                            data["modalHeight"],
                        textDesc: data['textDesc']);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class TakeTestCard extends StatelessWidget {
  final String testName;
  final String testImg;
  final String testDesc;
  final String textDesc;
  final double modalHeight;
  final dynamic route;
  const TakeTestCard({
    Key? key,
    required this.testName,
    required this.testImg,
    required this.testDesc,
    required this.textDesc,
    required this.modalHeight,
    required this.route,
    required this.testProvider,
  }) : super(key: key);

  final UserTestProvider testProvider;

  @override
  Widget build(BuildContext context) {
    return typeOfTestCard(
      testType: testName,
      image: testImg,
      // image: "assets/images/paranoia.png",
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          builder: (BuildContext context) {
            return Container(
              height: modalHeight,
              // height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          testName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              testProvider.clearTestData();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: buttonColor),
                            child: const Icon(
                              Icons.close,
                            ))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          // ignore: unnecessary_string_interpolations
                          "$testDesc",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    AppButton(
                      width: Get.width,
                      text: "Take Test",
                      color: appColorPrimary,
                      textStyle: appButtonTextStyleWhite,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: radius(
                          defaultAppButtonRadius / 2,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => route));
                        testProvider.clearTestData();
                      },
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

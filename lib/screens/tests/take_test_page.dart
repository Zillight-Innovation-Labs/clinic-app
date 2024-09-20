// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/providers/test_provider.dart';
import 'package:kivicare_patient/screens/tests/addiction/addiction_questionnaire.dart';
import 'package:kivicare_patient/screens/tests/insomnia/insomnia_questionnaire.dart';
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
      "testName": "Insomnia",
      "textDesc": "",
      "testDesc":
          "Insomnia is a common sleep disorder characterized by difficulty falling asleep, staying asleep, or experiencing poor quality sleep. It can significantly impact your overall well-being and daily functioning. If you suspect you may be experiencing insomnia, it’s essential to understand its symptoms and potential causes.",
      "testImg": "assets/images/insomnia.png",
      "route": const InsomniaTestQuestionnaire(),
      "modalHeight": 0.75,
    },
    {
      "testName": "Addiction",
      "textDesc": "",
      "testDesc":
          "Whether it is food, television, internet, gaming, social media, cola drink, alcohol, substance abuse, sex or overspending; do you wonder if your behavior is crossing the line into addiction?\nAddiction is a persistent desire or unsuccessful efforts to stop, reduce or control those behavior.",
      "testImg": "assets/images/addiction.png",
      "route": const AddictionTestQuestionnaire(),
      "modalHeight": 0.75,
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
                  "Test your mental health today to take control of your health.",
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
                      color: appColorSecondary,
                      textStyle: appButtonTextStyleWhite,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: radius(
                          defaultAppButtonRadius / 2,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(route);
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

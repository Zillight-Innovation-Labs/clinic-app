import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/utils/colors.dart';

class BMRTestResult extends StatelessWidget {
  final int testScore;
  const BMRTestResult({
    Key? key,
    required this.testScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "BMR Result",
      appBarVerticalSize: Get.height * 0.12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Interpretation:',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff5F5F5F),
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 3,
            ),
            RichText(
              text: TextSpan(
                text: 'Your Basal Metabolic Rate is (BMR) ',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  height: 1.5,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: testScore.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: appColorPrimary,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  const TextSpan(
                    text:
                        ' This is the number of calories your body burns at rest to maintain normal bodily functions. Use this information to tailor your daily calorie intake ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

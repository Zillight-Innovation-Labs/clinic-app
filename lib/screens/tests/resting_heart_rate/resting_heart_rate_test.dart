import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcelerate/components/app_scaffold.dart';
import 'package:healthcelerate/providers/test_provider.dart';
import 'package:healthcelerate/screens/tests/bmi/bmi_test_result.dart';
import 'package:healthcelerate/screens/tests/resting_heart_rate/resting_heart_rate_result.dart';
import 'package:healthcelerate/utils/colors.dart';
import 'package:healthcelerate/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

class RestingHeartRateTestPage extends StatefulWidget {
  const RestingHeartRateTestPage({super.key});

  @override
  RestingHeartRateTestPageState createState() =>
      RestingHeartRateTestPageState();
}

class RestingHeartRateTestPageState extends State<RestingHeartRateTestPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController heartBeatsController = TextEditingController();

  FocusNode weightFocus = FocusNode();

  double calculateHearthBeat(double beats) {
    if (beats <= 0) {
      throw ArgumentError("hearthbeats must be greater than zero.");
    }
    final double result = beats * 2;

    dev.log("result:$result");
    return result;
  }

  @override
  void dispose() {
    heartBeatsController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Resting Heart Rate Test",
      appBarVerticalSize: Get.height * 0.12,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Input your detail in the field below",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 70),
                AppTextField(
                  title: "Number of heartbeats in 60 seconds",
                  textStyle: primaryTextStyle(size: 12),
                  controller: heartBeatsController,
                  focus: weightFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "No. of heartbeats",
                  ),
                  validator: validateFullName,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: AppButton(
                    width: Get.width,
                    text: "Next",
                    color: appColorPrimary,
                    textStyle: appButtonTextStyleWhite,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: radius(defaultAppButtonRadius / 2)),
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        final double result = calculateHearthBeat(
                          double.parse(heartBeatsController.text),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestingHeartrateTestResult(
                              testScore: result,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

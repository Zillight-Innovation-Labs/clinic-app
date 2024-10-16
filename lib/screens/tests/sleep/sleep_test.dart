import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/providers/test_provider.dart';
import 'package:kivicare_patient/screens/tests/bmi/bmi_test_result.dart';
import 'package:kivicare_patient/screens/tests/sleep/sleep_test_result.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

class SleepTestPage extends StatefulWidget {
  const SleepTestPage({super.key});

  @override
  SleepTestPageState createState() => SleepTestPageState();
}

class SleepTestPageState extends State<SleepTestPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController sleepTimeController = TextEditingController();
  final TextEditingController wakeUpTimesController = TextEditingController();

  FocusNode totalSleepFocus = FocusNode();
  FocusNode wakeUpTimesFocus = FocusNode();

  double sleepQuality = 0.0;

  @override
  void dispose() {
    wakeUpTimesController.dispose;
    sleepTimeController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Sleep Quality Test",
      appBarVerticalSize: Get.height * 0.12,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Complete the input field below",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                AppTextField(
                  title: "Total sleep time (in hours)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: sleepTimeController,
                  focus: totalSleepFocus,
                  nextFocus: wakeUpTimesFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "Total sleep time ",
                  ),
                  validator: validateFullName,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  title: "Number of times woke up during the night",
                  textStyle: primaryTextStyle(size: 12),
                  controller: wakeUpTimesController,
                  focus: wakeUpTimesFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "No. of times",
                  ),
                  validator: validateFullName,
                ),
                const SizedBox(height: 20),
                Text(
                  "Sleep quality (${sleepQuality.toInt()})",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Slider(
                  min: 0.0,
                  max: 5.0,
                  value: sleepQuality,
                  onChanged: (value) {
                    setState(() {
                      sleepQuality = value;
                    });
                  },
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SleepTestResult(
                              sleepDuration:
                                  int.parse(sleepTimeController.text),
                              frequentWakeUp:
                                  int.parse(wakeUpTimesController.text),
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

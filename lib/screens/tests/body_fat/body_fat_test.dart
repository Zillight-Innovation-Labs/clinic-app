import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcelerate/components/app_scaffold.dart';
import 'package:healthcelerate/components/toggle_yes_no.dart';
import 'package:healthcelerate/screens/tests/body_fat/body_fat_result.dart';
import 'package:healthcelerate/utils/colors.dart';
import 'package:healthcelerate/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;
import 'dart:math' as math; // Required for log10 calculations

class BodyFatTestPage extends StatefulWidget {
  const BodyFatTestPage({super.key});

  @override
  BodyFatTestPageState createState() => BodyFatTestPageState();
}

class BodyFatTestPageState extends State<BodyFatTestPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController waistController = TextEditingController();
  final TextEditingController neckController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController hipController = TextEditingController();
  String gender = '';

  FocusNode waistFocus = FocusNode();
  FocusNode heightFocus = FocusNode();
  FocusNode neckFocus = FocusNode();
  FocusNode hipFocus = FocusNode();

  double log10(num x) {
    return math.log(x) / math.ln10;
  }

  double calculateBodyFat({
    required double waist,
    required double neck,
    required double height,
    double? hip, // Only required for women
    required String gender,
  }) {
    if (waist <= 0 || neck <= 0 || height <= 0) {
      throw ArgumentError(
          "Waist, neck, and height measurements must be greater than zero.");
    }

    if (gender.toLowerCase() == "male") {
      // U.S. Navy formula for men
      return 86.010 * log10(waist - neck) - 70.041 * log10(height) + 36.76;
    } else if (gender.toLowerCase() == "female") {
      if (hip == null || hip <= 0) {
        throw ArgumentError(
            "Hip measurement must be provided and greater than zero for women.");
      }
      // U.S. Navy formula for women
      return 163.205 * log10(waist + hip - neck) -
          97.684 * log10(height) -
          78.387;
    } else {
      throw ArgumentError("Invalid gender. Use 'male' or 'female'.");
    }
  }

  @override
  void dispose() {
    heightController.dispose;
    waistController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Body Fat Test",
      appBarVerticalSize: Get.height * 0.12,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
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
                const SizedBox(height: 30),
                AppTextField(
                  title: "Waist circumference (cm)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: waistController,
                  focus: waistFocus,
                  nextFocus: heightFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "Waist",
                  ),
                  validator: validateFullName,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  title: "Height (cm)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: heightController,
                  focus: heightFocus,
                  nextFocus: neckFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "Height",
                  ),
                  validator: validateFullName,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  title: "Neck circumference (cm)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: neckController,
                  focus: neckFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "Neck",
                  ),
                  validator: validateFullName,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Gender",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                ToogleYesNo(
                  onchanged: (val) {
                    setState(() {
                      gender = val;
                    });
                    dev.log("gender:$gender");
                  },
                ),
                const SizedBox(height: 20),
                if (gender == "Female")
                  AppTextField(
                    title: "Hip circumference (cm)",
                    textStyle: primaryTextStyle(size: 12),
                    controller: hipController,
                    textFieldType: TextFieldType.NUMBER,
                    decoration: inputDecoration(
                      context,
                      fillColor: context.cardColor,
                      filled: true,
                      hintText: "Hip",
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
                        double hip = 0;
                        if (gender == '') {
                          toast("Gender is required");
                          return;
                        }
                        if (gender == 'Female') {
                          hip = double.parse(hipController.text);
                        } else {
                          hip = 0;
                        }
                        final double result = calculateBodyFat(
                            waist: double.parse(waistController.text),
                            height: double.parse(heightController.text),
                            hip: hip,
                            neck: double.parse(neckController.text),
                            gender: gender);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BodyFatTestResult(
                                testScore: result, gender: gender),
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

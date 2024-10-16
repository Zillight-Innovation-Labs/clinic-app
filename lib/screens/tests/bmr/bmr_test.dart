import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/components/toggle_yes_no.dart';
import 'package:kivicare_patient/screens/tests/bmr/bmr_test_result.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

class BMRTestPage extends StatefulWidget {
  const BMRTestPage({super.key});

  @override
  BMRTestPageState createState() => BMRTestPageState();
}

class BMRTestPageState extends State<BMRTestPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String gender = '';

  FocusNode weightFocus = FocusNode();
  FocusNode heightFocus = FocusNode();
  FocusNode ageFocus = FocusNode();
  //Waist circumference (cm) / Hip circumference (cm)

  double calculateWHR(double waist, double hip) {
    if (hip <= 0) {
      throw ArgumentError("value must be greater than zero.");
    }
    final double result = waist / (hip);

    dev.log("result:$result");
    return result;
  }

  double calculateBMR(
      {required double weight,
      required double height,
      required int age,
      required String gender}) {
    if (weight <= 0 || height <= 0 || age <= 0) {
      throw ArgumentError("Weight, height, and age must be greater than zero.");
    }

    if (gender.toLowerCase() == "male") {
      return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else if (gender.toLowerCase() == "female") {
      return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    } else {
      throw ArgumentError("Invalid gender. Use 'male' or 'female'.");
    }
  }

  @override
  void dispose() {
    heightController.dispose;
    weightController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "BMR Test",
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
                  title: "Weight kilograms (kg)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: weightController,
                  focus: weightFocus,
                  nextFocus: heightFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "weight",
                  ),
                  validator: validateFullName,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  title: "Height meters (m)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: heightController,
                  focus: heightFocus,
                  nextFocus: ageFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "height",
                  ),
                  validator: validateFullName,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  title: "Age",
                  textStyle: primaryTextStyle(size: 12),
                  controller: ageController,
                  focus: ageFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "age",
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
                      borderRadius: radius(defaultAppButtonRadius / 2),
                    ),
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        final double result = calculateBMR(
                            weight: double.parse(weightController.text),
                            height: double.parse(heightController.text),
                            age: ageController.text.toInt(),
                            gender: gender);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BMRTestResult(
                              testScore: result.toInt(),
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

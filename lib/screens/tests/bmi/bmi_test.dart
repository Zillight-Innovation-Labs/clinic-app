import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/providers/test_provider.dart';
import 'package:kivicare_patient/screens/tests/bmi/bmi_test_result.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

class BMITestPage extends StatefulWidget {
  const BMITestPage({super.key});

  @override
  BMITestPageState createState() => BMITestPageState();
}

class BMITestPageState extends State<BMITestPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  FocusNode weightFocus = FocusNode();
  FocusNode heightFocus = FocusNode();

  double calculateBMI(double weight, double height) {
    if (height <= 0) {
      throw ArgumentError("Height must be greater than zero.");
    }
    final double result = weight / (height * height);

    dev.log("result:$result");
    return result;
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
      appBartitleText: "BMI Test",
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
                  "Complete the input field below",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 70),
                AppTextField(
                  title: "Weight(kilograms)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: weightController,
                  focus: weightFocus,
                  nextFocus: heightFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "Weight",
                  ),
                  validator: validateFullName,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  title: "Height(meters)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: heightController,
                  focus: heightFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "Height",
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
                        final double result = calculateBMI(
                          double.parse(weightController.text),
                          double.parse(heightController.text),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BMITestResult(
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcelerate/components/app_scaffold.dart';
import 'package:healthcelerate/components/toggle_yes_no.dart';
import 'package:healthcelerate/screens/tests/bmi/bmi_test_result.dart';
import 'package:healthcelerate/screens/tests/whr/whr_test_result.dart';
import 'package:healthcelerate/utils/colors.dart';
import 'package:healthcelerate/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

class WHRTestPage extends StatefulWidget {
  const WHRTestPage({super.key});

  @override
  WHRTestPageState createState() => WHRTestPageState();
}

class WHRTestPageState extends State<WHRTestPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String gender = '';

  FocusNode waistFocus = FocusNode();
  FocusNode hipFocus = FocusNode();
  //Waist circumference (cm) / Hip circumference (cm)

  double calculateWHR(double waist, double hip) {
    if (hip <= 0) {
      throw ArgumentError("value must be greater than zero.");
    }
    final double result = waist / (hip);

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
      appBartitleText: "WHR Test",
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
                  title: "Waist circumference (cm)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: weightController,
                  focus: waistFocus,
                  nextFocus: hipFocus,
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
                  title: "Hip circumference (cm)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: heightController,
                  focus: hipFocus,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "Hip",
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
                        borderRadius: radius(defaultAppButtonRadius / 2)),
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        if (gender == '') {
                          toast("Gender is required");
                          return;
                        }
                        final double result = calculateWHR(
                          double.parse(weightController.text),
                          double.parse(heightController.text),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WHRTestResult(
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

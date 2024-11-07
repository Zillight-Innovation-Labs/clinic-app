import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcelerate/components/app_scaffold.dart';
import 'package:healthcelerate/components/toggle_yes_no.dart';
import 'package:healthcelerate/screens/tests/hydration/hydration_test_result.dart';
import 'package:healthcelerate/utils/colors.dart';
import 'package:healthcelerate/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

class HydrationTestPage extends StatefulWidget {
  const HydrationTestPage({super.key});

  @override
  HydrationTestPageState createState() => HydrationTestPageState();
}

class HydrationTestPageState extends State<HydrationTestPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController waterController = TextEditingController();
  String gender = '';

  @override
  void dispose() {
    waterController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Hydration Level Test",
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
                  title: "Total water intake (liters)",
                  textStyle: primaryTextStyle(size: 12),
                  controller: waterController,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: inputDecoration(
                    context,
                    fillColor: context.cardColor,
                    filled: true,
                    hintText: "water intake",
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

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HydrationTestResult(
                                testScore: waterController.text.toDouble(),
                                gender: gender),
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

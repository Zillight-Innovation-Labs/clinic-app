import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';

class WHRTestResult extends StatefulWidget {
  final double testScore;
  final String gender;
  const WHRTestResult({
    Key? key,
    required this.testScore,
    required this.gender,
  }) : super(key: key);

  @override
  State<WHRTestResult> createState() => _WHRTestResultState();
}

class _WHRTestResultState extends State<WHRTestResult> {
  void calResult(double testScore) {
    if (testScore <= 0.80 || testScore <= 0.90) {}
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "WHR Result",
      appBarVerticalSize: Get.height * 0.12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Card(
                child: Container(
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      const Text(
                        'Interpretation:',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff5F5F5F),
                            fontWeight: FontWeight.w700),
                      ),
                      if (widget.gender == "Male") ...[
                        Text(
                          widget.testScore <= 0.90
                              ? "Low Risk (Healthy)"
                              : widget.testScore <= (0.99)
                                  ? "Moderate Risk"
                                  : "High Risk",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            height: 1.5,
                          ),
                        ),
                      ] else ...[
                        Text(
                          widget.testScore <= 0.80
                              ? "Low Risk (Healthy)"
                              : widget.testScore <= (0.89)
                                  ? "Moderate Risk"
                                  : "High Risk",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Card(
                child: Container(
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      const Text(
                        'Recomendation ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff5F5F5F),
                            fontWeight: FontWeight.w700),
                      ),
                      if (widget.gender == "Male") ...[
                        Text(
                          widget.testScore <= 0.90
                              ? "Your Waist-to-Hip Ratio indicates a low risk for cardiovascular diseases. Keep maintaining a healthy lifestyle!"
                              : widget.testScore <= (0.99)
                                  ? "Your Waist-to-Hip Ratio indicates a moderate risk for cardiovascular diseases. Consider making lifestyle changes, such as a balanced diet and regular exercise."
                                  : "Your Waist-to-Hip Ratio indicates a high risk for cardiovascular diseases. It's advisable to consult a healthcare provider for personalized advice",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            height: 1.5,
                          ),
                        ),
                      ] else ...[
                        Text(
                          widget.testScore <= 0.80
                              ? "Your Waist-to-Hip Ratio indicates a low risk for cardiovascular diseases. Keep maintaining a healthy lifestyle!"
                              : widget.testScore <= (0.89)
                                  ? "Your Waist-to-Hip Ratio indicates a moderate risk for cardiovascular diseases. Consider making lifestyle changes, such as a balanced diet and regular exercise."
                                  : "Your Waist-to-Hip Ratio indicates a high risk for cardiovascular diseases. It's advisable to consult a healthcare provider for personalized advice",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

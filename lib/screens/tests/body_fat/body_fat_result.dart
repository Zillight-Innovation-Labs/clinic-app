import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';

class BodyFatTestResult extends StatefulWidget {
  final double testScore;
  final String gender;
  const BodyFatTestResult({
    Key? key,
    required this.testScore,
    required this.gender,
  }) : super(key: key);

  @override
  State<BodyFatTestResult> createState() => _BodyFatTestResultState();
}

class _BodyFatTestResultState extends State<BodyFatTestResult> {
  void calResult(double testScore) {
    if (testScore <= 0.80 || testScore <= 0.90) {}
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Body Fat Result",
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
                          widget.testScore <= 5
                              ? "Low Body Fat"
                              : widget.testScore <= (24)
                                  ? "Healthy Body Fat"
                                  : "High Body Fat",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            height: 1.5,
                          ),
                        ),
                      ] else ...[
                        Text(
                          widget.testScore <= 13
                              ? "Low Body Fat"
                              : widget.testScore <= (31)
                                  ? "Healthy Body Fat"
                                  : "High Body Fat",
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
                        'Recomendation: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff5F5F5F),
                            fontWeight: FontWeight.w700),
                      ),
                      if (widget.gender == "Male") ...[
                        Text(
                          widget.testScore <= 5
                              ? "Your body fat percentage is below the recommended range. Low body fat levels can be unhealthy. Please consult a healthcare provider."
                              : widget.testScore <= (24)
                                  ? "Your body fat percentage is within the recommended range for your gender. Keep up the healthy habits!"
                                  : "Your body fat percentage is above the recommended range. High body fat can lead to health complications. Please consider lifestyle changes and consult a healthcare provider",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            height: 1.5,
                          ),
                        ),
                      ] else ...[
                        Text(
                          widget.testScore <= 13
                              ? "Your body fat percentage is below the recommended range. Low body fat levels can be unhealthy. Please consult a healthcare provider.t"
                              : widget.testScore <= (31)
                                  ? "Your body fat percentage is below the recommended range. Low body fat levels can be unhealthy. Please consult a healthcare provider."
                                  : "Your body fat percentage is above the recommended range. High body fat can lead to health complications. Please consider lifestyle changes and consult a healthcare provider",
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

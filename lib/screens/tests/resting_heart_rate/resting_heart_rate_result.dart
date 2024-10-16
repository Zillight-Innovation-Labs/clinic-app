import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';

class RestingHeartrateTestResult extends StatelessWidget {
  final double testScore;
  const RestingHeartrateTestResult({
    Key? key,
    required this.testScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Resting Heart Rate Result",
      appBarVerticalSize: Get.height * 0.12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text(
                testScore <= 60
                    ? "Low Range (Bradycardia)"
                    : testScore <= (100)
                        ? "Normal Range"
                        : "High Range (Tachycardia)",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Recomendation:',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.w700),
              ),
              Text(
                testScore <= 60
                    ? "Your Resting Heart Rate is lower than the normal range. This could indicate bradycardia. Please consult a healthcare provider if you experience dizziness or fatigue"
                    : testScore <= (100)
                        ? "Your Resting Heart Rate is within the normal range. Great job maintaining a healthy heart!"
                        : "Your Resting Heart Rate is higher than the normal range. This could indicate tachycardia. Please consult a healthcare provider",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

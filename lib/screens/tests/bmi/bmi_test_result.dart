import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';

class BMITestResult extends StatelessWidget {
  final double testScore;
  const BMITestResult({
    Key? key,
    required this.testScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "BMI Result",
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
                testScore <= 18.8
                    ? "Underweight"
                    : testScore <= (24.9)
                        ? "Normal weight"
                        : testScore <= (24.9)
                            ? "Overweight"
                            : "Obesity",
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
                testScore <= 18.8
                    ? "Your BMI indicates that you are underweight. Consider consulting a healthcare provider for advice on achieving a healthier weight."
                    : testScore <= (24.9)
                        ? "Great! Your BMI is within the normal range. Keep maintaining a healthy lifestyle."
                        : testScore <= (24.9)
                            ? "Your BMI indicates that you are overweight. It’s important to adopt a balanced diet and regular exercise. Consider seeking advice from a healthcare provider."
                            : "Your BMI indicates obesity. It's important to consult a healthcare provider for personalized advice on managing your weight.",
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

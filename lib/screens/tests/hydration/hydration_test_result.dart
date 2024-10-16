import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';

class HydrationTestResult extends StatefulWidget {
  final double testScore;
  final String gender;
  const HydrationTestResult({
    Key? key,
    required this.testScore,
    required this.gender,
  }) : super(key: key);

  @override
  State<HydrationTestResult> createState() => _HydrationTestResultState();
}

class _HydrationTestResultState extends State<HydrationTestResult> {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Hydration Level Result",
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
              if (widget.gender == "Male") ...[
                Text(
                  widget.testScore >= 3.7 ? "Well Hydrated" : "Under Hydrated",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
              ] else ...[
                Text(
                  widget.testScore >= 2.7 ? "Well Hydrated" : "Under Hydrated",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
              ],
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Recomendation ',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.w700),
              ),
              if (widget.gender == "Male") ...[
                Text(
                  widget.testScore >= 2.7
                      ? "Great job! Your water intake is in line with the recommended daily amount. Stay hydrated!"
                      : "Your water intake is below the recommended amount. Dehydration can lead to fatigue and other health issues. Make sure you drink enough water throughout the day",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
              ] else ...[
                Text(
                  widget.testScore >= 2.7
                      ? "Great job! Your water intake is in line with the recommended daily amount. Stay hydrated!"
                      : "Your water intake is below the recommended amount. Dehydration can lead to fatigue and other health issues. Make sure you drink enough water throughout the day",
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
    );
  }
}

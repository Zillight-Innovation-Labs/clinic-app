import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';

class SleepTestResult extends StatefulWidget {
  final int sleepDuration;
  final int frequentWakeUp;
  const SleepTestResult({
    Key? key,
    required this.sleepDuration,
    required this.frequentWakeUp,
  }) : super(key: key);

  @override
  State<SleepTestResult> createState() => _SleepTestResultState();
}

class _SleepTestResultState extends State<SleepTestResult> {
  String sleepOutput = '';
  String sleepOutputDesc = '';

  void getSleep() {
    if (_isGoodSleep()) {
      _setSleepOutput(
        'Good Sleep',
        'You’re getting the right amount of sleep and minimal disturbances. Keep up with your good sleep habits!',
      );
    } else if (widget.frequentWakeUp > 2) {
      _setSleepOutput(
        'Disturbed Sleep',
        'You reported frequent waking during the night. Consider improving your sleep environment or routine.',
      );
    } else if (widget.sleepDuration <= 6 && widget.frequentWakeUp <= 5) {
      _setSleepOutput(
        'Insufficient Sleep',
        'You are not getting enough sleep. This may lead to fatigue, reduced concentration, and other health issues. Aim for at least 7–9 hours per night.',
      );
    }
  }

  bool _isGoodSleep() {
    return widget.sleepDuration >= 7 && widget.frequentWakeUp <= 2;
  }

  void _setSleepOutput(String output, String description) {
    sleepOutput = output;
    sleepOutputDesc = description;
  }

  @override
  void initState() {
    getSleep();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Sleep Quality Result",
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
                sleepOutput,
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
                sleepOutputDesc,
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

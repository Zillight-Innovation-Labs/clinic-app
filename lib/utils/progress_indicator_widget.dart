import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double totalSteps;
  final double currentStep;
  final double stepPaddingDigit;

  const ProgressIndicatorWidget({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.stepPaddingDigit = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double stepsPadding = 80;
    double stepsSpacing = 5;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: stepsPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < totalSteps; i++)
                _LinearProgressIndicator(
                  value: () {
                    int index = i + 1;
                    if (index == currentStep) {
                      return 1.0;
                    } else if (index < currentStep) {
                      return 1.0;
                    } else {
                      return 0.0;
                    }
                  }(),
                  width: ((MediaQuery.of(context).size.width - stepsPadding) /
                          totalSteps) -
                      (stepsSpacing * stepPaddingDigit),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LinearProgressIndicator extends StatelessWidget {
  final double value;
  final double width;

  const _LinearProgressIndicator({
    Key? key,
    required this.value,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: width,
            decoration: BoxDecoration(
              color: const Color(0xff91D9DE),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: width * value,
            decoration: BoxDecoration(
              color: const Color(0xff1F867D),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}

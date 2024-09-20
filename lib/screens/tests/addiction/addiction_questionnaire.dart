import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kivicare_patient/providers/test_provider.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:kivicare_patient/utils/progress_indicator_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';

List<String> testQuestion = [
  "Do you have a pattern of failing to resist impulse?",
  "Do you frequently engage in those behaviors to a greater extent?",
  "Do you have persistent desire or unsuccessful effort to stop?",
  "Do you spend inordinate amount of time in obtaining the object of addiction?",
];

class AddictionTestQuestionnaire extends StatefulWidget {
  const AddictionTestQuestionnaire({super.key});

  @override
  AddictionTestQuestionnaireState createState() =>
      AddictionTestQuestionnaireState();
}

class AddictionTestQuestionnaireState
    extends State<AddictionTestQuestionnaire> {
  final PageController _pageController = PageController();

  dynamic testQtnOne;

  int? selectedIndex;

  var selectedPage = 1;

  _increaseCount() {
    setState(() {
      selectedPage++;
    });
  }

  _decreaseCount() {
    setState(() {
      selectedPage--;
    });
  }

  bool isFirst = true;
  bool isLast = false;
  bool isOptionSelected = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        isFirst = _pageController.page == 0;
        isLast = _pageController.page == testQuestion.length - 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserTestProvider>();

    void updateUserInput(testQtnOne) {
      Map<String, dynamic> newResponses = {
        "$selectedPage": testQtnOne,
      };

      provider.updateTestInput(newResponses);
    }

    return Scaffold(
      appBar: customAppBar(
        onTapped: () {
          if (provider.currentStep == 1) {
            Navigator.pop(context);
          } else {
            setState(() {
              provider.currentStep = provider.currentStep - 1;
            });
            _decreaseCount();

            _pageController.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        headerText: 'Addiction Test',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ProgressIndicatorWidget(
              totalSteps: provider.totalSteps = 10,
              currentStep: provider.currentStep,
              stepPaddingDigit: 2.5,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: testQuestion.length,
                itemBuilder: (context, index) {
                  final data = testQuestion[index];
                  return Column(
                    children: [
                      Text(
                        data,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 80),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.testOptionOne.length,
                            itemBuilder: (context, index) {
                              final testQtn = provider.testOptionOne[index];

                              return Padding(
                                padding: const EdgeInsets.all(8.0).copyWith(
                                    right: testQtn["id"] == "0" ? 25 : 0),
                                child: optionCard(
                                    imagePath: testQtn["imagePath"],
                                    text: testQtn["name"],
                                    borderColor: selectedIndex == index
                                        ? secondaryColor
                                        : borderColor,
                                    elevation: 1,
                                    borderWidth: selectedIndex == index ? 2 : 1,
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        testQtnOne = testQtn["boolean"];
                                        isOptionSelected = true;
                                      });
                                      updateUserInput(testQtnOne);
                                    }),
                              );
                            }),
                      ), //
                      //
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AppButton(
                width: Get.width,
                text: isLast ? "Done" : "Next",
                color: isOptionSelected
                    ? appColorSecondary
                    : appColorSecondary.withOpacity(0.5),
                textStyle: appButtonTextStyleWhite,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: radius(defaultAppButtonRadius / 2)),
                onTap: () {
                  if (isOptionSelected) {
                    if (isLast) {
                      // provider.addTest(provider.addictionTestId, context);
                    }
                    _increaseCount();
                    provider.currentStep++;
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      isOptionSelected = false;
                      selectedIndex = null;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

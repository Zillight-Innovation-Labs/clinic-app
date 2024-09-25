import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/providers/bottom_nav_provider.dart';
import 'package:kivicare_patient/providers/test_provider.dart';
import 'package:kivicare_patient/screens/home/home_bottom_tabs.dart';
import 'package:kivicare_patient/utils/common_base.dart';

import 'package:provider/provider.dart';


class InsomniaTestResult extends StatelessWidget {
  final dynamic testScore;
  const InsomniaTestResult({
    Key? key,
    required this.testScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserTestProvider>();
       // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        context.read<BottomNavProvider>().setNavbarIndex(1);
        Get.to(()=> const HomeBottomNavBarScreen());

        return false;
      },
      child: Scaffold(
        appBar: customAppBar(
          headerText: 'Insomnia Test Result',
          context: context,
          onTapped: () {
            context.read<BottomNavProvider>().setNavbarIndex(1);
          Get.to(()=>const HomeBottomNavBarScreen());
          },
        ),
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
                  'Interpretation of total scores:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff5F5F5F),
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  testScore <= 25 ? "No sign of insomnia" : "Sign of insomnia",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  testScore <= 25
                      ? "However, here are some recommended lifestyle modifications to improve your sleep:"
                      : "Seek the advice of a mental health professional for proper treatment. Other recommended lifestyle modifications to improve your sleep:",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Recomendation:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff5F5F5F),
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    testScore <= 25
                        ? showCommets(
                            provider.insomniaTestCommentOne)
                        : showCommets(
                            provider.insomniaTestCommentTwo),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                // const ConsultTherapyCard(),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

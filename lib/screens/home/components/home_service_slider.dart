import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/screens/service/components/service_card.dart';
import 'package:kivicare_patient/screens/service/event_outreach_service.dart';
import 'package:kivicare_patient/screens/service/personalized_self_service.dart';
import 'package:kivicare_patient/screens/service/personalized_senior_service.dart';
import 'package:kivicare_patient/screens/service/service_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kivicare_patient/utils/colors.dart';

import '../home_controller.dart';

class HomeServiceSlider extends StatefulWidget {
  HomeServiceSlider({super.key});

  @override
  State<HomeServiceSlider> createState() => _HomeServiceSliderState();
}

class _HomeServiceSliderState extends State<HomeServiceSlider> {
  final HomeController homeScreenController = Get.find();

  int sliderCurrentPage = 0;

  final PageController sliderPageController = PageController();

  @override
  void dispose() {
    sliderPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 190,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PageView.builder(
              controller: sliderPageController,
              onPageChanged: (int page) {
                setState(() {
                  sliderCurrentPage = page;
                });
              },
              itemCount: servicePages.length,
              itemBuilder: (context, index) {
                return ServiceCard(
                  title: servicePages[index]['title'],
                  desc: servicePages[index]['desc'],
                  img: servicePages[index]['image'],
                  onTap: () {
                    Get.to(servicePages[index]['page']);
                  },
                  color: servicePages[index]['color'],
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.generate(
                  servicePages.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        sliderPageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Container(
                        height: 6,
                        width: sliderCurrentPage == index ? 20 : 10,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: white),
                          color: sliderCurrentPage == index
                              ? appColorPrimary
                              : appColorPrimary.withOpacity(0.5),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> servicePages = [
  {
    "title": "Personal Healthcare Management",
    "desc":
        "Get a comprehensive health plan for\nyourself and your family. Your health,\nyour future, secured.",
    'image': "assets/images/personalizeImg.png",
    "color": serviceCardOne,
    "page": const PersonalizedHomeCareService()
  },
  {
    "title": "Personalized Home Care for Seniors",
    "desc":
        "Your parents cared for you, now it's\ntime to return the favor. Secure\ntheir health with the best coverage.",
    'image': "assets/images/seniorImg.png",
    "color": serviceCardTwo,
    "page": const PersonalizedHomeCareForSeniorService()
  },
  {
    "title": "Event and Outreach Health Services",
    "desc":
        "Check your health condition regularly\nto minimize the incidence of disease\nin the future.",
    'image': "assets/images/eventImg.png",
    "color": serviceCardThree,
    "page": const EventOutreachService()
  },
];

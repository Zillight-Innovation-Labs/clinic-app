import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/screens/service/components/service_card.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kivicare_patient/utils/colors.dart';

import '../../../components/cached_image_widget.dart';
import '../home_controller.dart';

class SliderComponent extends StatefulWidget {
  SliderComponent({super.key});

  @override
  State<SliderComponent> createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
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
    if (homeScreenController.dashboardData.value.slider.isEmpty) {
      return const Offstage();
    }

    return SizedBox(
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
            itemCount: homeSliderPages.length,
            itemBuilder: (context, index) {
              return ServiceCard(
                hasButton: false,
                title: homeSliderPages[index]['title'],
                desc: homeSliderPages[index]['desc'],
                img: homeSliderPages[index]['image'],
                onTap: () {},
                color: homeSliderPages[index]['color'],
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
                homeSliderPages.length,
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
                            ? homeCardOne
                            : homeCardOne.withOpacity(0.5),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> homeSliderPages = [
  {
    "title": "Online Hospital",
    "desc":
        "Yorem ipsum dolor sit amet, consectetur\nadipiscing elit. Nunc vulputate libero et\nvelit interdum, ac aliquet odio mattis.",
    'image': "assets/images/nurseImg.png",
    "color": homeCardOne,
  },
  {
    "title": "Online Hospital",
    "desc":
        "YYorem ipsum dolor sit amet, consectetur\nadipiscing elit. Nunc vulputate libero et\nvelit interdum, ac aliquet odio mattis.",
    'image': "assets/images/dr_joshia.png",
    "color": homeCardOne,
  },
  {
    "title": "Online Hospital",
    "desc":
        "YYorem ipsum dolor sit amet, consectetur\nadipiscing elit. Nunc vulputate libero et\nvelit interdum, ac aliquet odio mattis.",
    'image': "assets/images/dr_allenda.png",
    "color": homeCardOne,
  },
];

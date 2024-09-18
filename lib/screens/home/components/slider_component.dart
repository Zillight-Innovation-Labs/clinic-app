import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kivicare_patient/utils/colors.dart';

import '../../../components/cached_image_widget.dart';
import '../../../utils/common_base.dart';
import '../home_controller.dart';

class SliderComponent extends StatelessWidget {
  final HomeController homeScreenController = Get.find();

  SliderComponent({super.key});

  List images = [
    "https://t4.ftcdn.net/jpg/01/33/33/41/240_F_133334155_X23HzbJKawbIgXVaub4bPM8CjpkS5uMS.jpg",
    "https://t4.ftcdn.net/jpg/01/33/33/41/240_F_133334155_X23HzbJKawbIgXVaub4bPM8CjpkS5uMS.jpg",
    "https://t4.ftcdn.net/jpg/01/33/33/41/240_F_133334155_X23HzbJKawbIgXVaub4bPM8CjpkS5uMS.jpg",
    "https://t4.ftcdn.net/jpg/01/33/33/41/240_F_133334155_X23HzbJKawbIgXVaub4bPM8CjpkS5uMS.jpg",
    "https://t4.ftcdn.net/jpg/01/33/33/41/240_F_133334155_X23HzbJKawbIgXVaub4bPM8CjpkS5uMS.jpg",
    "https://t4.ftcdn.net/jpg/01/33/33/41/240_F_133334155_X23HzbJKawbIgXVaub4bPM8CjpkS5uMS.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    if (homeScreenController.dashboardData.value.slider.isEmpty) {
      return const Offstage();
    }

    return SizedBox(
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Obx(
            () => PageView.builder(
              controller: homeScreenController.sliderPageController,
              onPageChanged: (int page) {
                hideKeyboard(context);
                homeScreenController.sliderCurrentPage(page);
              },
              itemCount: homeScreenController.dashboardData.value.slider.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (homeScreenController
                        .dashboardData.value.slider[index].link.isURL) {
                      commonLaunchUrl(
                        homeScreenController
                            .dashboardData.value.slider[index].link,
                        launchMode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color: Colors.transparent,
                    width: Get.width,
                    child: CachedImageWidget(
                      url: images[index],
                      fit: BoxFit.fitWidth,
                      usePlaceholderIfUrlEmpty: false,
                      width: Get.width,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: -16,
            left: 0,
            right: 0,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.generate(
                  homeScreenController.dashboardData.value.slider.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        homeScreenController.sliderPageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Obx(
                        () => Container(
                          height: 10,
                          width: homeScreenController.sliderCurrentPage.value ==
                                  index
                              ? 20
                              : 10,
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: white),
                            color:
                                homeScreenController.sliderCurrentPage.value ==
                                        index
                                    ? appColorSecondary
                                    : appColorPrimary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    ).paddingTop(30);
  }
}

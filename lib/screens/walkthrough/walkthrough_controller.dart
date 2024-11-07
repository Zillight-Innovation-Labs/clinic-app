// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcelerate/screens/auth/other/welcome_screen.dart';
import '../../generated/assets.dart';
import 'model/walkthrough_model.dart';
import '../../utils/constants.dart';
import '../../utils/local_storage.dart';

class WalkthroughController extends GetxController {
  PageController pageController = PageController();

  RxInt currentPage = 0.obs;
  double skipBtnSize = 54;

  List<WalkThroughElementModel> walkthroughDetails = [
    WalkThroughElementModel(
        image: Assets.walkthroughImagesWalkImage1,
        title: "Personalized Health Plans for Your Journey",
        subTitle:
            "Customize health plans for a tailored approach, aligning each aspect with your needs."),
    WalkThroughElementModel(
        image: Assets.walkthroughImagesWalkImage2,
        title: "Stay on track and set personal goals",
        subTitle:
            "Focus on your path, set clear goals, and stride forward with determination and purpose."),
    WalkThroughElementModel(
        image: Assets.walkthroughImagesWalkImage3,
        title: "Discover and get support within 24 hours",
        subTitle:
            "Explore, find solutions, and receive assistance swiftly  your support network is ready within 24 hours."),
  ];

  @override
  void onInit() {
    setValueToLocal(SharedPreferenceConst.FIRST_TIME, true);
    super.onInit();
  }

  void handleNext() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    if (currentPage.value == (walkthroughDetails.length - 1)) {
      Get.offAll(() => WelcomeScreen(), binding: BindingsBuilder(() {
        /*  if (Get.context != null) {
          // setStatusBarColor(Get.context!.primaryColor, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.light);
        } */
      }));
    }
  }

  void handleSkip() {
    Get.offAll(
      () => WelcomeScreen(),
      binding: BindingsBuilder(() {
        /* if (Get.context != null) {
          setStatusBarColor(Get.context!.primaryColor, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.light);
        } */
      }),
    );
  }

  @override
  void onClose() {
    /* if (Get.context != null) {
      setStatusBarColor(Get.context!.primaryColor, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.light);
    } */
    super.onClose();
  }
}

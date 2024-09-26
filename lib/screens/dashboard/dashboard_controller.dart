// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../api/auth_apis.dart';
import '../../generated/assets.dart';
import '../../utils/app_common.dart';
import '../../utils/common_base.dart';
import '../../utils/constants.dart';
import '../../utils/local_storage.dart';
import '../auth/other/settings_screen.dart';
import '../auth/profile/profile_controller.dart';
import '../auth/profile/profile_screen.dart';
import '../booking/apointments/appointments_history.dart';
import '../home/home_screen.dart';
import 'components/menu.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxBool isLoading = false.obs;

  RxList<BottomBarItem> bottomNavItems = [
    BottomBarItem(title: "Home", icon: Assets.navigationIcHomeOutlined, activeIcon: Assets.navigationIcHomeFilled, type: BottomItem.home.name),
    BottomBarItem(title: "Appointment", icon: Assets.navigationIcCalenderOutlined, activeIcon: Assets.navigationIcCalenderFilled, type: BottomItem.appointment.name),
    BottomBarItem(title: "User", icon: Assets.navigationIcUserOutlined, activeIcon: Assets.navigationIcUserFilled, type: BottomItem.profile.name),
  ].obs;

  Rx<BottomBarItem> selectedBottomNav = BottomBarItem(title: "Home", icon: Assets.navigationIcHomeOutlined, activeIcon: Assets.navigationIcHomeFilled, type: BottomItem.home.name).obs;


  @override
  void onInit() {
    if (!isLoggedIn.value) {
      ProfileController().getAboutPageData();
    }
    getAppConfigurations().then((value) {
      Future.delayed(const Duration(seconds: 2), () {
        if (Get.context != null) {
          showForceUpdateDialog(Get.context!);
        }
      });
    });
    super.onInit();
  }

  @override
  void onReady() {
    if (Get.context != null) {
      View.of(Get.context!).platformDispatcher.onPlatformBrightnessChanged = () {
        WidgetsBinding.instance.handlePlatformBrightnessChanged();
        try {
          final getThemeFromLocal = getValueFromLocal(SettingsLocalConst.THEME_MODE);
          if (getThemeFromLocal is int) {
            toggleThemeMode(themeId: getThemeFromLocal);
          }
        } catch (e) {
          log('getThemeFromLocal from cache E: $e');
        }
      };
    }
    super.onReady();
  }


}

///Get App Configuration Api
Future<void> getAppConfigurations() async {
  await AuthServiceApis.getAppConfigurations().then((value) async {
    appConfigs(value);
    taxPercentage(value.taxPercentage);

    /// Place ChatGPT Key Here
    chatGPTAPIkey = value.chatgptKey;
  }).onError((error, stackTrace) {
    toast(error.toString());
  });
}

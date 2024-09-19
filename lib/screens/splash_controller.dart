// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:kivicare_patient/screens/auth/sign_in_sign_up/signin_screen.dart';
import 'package:kivicare_patient/screens/home/home_bottom_tabs.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kivicare_patient/screens/home/home_controller.dart';
import 'package:kivicare_patient/screens/walkthrough/walkthrough_screen.dart';
import 'package:kivicare_patient/utils/app_common.dart';
import 'package:kivicare_patient/utils/local_storage.dart';
import '../api/auth_apis.dart';
import '../utils/common_base.dart';
import '../utils/constants.dart';
import 'auth/model/login_response.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    //Get Package Info
    getPackageInfo().then((value) => currentPackageinfo(value));
    getAppConfigurations();
  }

  @override
  void onReady() {
    try {
      final getThemeFromLocal = getValueFromLocal(SettingsLocalConst.THEME_MODE);
      if (getThemeFromLocal is int) {
        toggleThemeMode(themeId: getThemeFromLocal);
      } else {
        toggleThemeMode(themeId: THEME_MODE_LIGHT);
      }
    } catch (e) {
      log('getThemeFromLocal from cache E: $e');
    }
    super.onReady();
  }

  ///Get ChooseService List
  getAppConfigurations() {
    AuthServiceApis.getAppConfigurations().then((value) {
      appCurrency(value.currency);
      appConfigs(value);

      ///Navigation logic
      navigationLogic();
    }).onError((error, stackTrace) {
      toast(error.toString());

      ///Navigation logic
      navigationLogic();
    });
  }

  void navigationLogic() {
    if ((getValueFromLocal(SharedPreferenceConst.FIRST_TIME) ?? false) == false) {
      Get.offAll(() => WalkthroughScreen());
    } else if (getValueFromLocal(SharedPreferenceConst.IS_LOGGED_IN) == true) {
      try {
        final userData = getValueFromLocal(SharedPreferenceConst.USER_DATA);
        isLoggedIn(true);
        loginUserData(UserData.fromJson(userData));
        Get.offAll(() => const HomeBottomNavBarScreen (), binding: BindingsBuilder(() {//DashboardScreen
          Get.put(HomeController());
        }));
      } catch (e) {
        log('SplashScreenController Err: $e');
        Get.offAll(() => const HomeBottomNavBarScreen(), binding: BindingsBuilder(() {//HomeBottomNavBarScreen DashboardScreen
          Get.put(HomeController());
        }));
      }
    } else {
      Get.offAll(() => SignInScreen(), binding: BindingsBuilder(() {
        Get.put(HomeController());
      }));
      // Get.offAll(() => DashboardScreen(), binding: BindingsBuilder(() {
      //   Get.put(HomeController());
      // }));
    }
  }
}

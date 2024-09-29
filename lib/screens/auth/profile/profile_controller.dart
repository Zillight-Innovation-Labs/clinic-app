// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:kivicare_patient/providers/bottom_nav_provider.dart';
import 'package:kivicare_patient/screens/auth/sign_in_sign_up/signin_screen.dart';
import 'package:kivicare_patient/screens/home/home_bottom_tabs.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../utils/app_common.dart';
import '../../home/home_controller.dart';
import '../../../api/auth_apis.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    getAboutPageData();
  }

  handleLogout() async {
    if (isLoading.value) return;
    isLoading(true);
    log('HANDLELOGOUT: called');
    await AuthServiceApis.logoutApi().then((value) {
      isLoading(false);
    }).catchError((e) {
      toast(e.toString());
    }).whenComplete(() {
      AuthServiceApis.clearData();
      Get.offAll(() => SignInScreen(), binding: BindingsBuilder(() {
        // Get.offAll(() => const HomeBottomNavBarScreen(), binding: BindingsBuilder(() {
        Get.put(HomeController());
      }));
      
    });
  }

  ///Get About Pages
  getAboutPageData({bool isFromSwipeRefresh = false}) {
    if (!isFromSwipeRefresh) {
      isLoading(true);
    }
    isLoading(true);
    AuthServiceApis.getAboutPageData().then((value) {
      isLoading(false);
      aboutPages(value.data);
    }).onError((error, stackTrace) {
      isLoading(false);
      toast(error.toString());
    });
  }
}

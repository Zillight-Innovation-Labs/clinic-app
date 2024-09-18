import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/common_base.dart';
import '../booking/appointments_controller.dart';
import '../home/home_controller.dart';
import 'components/btm_nav_item.dart';
import 'dashboard_controller.dart';
import 'components/menu.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return DoublePressBackWidget(
      message: "Press back again to exit app",
      child: Scaffold(
        body: Stack(children: [
          Obx(() => dashboardController.screen[dashboardController.currentIndex.value]),
          Obx(
            () => Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: canvasColor.withOpacity(0.9),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: canvasColor.withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      dashboardController.bottomNavItems.length,
                      (index) {
                        BottomBarItem navBar = dashboardController.bottomNavItems[index];
                        return Obx(
                          () => BtmNavItem(
                            navBar: navBar,
                            isFirst: index == 0,
                            isLast: index == dashboardController.bottomNavItems.length - 1,
                            press: () {
                              if (!isLoggedIn.value && index == 1) {
                                doIfLoggedIn(() {
                                  handleChangeTabIndex(index);
                                });
                              } else {
                                handleChangeTabIndex(index);
                              }
                            },
                            selectedNav: dashboardController.selectedBottomNav.value,
                          ),
                        );
                      },
                    ),
                  ],
                ).fit(),
              ),
            ).paddingSymmetric(vertical: 15),
          )
        ]),
        extendBody: true,
      ),
    );
  }

  void handleChangeTabIndex(int index) {
    dashboardController.selectedBottomNav(dashboardController.bottomNavItems[index]);
    dashboardController.currentIndex(index);
    try {
      if (index == 0 || (index == 2 && isLoggedIn.value)) {
        HomeController hCont = Get.find();
        hCont.getDashboardDetail(isFromSwipeRefresh: true);
      } else if (isLoggedIn.value && index == 1) {
        AppointmentsController aCont = Get.find();
        aCont.getAppointmentList(showLoader: false);
      }
    } catch (e) {
      log('onItemSelected Err: $e');
    }
  }
}
// ignore_for_file: deprecated_member_use

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/providers/appointment_provider.dart';
import 'package:kivicare_patient/providers/bottom_nav_provider.dart';
import 'package:kivicare_patient/providers/services_provider.dart';
import 'package:kivicare_patient/screens/profile/profile_screen.dart';
import 'package:kivicare_patient/screens/booking/apointments/appointment_tab.dart';
import 'package:kivicare_patient/screens/booking/appointments_controller.dart';
import 'package:kivicare_patient/screens/home/home_screen.dart';
import 'package:kivicare_patient/screens/payment/payment_screen.dart';
import 'package:kivicare_patient/screens/service/service_screen.dart';
import 'package:kivicare_patient/screens/tests/take_test_page.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeBottomNavBarScreen extends StatefulWidget {
  const HomeBottomNavBarScreen({super.key});

  @override
  State<HomeBottomNavBarScreen> createState() => _HomeBottomNavBarScreenState();
}

class _HomeBottomNavBarScreenState extends State<HomeBottomNavBarScreen> {
  final AppointmentsController appointmentsCont =
      Get.put(AppointmentsController());
  //"Get.put(AppointmentsController())" or "Get.lazyPut(()=>AppointmentsController())"

  var currentIndex = 0;
  var selectedIndex = 0;
  // bool showPopup = false;

  List<Widget> pages = [
    HomeScreen(),
    AppointmentTabs(),
    Container(),
    const PaymentScreen(),
    ProfileScreen()
  ];

  @override
  void initState() {
    context.read<ServicesProvider>().getServices();
    context.read<AppointmentProvider>().getAppointment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeTabVM = context.watch<BottomNavProvider>();

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        homeTabVM.setNavbarIndex(0);
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            homeTabVM.updatePopUp(false);
          },
          child: Stack(
            children: [
              pages.elementAt(homeTabVM.currentIndex),
              // AnimatedContainer for the popup when the third tab is clicked
              Positioned(
                bottom: 100,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: homeTabVM.showPopup ? 200 : 0, // Animate height
                  curve: Curves.easeInOut,
                  decoration: homeTabVM.showPopup
                      ? BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        )
                      : BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SingleChildScrollView(
                      child: homeTabVM.showPopup
                          ? Center(
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          homeTabVM.updatePopUp(false);
                                          Get.to(() => const ServiceScreen());
                                        },
                                        leading: SvgPicture.asset(
                                          "assets/icons/servicesIcon.svg",
                                        ),
                                        title: const Text(
                                          "Services",
                                        ),
                                      ), //BookingFormScreen
                                      ListTile(
                                          onTap: () {
                                            homeTabVM.updatePopUp(false);
                                            Get.to(() => const TakeTestPage());
                                          },
                                          leading: const Icon(
                                              Icons.medical_information),
                                          title: const Text("Tests")),
                                      ListTile(
                                          onTap: () {
                                            homeTabVM.updatePopUp(false);
                                            context
                                                .read<BottomNavProvider>()
                                                .setNavbarIndex(1);
                                          },
                                          leading:
                                              const Icon(Icons.safety_check),
                                          title: const Text("Appointment")),
                                    ],
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: IconButton(
                                      onPressed: () {
                                        homeTabVM.updatePopUp(false);
                                      },
                                      icon: const Icon(
                                        Icons.cancel,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: StyleProvider(
          style: Style(),
          child: ConvexAppBar(
            height: 72,
            shadowColor: kSubTitleColor.withOpacity(0.1),
            style: TabStyle.fixedCircle,
            color: kSubTitleColor,
            backgroundColor: kLikeWhiteColor,
            activeColor: appColorPrimary,
            onTap: (value) {
              homeTabVM.setNavbarIndex(value);
            },
            items: [
              TabItem(
                icon: homeTabVM.currentIndex == 0
                    ? const Icon(
                        //active
                        IconlyBold.home,
                        color: appColorPrimary,
                      )
                    : Icon(
                        IconlyBold.home,
                        color: kSubTitleColor,
                      ),
                title: "Home",
              ),
              TabItem(
                //  color: appColorPrimary,
                icon: homeTabVM.currentIndex == 1
                    ? SvgPicture.asset(
                        "assets/icons/appointIcon.svg",
                        color: appColorPrimary,
                      )
                    : SvgPicture.asset(
                        "assets/icons/appointIcon.svg",
                        color: kSubTitleColor,
                      ),

                title: "Appointment",
              ),
              TabItem(
                icon: Icon(
                  IconlyBold.plus,
                  color: kLikeWhiteColor,
                ),
                title: "",
              ),
              TabItem(
                icon: homeTabVM.currentIndex == 3
                    ? const Icon(
                        IconlyBold.document,
                        color: appColorPrimary,
                      )
                    : Icon(
                        IconlyBold.document,
                        color: kSubTitleColor,
                      ),
                title: "Payment",
                // activeIcon: Icon(
                //   IconlyBold.document,
                //   color: appColorPrimary,
                // ),
              ),
              TabItem(
                icon: homeTabVM.currentIndex == 4
                    ? const Icon(
                        IconlyBold.profile,
                        color: appColorPrimary,
                      )
                    : Icon(
                        IconlyBold.profile,
                        color: kSubTitleColor,
                      ),
                title: "Profile",
                // activeIcon: Icon(
                //   IconlyBold.profile,
                //   color: appColorPrimary,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Define a custom Style class for overriding the text style
class Style extends StyleHook {
  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 10, color: color);
  }

  @override
  double get activeIconSize => 30;

  @override
  double get iconSize => 24;

  @override
  double get activeIconMargin => 5;

  @override
  // ignore: override_on_non_overriding_member
  double get iconMargin => 5;
}

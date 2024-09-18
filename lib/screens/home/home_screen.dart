import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/screens/home/home_card.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kivicare_patient/components/loader_widget.dart';

import '../../components/app_scaffold.dart';
import '../../main.dart';
import '../../utils/empty_error_state_widget.dart';
import 'components/choose_category_components.dart';
import 'components/featured_service_component.dart';
import 'components/greetings_component.dart';
import 'components/slider_component.dart';
import 'components/upcoming_appointment_components.dart';
import 'home_controller.dart';
import 'model/dashboard_res_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      hasLeadingWidget: false,
      isBlurBackgroundinLoader: true,
      isLoading: homeScreenController.isLoading,
      appBarVerticalSize: Get.height * 0.14,
      appBarChild: const GreetingsComponent(),
      body: RefreshIndicator(
        onRefresh: () async {
          return await homeScreenController.getDashboardDetail(
              isFromSwipeRefresh: true);
        },
        child: Obx(
          () => SnapHelperWidget(
            future: homeScreenController.getDashboardDetailFuture.value,
            initialData: homeScreenController
                    .dashboardData.value.categories.isEmpty
                ? null
                : DashboardRes(data: homeScreenController.dashboardData.value),
            errorBuilder: (error) {
              return NoDataWidget(
                title: error,
                retryText: locale.value.reload,
                imageWidget: const ErrorStateWidget(),
                onRetry: () {
                  homeScreenController.init();
                },
              ).paddingSymmetric(horizontal: 16);
            },
            loadingWidget: homeScreenController.isLoading.value
                ? const Offstage()
                : const LoaderWidget(),
            onSuccess: (dashboardData) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 90),
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ChooseCategoryComponents(),
                    SliderComponent(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const HomeBanner(),
                          UpcomingAppointmentComponents(),
                        ],
                      ),
                    ),
                    FeaturedServiceComponent(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          children: [
            HomeCard(
                imagePath: "assets/images/diagnostics.png",
                title: "Tests",
                onTap: () {}),
            const SizedBox(width: 12),
            HomeCard(
                imagePath: "assets/images/nursing.png",
                title: "Talk to\nDoctor",
                onTap: () {}),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            HomeCard(
              imagePath:
                  "assets/images/ambulance.png", //assets/icons/ambulance.png
              title: "Appointment",
              onTap: () {
                Future.delayed(const Duration(seconds: 3), () {
                  // const BookAppoinment().launch(context);
                });
              },
            ),
            const SizedBox(width: 12),
            HomeCard(
                imagePath: "assets/images/pharmacyImage.png",
                title: "Medication",
                onTap: () {}),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/screens/home/components/home_service_slider.dart';
import 'package:kivicare_patient/screens/home/home_banner.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kivicare_patient/components/loader_widget.dart';
import '../../components/app_scaffold.dart';
import '../../main.dart';
import '../../utils/empty_error_state_widget.dart';
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
                    SliderComponent(),
                    const HomeBanner(),
                    UpcomingAppointmentComponents(),
                    HomeServiceSlider()
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

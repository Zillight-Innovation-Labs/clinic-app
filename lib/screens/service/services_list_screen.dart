import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/app_scaffold.dart';
import '../../components/cached_image_widget.dart';
import '../../components/loader_widget.dart';
import '../../generated/assets.dart';
import '../../main.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/empty_error_state_widget.dart';
import '../booking/filter/filter_screen.dart';
import 'components/service_card.dart';
import 'model/service_list_model.dart';
import 'search_service_widget.dart';
import 'service_list_controller.dart';

class ServiceListScreen extends StatelessWidget {
  final String? title;
  final bool isFromClinicDetail;
  final bool isFromDashboard;

  ServiceListScreen({super.key, this.title, this.isFromClinicDetail = false, this.isFromDashboard = false});

  final ServiceListController serviceListCont = Get.put(ServiceListController());

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: title ?? appbarTitle,
      appBarVerticalSize: Get.height * 0.12,
      isLoading: serviceListCont.isLoading,
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SearchServiceWidget(
                  servicesController: serviceListCont,
                  onFieldSubmitted: (p0) {
                    hideKeyboard(context);
                  },
                ).expand(),
                12.width,
                InkWell(
                  onTap: () {
                    Get.to(() => FilterScreen(), arguments: [
                      serviceListCont.clinicId.value,
                      serviceListCont.serviceType.value,
                      serviceListCont.priceMin,
                      serviceListCont.priceMax,
                    ], binding: BindingsBuilder(() {
                      setStatusBarColor(
                        transparentColor,
                        statusBarIconBrightness: Brightness.light,
                        statusBarBrightness: Brightness.light,
                        systemNavigationBarColor: whiteTextColor,
                      );
                    }));
                  },
                  child: Container(
                    height: 46,
                    width: 46,
                    alignment: Alignment.center,
                    decoration: boxDecorationDefault(color: appColorPrimary, borderRadius: BorderRadius.circular(12)),
                    child: CachedImageWidget(
                      url: Assets.iconsIcFilter,
                      height: 28,
                      color: context.scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ],
            ).paddingAll(16),
            SnapHelperWidget(
              future: serviceListCont.serviceListFuture.value,
              errorBuilder: (error) {
                return NoDataWidget(
                  title: error,
                  retryText: locale.value.reload,
                  imageWidget: const ErrorStateWidget(),
                  onRetry: () {
                    serviceListCont.page(1);
                    serviceListCont.getServiceList();
                  },
                ).paddingSymmetric(horizontal: 32);
              },
              loadingWidget: serviceListCont.isLoading.value ? const Offstage() : const LoaderWidget(),
              onSuccess: (p0) {
                if (serviceListCont.serviceList.isEmpty) {
                  return NoDataWidget(
                    title: 'No Services found at a moment',
                    subTitle: 'Looks like there is no services for this$appbarTitle, We\'ll keep you posted when there\'s an update.',
                    titleTextStyle: primaryTextStyle(),
                    imageWidget: const EmptyStateWidget(),
                    retryText: locale.value.reload,
                    onRetry: () {
                      serviceListCont.page(1);
                      serviceListCont.getServiceList();
                    },
                  ).paddingSymmetric(horizontal: 32);
                }

                return AnimatedScrollView(
                  padding: const EdgeInsets.all(16),
                  physics: const AlwaysScrollableScrollPhysics(),
                  listAnimationType: ListAnimationType.FadeIn,
                  onSwipeRefresh: () async {
                    serviceListCont.page(1);
                    return await serviceListCont.getServiceList(showLoader: false);
                  },
                  onNextPage: () async {
                    if (!serviceListCont.isLastPage.value) {
                      serviceListCont.page(serviceListCont.page.value + 1);

                      serviceListCont.getServiceList();
                    }
                  },
                  children: [
                    AnimatedWrap(
                      runSpacing: 16,
                      spacing: 16,
                      itemCount: serviceListCont.serviceList.length,
                      listAnimationType: ListAnimationType.FadeIn,
                      itemBuilder: (ctx, index) {
                        ServiceElement serviceElement = serviceListCont.serviceList[index];
                        return ServiceCard();
                      },
                    ),
                  ],
                );
              },
            ).expand(),
          ],
        ),
      ),
    );
  }

  String get appbarTitle => isFromDashboard
      ? ''
      : serviceListCont.category.value.name.isNotEmpty
          ? " ${serviceListCont.category.value.name}"
          : " ${selectedSysService.value.name} Services";
}

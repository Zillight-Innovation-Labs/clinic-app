import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kivicare_patient/screens/service/service_list_controller.dart';

import '../../components/app_custom_dialog.dart';
import '../../components/app_scaffold.dart';
import '../../components/cached_image_widget.dart';
import '../../components/loader_widget.dart';
import '../../generated/assets.dart';
import '../../main.dart';
import '../../utils/app_common.dart';
import '../../utils/colors.dart';
import '../../utils/common_base.dart';
import '../../utils/constants.dart';
import '../../utils/empty_error_state_widget.dart';
import '../../utils/price_widget.dart';
import '../../utils/view_all_label_component.dart';
import '../clinic/clinic_detail_screen.dart';
import '../clinic/clinics_list_screen.dart';
import '../clinic/model/clinic_detail_model.dart';
import '../clinic/model/clinics_res_model.dart';
import '../doctor/doctor_list_screen.dart';
import 'service_detail_controller.dart';

class ServiceDetailScreen extends StatelessWidget {
  final bool isFromClinicDetail;

  ServiceDetailScreen({super.key, this.isFromClinicDetail = false});

  final ServiceDetailController serviceDetailController = Get.put(ServiceDetailController());

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      isLoading: serviceDetailController.isLoading,
      appBartitleText: serviceDetailController.serviceData.value.name,
      appBarVerticalSize: Get.height * 0.12,
      body: RefreshIndicator(
        onRefresh: () {
          return serviceDetailController.init(showLoader: false);
        },
        child: Obx(
          () => SnapHelperWidget(
            future: serviceDetailController.getServiceDetails.value,
            errorBuilder: (error) {
              return NoDataWidget(
                title: error,
                retryText: locale.value.reload,
                imageWidget: const ErrorStateWidget(),
                onRetry: () {
                  serviceDetailController.init();
                },
              ).paddingSymmetric(horizontal: 16);
            },
            loadingWidget: const LoaderWidget(),
            onSuccess: (serviceDetailRes) {
              return AnimatedScrollView(
                listAnimationType: ListAnimationType.FadeIn,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 16, bottom: 80),
                children: [
                  Hero(
                    tag: serviceDetailController.serviceData.value.serviceImage.trim().isNotEmpty ? "${serviceDetailController.serviceData.value.id}${serviceDetailController.serviceData.value.serviceImage}" : UniqueKey(),
                    child: CachedImageWidget(
                      url: serviceDetailController.serviceData.value.serviceImage,
                      fit: BoxFit.cover,
                      width: Get.width,
                      height: 230,
                      radius: defaultRadius / 2,
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(serviceDetailController.serviceData.value.name, style: boldTextStyle(size: 16)),
                          8.height,
                          Row(
                            children: [
                              Text('Category : ', style: secondaryTextStyle()),
                              Text(serviceDetailController.serviceData.value.categoryName, style: boldTextStyle(size: 14, color: appColorSecondary)),
                            ],
                          ),
                          12.height,
                          Marquee(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (serviceDetailController.serviceData.value.discount)
                                  PriceWidget(
                                    price: serviceDetailController.serviceData.value.payableAmount,
                                    size: 18,
                                  ).paddingRight(6),
                                PriceWidget(
                                  price: serviceDetailController.serviceData.value.charges,
                                  isLineThroughEnabled: serviceDetailController.serviceData.value.discount ? true : false,
                                  size: serviceDetailController.serviceData.value.discount ? 14 : 18,
                                  color: serviceDetailController.serviceData.value.discount ? textSecondaryColorGlobal : appColorPrimary,
                                ),
                                if (serviceDetailController.serviceData.value.discount)
                                  if (serviceDetailController.serviceData.value.discountType == TaxType.PERCENTAGE)
                                    Text(
                                      '${serviceDetailController.serviceData.value.discountValue}%  off', //TODO: string
                                      style: boldTextStyle(color: greenColor, size: 14),
                                    ).paddingLeft(8)
                                  else if (serviceDetailController.serviceData.value.discountType == TaxType.FIXED)
                                    PriceWidget(
                                      price: serviceDetailController.serviceData.value.discountValue,
                                      color: greenColor,
                                      size: 14,
                                      isDiscountedPrice: true,
                                    ).paddingLeft(6),
                              ],
                            ),
                          ),
                        ],
                      ).flexible(),
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  24.height,
                  if (serviceDetailController.serviceData.value.description.isNotEmpty)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        serviceDetailController.serviceData.value.description,
                        textAlign: TextAlign.justify,
                        style: primaryTextStyle(size: 12, color: secondaryTextColor.withOpacity(0.8)),
                      ),
                    ).paddingSymmetric(horizontal: 16),
                  16.height,
                  const ViewAllLabel(
                    label: "Choose Clinic",
                    isShowAll: false,
                  ).paddingSymmetric(horizontal: 16),
                  SizedBox(
                    width: Get.width,
                    child: Obx(
                      () => HorizontalList(
                        spacing: 16,
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                        itemCount: serviceDetailController.serviceData.value.clinics.length,
                        itemBuilder: (context, index) {
                          Clinic clinicData = serviceDetailController.serviceData.value.clinics[index];
                          return Obx(
                            () => GestureDetector(
                              onTap: () {
                                /// Store selected clinic in global variable
                                if (clinicData.id == serviceDetailController.selectedClinic.value.id) {
                                  /// Deselect, If again tap on same clinic
                                  serviceDetailController.selectedClinic(Clinic(clinicSession: ClinicSession()));
                                  currentSelectedClinic(serviceDetailController.selectedClinic.value);
                                  log('CURRENT SELECTED CLINIC ID==> ${currentSelectedClinic.value.id}');
                                  log('CURRENT SELECTED CLINIC NAME==> ${currentSelectedClinic.value.name}');
                                } else {
                                  serviceDetailController.selectedClinic(clinicData);
                                  currentSelectedClinic(serviceDetailController.selectedClinic.value);
                                  log('CURRENT SELECTED CLINIC ID==> ${currentSelectedClinic.value.id}');
                                  log('CURRENT SELECTED CLINIC NAME==> ${currentSelectedClinic.value.name}');
                                }
                              },
                              child: Container(
                                width: serviceDetailController.serviceData.value.clinics.length == 1 ? Get.width * 0.91 : Get.width * 0.85,
                                decoration: boxDecorationDefault(borderRadius: radius(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        CachedImageWidget(
                                          url: clinicData.clinicImage,
                                          width: Get.width,
                                          fit: BoxFit.cover,
                                          topLeftRadius: 8,
                                          topRightRadius: 8,
                                          height: Get.height * 0.24,
                                        ),
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            color: clinicData.id == serviceDetailController.selectedClinic.value.id ? appColorPrimary.withOpacity(0.4) : null,
                                            width: Get.width,
                                            height: Get.height * 0.24,
                                          ).cornerRadiusWithClipRRectOnly(topLeft: 8, topRight: 8),
                                        ),
                                        Positioned(
                                          top: -10,
                                          right: -10,
                                          child: commonLeadingWid(
                                            imgPath: Assets.imagesConfirm,
                                            color: whiteTextColor,
                                            size: 8,
                                          ).circularLightPrimaryBg(color: appColorPrimary, padding: 8),
                                        ).visible(clinicData.id == serviceDetailController.selectedClinic.value.id),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              clinicData.name,
                                              style: boldTextStyle(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ).expand(),
                                          ],
                                        ).paddingTop(12).visible(clinicData.name.trim().isNotEmpty),
                                        GestureDetector(
                                          onTap: () {
                                            launchMap(clinicData.address);
                                          },
                                          child: Row(
                                            children: [
                                              const CachedImageWidget(url: Assets.iconsIcLocation, width: 16, height: 16),
                                              12.width,
                                              Text(
                                                clinicData.address,
                                                style: secondaryTextStyle(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ).expand(),
                                            ],
                                          ),
                                        ).paddingTop(12).visible(clinicData.address.trim().isNotEmpty),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                launchCall(clinicData.contactNumber);
                                              },
                                              child: Row(
                                                children: [
                                                  const CachedImageWidget(url: Assets.iconsIcCall, width: 14, height: 14),
                                                  12.width,
                                                  Text(clinicData.contactNumber, style: primaryTextStyle(color: appColorPrimary)),
                                                ],
                                              ),
                                            ).expand().visible(clinicData.contactNumber.trim().isNotEmpty),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                              decoration: boxDecorationDefault(
                                                color: getClinicStatusLightColor(clinicStatus: clinicData.clinicStatus.toLowerCase()),
                                                borderRadius: radius(22),
                                              ),
                                              child: Text(
                                                getClinicStatus(status: clinicData.clinicStatus.toLowerCase()),
                                                style: boldTextStyle(size: 10, color: getClinicStatusColor(clinicStatus: clinicData.clinicStatus.toLowerCase())),
                                              ),
                                            ),
                                          ],
                                        ).paddingTop(8),
                                        TextButton(
                                          onPressed: () {
                                            /// Store selected clinic in global variable
                                            currentSelectedClinic(clinicData);
                                            Get.delete<ServiceListController>();
                                            Get.to(() => ClinicDetailScreen(), arguments: clinicData);
                                          },
                                          // style: const ButtonStyle(
                                          //   padding: WidgetStatePropertyAll(EdgeInsets.zero),
                                          //   overlayColor: WidgetStatePropertyAll(lightSecondaryColor),
                                          // ),
                                          child: Text('View Detail', style: boldTextStyle(color: appColorSecondary, size: 12)),
                                        ),
                                        8.height,
                                      ],
                                    ).paddingSymmetric(horizontal: 16),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  32.height,
                ],
              );
            },
          ),
        ),
      ),
      widgetsStackedOverBody: [
        Positioned(
          bottom: 16,
          width: Get.width,
          child: AppButton(
            margin: EdgeInsets.zero,
            height: 50,
            width: Get.width,
            elevation: 0,
            color: appColorSecondary,
            onTap: () {
              if (isFromClinicDetail) {
                showInDialog(
                  context,
                  contentPadding: EdgeInsets.zero,
                  builder: (context) {
                    return AppCustomDialog(
                      title: 'Do you want to replace the previous service with the current one?',
                      negativeText: 'No',
                      positiveText: locale.value.yes,
                      onTap: () {
                        log('PREVIOUS SERVICE ID==> ${currentSelectedService.value.id}');
                        log('PREVIOUS SERVICE NAME==> ${currentSelectedService.value.name}');
                        log('PREVIOUS CLINIC ID==> ${currentSelectedClinic.value.id}');
                        log('PREVIOUS CLINIC NAME==> ${currentSelectedClinic.value.name}');
                        currentSelectedService(serviceDetailController.serviceData.value);
                        log('NEW SERVICE ID==> ${currentSelectedService.value.id}');
                        log('NEW SERVICE NAME==> ${currentSelectedService.value.name}');
                        Get.back();
                        Get.to(() => DoctorsListScreen(), arguments: currentSelectedClinic.value.id);
                      },
                    );
                  },
                );
              } else {
                /// Store select service in global variable
                currentSelectedService(serviceDetailController.serviceData.value);
                log('CURRENT SELECTED SERVICE ID==> ${currentSelectedService.value.id}');
                log('CURRENT SELECTED SERVICE NAME==> ${currentSelectedService.value.name}');

                if (!currentSelectedClinic.value.id.isNegative) {
                  log('PREVIOUS CLINIC ID==> ${currentSelectedClinic.value.id}');
                  log('PREVIOUS CLINIC NAME==> ${currentSelectedClinic.value.name}');
                  Get.to(() => DoctorsListScreen(), arguments: currentSelectedClinic.value.id);
                } else {
                  Get.to(() => ClinicListScreen(), arguments: serviceDetailController.serviceData.value);
                }
              }
            },
            child: Text('Book Now', style: boldTextStyle(size: 14, color: whiteTextColor, weight: FontWeight.w400)),
          ).paddingSymmetric(horizontal: 16),
        )
      ],
    );
  }
}

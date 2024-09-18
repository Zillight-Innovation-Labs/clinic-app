import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kivicare_patient/utils/colors.dart';

import '../../../../components/cached_image_widget.dart';
import '../../../components/app_custom_dialog.dart';
import '../../../generated/assets.dart';
import '../../../main.dart';
import '../../../utils/app_common.dart';
import '../../../utils/price_widget.dart';
import '../../clinic/clinics_list_screen.dart';
import '../../doctor/doctor_list_screen.dart';
import '../model/service_list_model.dart';
import '../service_detail_controller.dart';
import '../service_detail_screen.dart';

class ServiceCard extends StatelessWidget {
  final ServiceElement serviceElement;
  final bool isFromClinicDetail;

  const ServiceCard(
      {super.key,
      required this.serviceElement,
      this.isFromClinicDetail = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isFromClinicDetail) {
          Get.delete<ServiceDetailController>();
        }
        Get.to(
            () => ServiceDetailScreen(isFromClinicDetail: isFromClinicDetail),
            arguments: serviceElement);
      },
      child: Container(
        decoration: boxDecorationDefault(
            color: context.cardColor, borderRadius: radius(8)),
        width: Get.width / 2 - 24,
        child: Column(
          children: [
            Hero(
              tag: serviceElement.serviceImage.trim().isNotEmpty
                  ? "${serviceElement.id}${serviceElement.serviceImage}"
                  : UniqueKey(),
              child: Stack(
                children: [
                  CachedImageWidget(
                    url:
                        "https://t4.ftcdn.net/jpg/01/33/33/41/240_F_133334155_X23HzbJKawbIgXVaub4bPM8CjpkS5uMS.jpg",
                    fit: BoxFit.cover,
                    width: Get.width / 2 - 24,
                    height: Get.height * 0.15,
                    topLeftRadius: 8,
                    topRightRadius: 8,
                    bottomRightRadius:
                        serviceElement.isVideoConsultancy ? 6 : 0,
                  ),
                  if (serviceElement.isVideoConsultancy)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: boxDecorationDefault(
                          color: completedStatusColor,
                          borderRadius: BorderRadius.only(
                              topLeft: radiusCircular(),
                              bottomRight: radiusCircular(6)),
                          border: Border(
                              left: BorderSide(
                                  color: context.cardColor, width: 6),
                              top: BorderSide(
                                  color: context.cardColor, width: 6)),
                        ),
                        child: CachedImageWidget(
                          url: Assets.imagesVideoCamera,
                          fit: BoxFit.fitHeight,
                          height: 10,
                          color: context.cardColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      serviceElement.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: boldTextStyle(size: 16),
                    ).flexible(),
                  ],
                ),
                8.height,
                Marquee(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (serviceElement.discount)
                        PriceWidget(
                                price: serviceElement.payableAmount, size: 18)
                            .paddingRight(6),
                      PriceWidget(
                        price: serviceElement.charges,
                        isLineThroughEnabled:
                            serviceElement.discount ? true : false,
                        size: serviceElement.discount ? 14 : 18,
                        color: serviceElement.discount
                            ? textSecondaryColorGlobal
                            : appColorPrimary,
                      ),
                    ],
                  ),
                ),
                6.height,
                AppButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  margin: EdgeInsets.zero,
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
                            title:
                                'Do you want to replace the previous service with the current one?',
                            negativeText: 'No',
                            positiveText: locale.value.yes,
                            onTap: () {
                              log('PREVIOUS SERVICE ID==> ${currentSelectedService.value.id}');
                              log('PREVIOUS SERVICE NAME==> ${currentSelectedService.value.name}');
                              log('PREVIOUS CLINIC ID==> ${currentSelectedClinic.value.id}');
                              log('PREVIOUS CLINIC NAME==> ${currentSelectedClinic.value.name}');
                              currentSelectedService(serviceElement);
                              log('NEW SERVICE ID==> ${currentSelectedService.value.id}');
                              log('NEW SERVICE NAME==> ${currentSelectedService.value.name}');
                              Get.back();
                              Get.to(() => DoctorsListScreen(),
                                  arguments: currentSelectedClinic.value.id);
                            },
                          );
                        },
                      );
                    } else {
                      /// Store select service in global variable
                      currentSelectedService(serviceElement);
                      log('CURRENT SELECTED SERVICE ID==> ${currentSelectedService.value.id}');
                      log('CURRENT SELECTED SERVICE NAME==> ${currentSelectedService.value.name}');
                      Get.to(() => ClinicListScreen(),
                          arguments: serviceElement);
                    }
                  },
                  child: Text('Book Now',
                      style: boldTextStyle(
                          size: 12,
                          color: whiteTextColor,
                          weight: FontWeight.w400)),
                ),
                // const Spacer()
              ],
            ).paddingSymmetric(horizontal: 12, vertical: 12),
          ],
        ),
      ),
    );
  }
}

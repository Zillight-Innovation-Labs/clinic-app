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
  // final ServiceElement serviceElement;
  final bool isFromClinicDetail;

  const ServiceCard(
      {super.key,
      // required this.serviceElement,
      this.isFromClinicDetail = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (isFromClinicDetail) {
        //   Get.delete<ServiceDetailController>();
        // }
        // Get.to(
        //     () => ServiceDetailScreen(isFromClinicDetail: isFromClinicDetail),
        //     arguments: serviceElement);
      },
      child: Container(
        decoration: boxDecorationDefault(
            color: context.cardColor, borderRadius: radius(8)),
        width: Get.width / 2 - 24,
        child: Column(
          children: [
            Hero(
              tag: 
                 UniqueKey(),
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
                        6
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
                      "Service 1",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: boldTextStyle(size: 16),
                    ).flexible(),
                  ],
                ),
                8.height,
              
                6.height,
                AppButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  margin: EdgeInsets.zero,
                  width: Get.width,
                  elevation: 0,
                  color: appColorSecondary,
                  onTap: () {},
                  child: Text('View ',
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

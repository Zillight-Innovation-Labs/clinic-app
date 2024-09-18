import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../generated/assets.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';
import '../../doctor/doctor_list_screen.dart';
import '../../service/services_list_screen.dart';
import '../clinic_detail_controller.dart';
import '../clinic_gallery_list_screen.dart';
import 'clinic_session_component.dart';

class ClinicDetailBtmComp extends StatelessWidget {
  final ClinicDetailController clinicDetailCont;

  const ClinicDetailBtmComp({super.key, required this.clinicDetailCont});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Get.width,
      child: Column(
        children: [
          SettingItemWidget(
            title: "Sessions",
            decoration: boxDecorationDefault(),
            subTitle: "Clinic sessions information",
            splashColor: transparentColor,
            onTap: () {
              Get.to(() => ClinicSessionComponent(clinicDetailCont: clinicDetailCont));
            },
            titleTextStyle: boldTextStyle(size: 14),
            leading: commonLeadingWid(imgPath: Assets.iconsIcClock, color: appColorSecondary),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: darkGray),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          ),
          Obx(
            () => SettingItemWidget(
              title: "Services",
              decoration: boxDecorationDefault(),
              subTitle: clinicDetailCont.clinicData.value.totalServices != 0
                  ? "Total ${clinicDetailCont.clinicData.value.totalServices} services available"
                  : "No services available",
              splashColor: transparentColor,
              onTap: () {
                Get.to(() => ServiceListScreen(isFromClinicDetail: true), arguments: clinicDetailCont.clinicData.value.id);
              },
              titleTextStyle: boldTextStyle(size: 14),
              leading: commonLeadingWid(imgPath: Assets.iconsIcServices, color: appColorSecondary),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: darkGray),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            ).paddingTop(16),
          ),
          Obx(
            () => SettingItemWidget(
              title: "Doctors",
              decoration: boxDecorationDefault(),
              subTitle: clinicDetailCont.clinicData.value.totalDoctors != 0
                  ? "Total ${clinicDetailCont.clinicData.value.totalDoctors} Doctors available"
                  : "No doctors available",
              splashColor: transparentColor,
              onTap: () {
                Get.to(() => DoctorsListScreen(), arguments: clinicDetailCont.clinicData.value.id);
              },
              titleTextStyle: boldTextStyle(size: 14),
              leading: commonLeadingWid(imgPath: Assets.iconsIcDoctor, color: appColorSecondary),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: darkGray),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            ).paddingTop(16),
          ),
          Obx(
            () => SettingItemWidget(
              title: "Gallery",
              decoration: boxDecorationDefault(),
              subTitle: clinicDetailCont.clinicData.value.totalGalleryImages != 0
                  ? "Total ${clinicDetailCont.clinicData.value.totalGalleryImages} Photos available"
                  : "No photos available",
              splashColor: transparentColor,
              onTap: () {
                Get.to(() => ClinicGalleryListScreen(), arguments: clinicDetailCont.clinicData.value.id);
              },
              titleTextStyle: boldTextStyle(size: 14),
              leading: commonLeadingWid(imgPath: Assets.iconsIcGallery, color: appColorSecondary),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: darkGray),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            ).paddingTop(16),
          ),
        ],
      ),
    );
  }
}

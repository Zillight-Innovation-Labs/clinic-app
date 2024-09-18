import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kivicare_patient/utils/app_common.dart';

import '../../components/app_scaffold.dart';
import '../../generated/assets.dart';
import '../../utils/colors.dart';
import '../../utils/common_base.dart';
import '../../utils/price_widget.dart';
import '../booking/model/save_booking_res.dart';

class BookingSuccessScreen extends StatelessWidget {
  BookingSuccessScreen({super.key});

  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppBar: true,
      isLoading: isLoading,
      body: Container(
        height: Get.height * 0.7,
        decoration: boxDecorationDefault(),
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    alignment: Alignment.center,
                    decoration: boxDecorationDefault(color: appColorPrimary, shape: BoxShape.circle),
                    child: Image.asset(Assets.imagesConfirm, scale: 1),
                  ),
                  24.height,
                  Text('Great!', style: boldTextStyle(color: appColorSecondary), textAlign: TextAlign.center),
                  16.height,
                  Text('Booking Successful', style: primaryTextStyle(size: 18)),
                  8.height,
                  Text("Your appointment has been booked successfully", textAlign: TextAlign.center, style: secondaryTextStyle()),
                  32.height,
                  Wrap(
                    runSpacing: 8,
                    spacing: 4,
                    children: List.generate(Get.width ~/ 14, (index) => Container(width: 8, height: 2, decoration: boxDecorationDefault(color: context.dividerColor.withOpacity(0.3)))),
                  ),
                  32.height,
                  Text(
                    "To ${saveBookingRes.value.saveBookingResData.clinicName.capitalizeEachWord()} On ${saveBookingRes.value.saveBookingResData.appointmentDate.dateInDMMMMyyyyFormat} At ${saveBookingRes.value.saveBookingResData.appointmentTime.format24HourtoAMPM}",
                    textAlign: TextAlign.center,
                    style: secondaryTextStyle(),
                  ),
                  32.height,
                  Text("Total Payment", textAlign: TextAlign.center, style: boldTextStyle(color: secondaryTextColor)),
                  16.height,
                  PriceWidget(
                    price: saveBookingRes.value.saveBookingResData.totalAmount,
                    color: appColorPrimary,
                    size: 20,
                  ),
                ],
              ),
            ).paddingBottom(80),
            Positioned(
              bottom: 22,
              left: 16,
              right: 16,
              child: AppButton(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                text: "Go to Appointments",
                color: appColorSecondary,
                textStyle: appButtonTextStyleWhite,
                onTap: () {
                  /// To Clear Value
                  saveBookingRes(SaveBookingRes(saveBookingResData: SaveBookingResData()));
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 16).center(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:healthcelerate/screens/booking/components/rescheduling_component.dart';

// import '../../../components/app_scaffold.dart';
// import '../../../utils/common_base.dart';
// import '../../components/applied_tax_list_bottom_sheet.dart';
// import '../../components/cached_image_widget.dart';
// import '../../components/chat_gpt_loder.dart';
// import '../../components/common_file_placeholders.dart';
// import '../../components/loader_widget.dart';
// import '../../generated/assets.dart';
// import '../../main.dart';
// import '../../utils/app_common.dart';
// import '../../utils/colors.dart';
// import '../../utils/constants.dart';
// import '../../utils/empty_error_state_widget.dart';
// import '../../utils/price_widget.dart';
// import '../../utils/view_all_label_component.dart';
// import '../payment/payment_controller.dart';
// import 'appointment_detail_controller.dart';
// import 'encounter_detail_screen.dart';
// import 'model/appointment_detail_res.dart';

// class AppointmentDetail extends StatelessWidget {
//   AppointmentDetail({Key? key}) : super(key: key);
//   final AppointmentDetailController appointmentDetailCont = Get.put(AppointmentDetailController());

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffoldNew(
//       isLoading: appointmentDetailCont.isLoading,
//       appBartitleText: "Appointment #${appointmentDetailCont.appointmentDetail.value.id}",
//       appBarVerticalSize: Get.height * 0.12,
//       body: RefreshIndicator(
//         onRefresh: () {
//           return appointmentDetailCont.init(showLoader: false);
//         },
//         child: Obx(
//           () => SnapHelperWidget(
//             future: appointmentDetailCont.getAppointmentDetails.value,
//             errorBuilder: (error) {
//               return NoDataWidget(
//                 title: error,
//                 retryText: locale.value.reload,
//                 imageWidget: const ErrorStateWidget(),
//                 onRetry: () {
//                   appointmentDetailCont.init();
//                 },
//               ).paddingSymmetric(horizontal: 16);
//             },
//             loadingWidget: const LoaderWidget(),
//             onSuccess: (appointmentDetailRes) {
//               return AnimatedScrollView(
//                 listAnimationType: ListAnimationType.FadeIn,
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 padding: const EdgeInsets.only(bottom: 30),
//                 children: [
//                   16.height,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const ViewAllLabel(label: "Appointment Detail", isShowAll: false),
//                       if (appointmentDetailCont.appointmentDetail.value.status.contains(BookingStatusConst.PENDING))

//                         ///Reschedule Appointment
//                         SizedBox(
//                           height: 23,
//                           child: AppButton(
//                             text: 'Reschedule',
//                             padding: EdgeInsets.zero,
//                             textStyle: secondaryTextStyle(color: Colors.white),
//                             shapeBorder: RoundedRectangleBorder(borderRadius: radius(4)),
//                             onTap: () {
//                               appointmentDetailCont.getTimeSlot();
//                               handleRescheduleClick(
//                                 context: context,
//                                 isLoading: appointmentDetailCont.isLoading,
//                                 appointmentDetail: appointmentDetailCont.appointmentDetail,
//                                 appointmentDetailCont: appointmentDetailCont,
//                               );
//                             },
//                           ),
//                         )
//                       else if (appointmentDetailCont.appointmentDetail.value.status.contains(BookingStatusConst.CHECKOUT))

//                         ///Invoice Download
//                         SizedBox(
//                           height: 23,
//                           child: AppButton(
//                             padding: EdgeInsets.zero,
//                             textStyle: secondaryTextStyle(color: Colors.white),
//                             shapeBorder: RoundedRectangleBorder(borderRadius: radius(4)),
//                             onTap: () {
//                               appointmentDetailCont.getAppointmentInvoice();
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 const CachedImageWidget(
//                                   url: Assets.iconsIcDownload,
//                                   height: 14,
//                                   width: 14,
//                                   color: white,
//                                 ),
//                                 6.width,
//                                 Text("Invoice", style: primaryTextStyle(size: 12, color: white)),
//                               ],
//                             ),
//                           ),
//                         ),
//                     ],
//                   ).paddingSymmetric(horizontal: 16),
//                   Container(
//                     width: Get.width,
//                     padding: const EdgeInsets.all(16),
//                     decoration: boxDecorationDefault(color: context.cardColor),
//                     child: Column(
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Date & Time:", style: secondaryTextStyle(size: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
//                                 6.height,
//                                 Text(
//                                   "${appointmentDetailCont.appointmentDetail.value.appointmentDate.dateInDDMMYYYYFormat} at ${appointmentDetailCont.appointmentDetail.value.appointmentTime.format24HourtoAMPM}",
//                                   style: boldTextStyle(size: 12),
//                                 ),
//                               ],
//                             ).expand(flex: 3),
//                             16.width,
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Service Name:", style: secondaryTextStyle(size: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
//                                 6.height,
//                                 Text(appointmentDetailCont.appointmentDetail.value.serviceName, style: boldTextStyle(size: 12)),
//                               ],
//                             ).expand(flex: 2).visible(appointmentDetailCont.appointmentDetail.value.serviceName.isNotEmpty),
//                           ],
//                         ),
//                         commonDivider.paddingSymmetric(vertical: 16),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Doctor:", style: secondaryTextStyle(size: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
//                                 6.height,
//                                 Text(appointmentDetailCont.appointmentDetail.value.doctorName, style: boldTextStyle(size: 12)),
//                               ],
//                             ).expand(flex: 3),
//                             16.width,
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Clinic Name:", style: secondaryTextStyle(size: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
//                                 6.height,
//                                 Text(appointmentDetailCont.appointmentDetail.value.clinicName, style: boldTextStyle(size: 12)),
//                               ],
//                             ).expand(flex: 2),
//                           ],
//                         ),
//                         commonDivider.paddingSymmetric(vertical: 16),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Appointment Status:", style: secondaryTextStyle(size: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
//                                 6.height,
//                                 Text(
//                                   getBookingStatus(status: appointmentDetailCont.appointmentDetail.value.status),
//                                   style: boldTextStyle(
//                                     size: 12,
//                                     color: getBookingStatusColor(status: appointmentDetailCont.appointmentDetail.value.status),
//                                   ),
//                                 ),
//                               ],
//                             ).expand(flex: 3),
//                             16.width,
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Payment Status:", style: secondaryTextStyle(size: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
//                                 6.height,
//                                 Text(
//                                   getBookingPaymentStatus(status: appointmentDetailCont.appointmentDetail.value.paymentStatus),
//                                   style: boldTextStyle(
//                                     size: 12,
//                                     color: getPriceStatusColor(paymentStatus: appointmentDetailCont.appointmentDetail.value.paymentStatus),
//                                   ),
//                                 ),
//                               ],
//                             ).expand(flex: 2),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ).paddingSymmetric(horizontal: 16),
//                   if (!appointmentDetailCont.appointmentDetail.value.encounterId.isNegative && appointmentDetailCont.appointmentDetail.value.status.contains(BookingStatusConst.CHECKOUT))
//                     Column(
//                       children: [
//                         16.height,
//                         ViewAllLabel(
//                           label: "Encounter Detail",
//                           trailingText: 'View',
//                           onTap: () {
//                             Get.to(() => EncounterDetailScreen(), arguments: appointmentDetailCont.appointmentDetail.value.encounterId);
//                           },
//                         ).paddingOnly(left: 16, right: 8),
//                         Container(
//                           width: Get.width,
//                           padding: const EdgeInsets.all(16),
//                           decoration: boxDecorationDefault(color: context.cardColor),
//                           child: Column(
//                             children: [
//                               detailWidget(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 leadingWidget: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Doctor Name: ', style: secondaryTextStyle()),
//                                     Marquee(
//                                       child: Text(
//                                         appointmentDetailCont.appointmentDetail.value.doctorName,
//                                         style: boldTextStyle(size: 12),
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ).expand(),
//                                   ],
//                                 ).expand(flex: 3),
//                                 trailingWidget: Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//                                   decoration: boxDecorationDefault(
//                                     color: appointmentDetailCont.appointmentDetail.value.encounterStatus ? lightGreenColor : lightSecondaryColor,
//                                     borderRadius: radius(22),
//                                   ),
//                                   child: Text(
//                                     appointmentDetailCont.appointmentDetail.value.encounterStatus ? 'ACTIVE' : 'CLOSED',
//                                     style: boldTextStyle(
//                                       size: 12,
//                                       color: appointmentDetailCont.appointmentDetail.value.encounterStatus ? completedStatusColor : pendingStatusColor,
//                                     ),
//                                   ),
//                                 ).paddingLeft(16),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Clinic Name: ', style: secondaryTextStyle()),
//                                   Text(
//                                     appointmentDetailCont.appointmentDetail.value.clinicName,
//                                     style: boldTextStyle(size: 12),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ).expand(),
//                                 ],
//                               ),
//                               if (appointmentDetailCont.appointmentDetail.value.encounterDescription.isNotEmpty) ...[
//                                 commonDivider.paddingSymmetric(vertical: 16),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Description: ', style: secondaryTextStyle()),
//                                     Text(
//                                       appointmentDetailCont.appointmentDetail.value.encounterDescription.isNotEmpty ? appointmentDetailCont.appointmentDetail.value.encounterDescription : 'No Records Found',
//                                       style: boldTextStyle(size: 12),
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                     ).expand(),
//                                   ],
//                                 )
//                               ],
//                             ],
//                           ),
//                         ).paddingSymmetric(horizontal: 16),
//                       ],
//                     ),
//                   16.height,
//                   Obx(
//                     () => reviewPart(context).paddingBottom(16).visible(!appointmentDetailCont.isLoading.value && appointmentDetailCont.appointmentDetail.value.status.toLowerCase().contains(StatusConst.checkOut.toLowerCase())),
//                   ),
//                   paymentDetails(context),
//                   Column(
//                     children: [
//                       16.height,
//                       medicalReportWidget().paddingSymmetric(horizontal: 16),
//                     ],
//                   ).visible(appointmentDetailCont.appointmentDetail.value.medicalReport.isNotEmpty),
//                   Obx(() => payNowBtn(context).visible(
//                         (appointmentDetailCont.appointmentDetail.value.paymentStatus.toLowerCase().contains(PaymentStatus.pending) || appointmentDetailCont.appointmentDetail.value.paymentStatus.toLowerCase().contains(PaymentStatus.failed)) &&
//                             appointmentDetailCont.appointmentDetail.value.status.toLowerCase().contains(StatusConst.checkIn.toLowerCase()),
//                       )),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget payNowBtn(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         32.height,
//         AppButton(
//           width: Get.width,
//           text: 'Pay Now',
//           textStyle: appButtonTextStyleWhite,
//           color: completedStatusColor,
//           onTap: () async {
//             paymentController = PaymentController(
//               isFromBookingDetail: true,
//               bid: appointmentDetailCont.appointmentDetail.value.id,
//               amount: appointmentDetailCont.appointmentDetail.value.totalAmount,
//               tax: appointmentDetailCont.appointmentDetail.value.tax.map((e) => e.value).sumByDouble((p0) => p0),
//             );
//             paymentController.paymentOption(PaymentMethods.PAYMENT_METHOD_STRIPE);
//             // Get.to(() => const PaymentScreen())?.then((value) {
//             //   if (value == true) {
//             //     appointmentDetailCont.init(showLoader: true);

//             //     ///Refresh Appointment List
//             //     try {
//             //       AppointmentsController appointmentsCont = Get.find();
//             //       appointmentsCont.page(1);
//             //       appointmentsCont.getAppointmentList();
//             //     } catch (e) {
//             //       log('onItemSelected Err: $e');
//             //     }
//             //   }
//             // });
//           },
//         ).paddingSymmetric(horizontal: 16),
//       ],
//     );
//   }

//   Widget medicalReportWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const ViewAllLabel(label: "Medical Report", isShowAll: false),
//         8.height,
//         AnimatedWrap(
//           listAnimationType: ListAnimationType.None,
//           spacing: 16,
//           runSpacing: 16,
//           itemCount: appointmentDetailCont.appointmentDetail.value.medicalReport.length,
//           itemBuilder: (ctx, index) {
//             MedicalReport medicalReportData = appointmentDetailCont.appointmentDetail.value.medicalReport[index];
//             return Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.center,
//               children: [
//                 SizedBox(width: 80, height: 80, child: Loader()),
//                 GestureDetector(
//                   onTap: () {
//                     viewFiles(medicalReportData.url);
//                   },
//                   behavior: HitTestBehavior.translucent,
//                   child: medicalReportData.url.isImage
//                       ? Container(
//                           decoration: boxDecorationWithRoundedCorners(backgroundColor: transparentColor),
//                           child: CachedImageWidget(
//                             url: medicalReportData.url,
//                             height: 80,
//                             width: 80,
//                             fit: BoxFit.cover,
//                             radius: defaultRadius,
//                           ),
//                         )
//                       : CommonPdfPlaceHolder(text: medicalReportData.url.split("/").last, height: 80, width: 80),
//                 ),
//               ],
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget paymentDetails(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const ViewAllLabel(label: "Payment Detail", isShowAll: false).paddingOnly(left: 16, right: 8),
//         Container(
//           width: Get.width,
//           padding: const EdgeInsets.all(16),
//           decoration: boxDecorationDefault(color: context.cardColor),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// Service price
//               detailWidgetPrice(title: 'Price', value: appointmentDetailCont.appointmentDetail.value.servicePrice),

//               /// Write a code for Apply Coupons

//               /// Discount price
//               if (appointmentDetailCont.appointmentDetail.value.discountValue > 0 && appointmentDetailCont.appointmentDetail.value.discountAmount > 0)
//                 detailWidgetPrice(
//                   leadingWidget: Row(
//                     children: [
//                       Text('Discount', style: secondaryTextStyle()),
//                       if (appointmentDetailCont.appointmentDetail.value.discountType == TaxType.PERCENTAGE)
//                         Text(
//                           ' (${appointmentDetailCont.appointmentDetail.value.discountValue}% off)',
//                           style: boldTextStyle(color: Colors.green, size: 12),
//                         )
//                       else if (appointmentDetailCont.appointmentDetail.value.discountType == TaxType.FIXED)
//                         PriceWidget(
//                           price: appointmentDetailCont.appointmentDetail.value.discountValue,
//                           color: Colors.green,
//                           size: 12,
//                           isDiscountedPrice: true,
//                         )
//                     ],
//                   ),
//                   value: appointmentDetailCont.appointmentDetail.value.discountAmount,
//                   textColor: Colors.green,
//                 ),

//               /// Subtotal
//               if (appointmentDetailCont.appointmentDetail.value.discountValue > 0 && appointmentDetailCont.appointmentDetail.value.discountAmount > 0)
//                 detailWidgetPrice(
//                   title: 'Subtotal',
//                   value: appointmentDetailCont.appointmentDetail.value.subtotal,
//                 ),

//               /// Tax
//               if (appointmentDetailCont.appointmentDetail.value.tax.isNotEmpty)
//                 detailWidgetPrice(
//                   leadingWidget: Row(
//                     children: [
//                       Text('Tax', style: secondaryTextStyle()).expand(),
//                       const Icon(Icons.info_outline_rounded, size: 18, color: appColorPrimary).onTap(
//                         () {
//                           showModalBottomSheet(
//                             context: context,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: radiusCircular(16),
//                                 topRight: radiusCircular(16),
//                               ),
//                             ),
//                             builder: (_) {
//                               return AppliedTaxListBottomSheet(
//                                 taxes: appointmentDetailCont.appointmentDetail.value.tax,
//                                 subTotal: appointmentDetailCont.appointmentDetail.value.subtotal,
//                               );
//                             },
//                           );
//                         },
//                       ),
//                       16.width,
//                     ],
//                   ).expand(),
//                   value: appointmentDetailCont.appointmentDetail.value.totalTax,
//                   isSemiBoldText: true,
//                   textColor: appColorSecondary,
//                 ),
//               commonDivider.paddingSymmetric(vertical: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Total", style: boldTextStyle(size: 14)),
//                   PriceWidget(
//                     price: appointmentDetailCont.appointmentDetail.value.totalAmount,
//                     color: appColorPrimary,
//                     size: 16,
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ).paddingSymmetric(horizontal: 16)
//       ],
//     );
//   }

//   Widget reviewPart(BuildContext context) {
//     return Obx(
//       () => appointmentDetailCont.hasReview.value
//           ? appointmentDetailCont.showWriteReview.value
//               ? addEditReview(context)
//               : yourReview(context)
//           : addEditReview(context),
//     );
//   }

//   Widget yourReview(BuildContext context) {
//     return Obx(
//       () => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const ViewAllLabel(label: "Your Review", isShowAll: false).paddingOnly(right: 8),
//               const Spacer(),
//               GestureDetector(
//                 onTap: appointmentDetailCont.handleEditReview,
//                 child: commonLeadingWid(
//                   imgPath: Assets.iconsIcEditReview,
//                   color: textSecondaryColorGlobal,
//                   icon: Icons.edit_outlined,
//                   size: 16,
//                 ),
//               ),
//               16.width,
//               GestureDetector(
//                 onTap: () {
//                   appointmentDetailCont.deleteReviewHandleClick();
//                 },
//                 child: commonLeadingWid(
//                   imgPath: Assets.iconsIcDelete,
//                   color: appColorSecondary,
//                   icon: Icons.delete_outline,
//                   size: 16,
//                 ),
//               ),
//             ],
//           ).paddingSymmetric(horizontal: 16),
//           Container(
//             padding: const EdgeInsets.all(16),
//             width: Get.width,
//             decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                           decoration: boxDecorationDefault(color: extraLightPrimaryColor, borderRadius: radius(22)),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CachedImageWidget(
//                                 url: Assets.iconsIcStarFilled,
//                                 color: getRatingBarColor(appointmentDetailCont.yourReview.value.rating),
//                                 height: 12,
//                               ),
//                               5.width,
//                               Text(
//                                 appointmentDetailCont.yourReview.value.rating.toStringAsFixed(0).toString(),
//                                 style: boldTextStyle(size: 12, color: appColorPrimary),
//                               ).paddingTop(2),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               'By ${loginUserData.value.userName}',
//                               style: primaryTextStyle(),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ).flexible(),
//                             4.width,
//                             commonLeadingWid(imgPath: Assets.iconsIcVerified, size: 12, color: Colors.green),
//                           ],
//                         ).paddingLeft(8).expand(),
//                         10.width,
//                         Text(
//                           appointmentDetailCont.yourReview.value.createdAt.dateInyyyyMMddHHmmFormat.timeAgoWithLocalization,
//                           style: secondaryTextStyle(),
//                         ),
//                       ],
//                     ).expand(),
//                   ],
//                 ),
//                 16.height,
//                 Text(appointmentDetailCont.yourReview.value.reviewMsg, style: secondaryTextStyle()),
//               ],
//             ),
//           ).paddingSymmetric(horizontal: 16),
//         ],
//       ),
//     );
//   }

//   Widget addEditReview(BuildContext context) {
//     return Obx(
//       () => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const ViewAllLabel(label: "You haven't rated yet", isShowAll: false).paddingOnly(right: 8),
//               const Spacer(),
//               GestureDetector(
//                 onTap: appointmentDetailCont.showReview,
//                 child: commonLeadingWid(imgPath: '', icon: Icons.close_outlined, size: 20),
//               ).visible(appointmentDetailCont.showWriteReview.value),
//             ],
//           ).paddingSymmetric(horizontal: 16),
//           Text('Your Feedback Will Improve Our Service.', style: secondaryTextStyle()).paddingSymmetric(horizontal: 16),
//           16.height,
//           Row(
//             children: [
//               RatingBarWidget(
//                 size: 24,
//                 activeColor: getRatingBarColor(appointmentDetailCont.selectedRating.value),
//                 inActiveColor: ratingColor,
//                 rating: appointmentDetailCont.selectedRating.value,
//                 onRatingChanged: (rating) {
//                   appointmentDetailCont.selectedRating(rating);
//                 },
//               ).expand(),
//             ],
//           ).paddingSymmetric(horizontal: 16),
//           16.height,
//           AppTextField(
//             controller: appointmentDetailCont.reviewCont,
//             textStyle: primaryTextStyle(size: 12),
//             textFieldType: TextFieldType.MULTILINE,
//             minLines: 5,
//             enableChatGPT: appConfigs.value.enableChatGpt,
//             promptFieldInputDecorationChatGPT: inputDecoration(context, hintText: 'Write here..', fillColor: context.scaffoldBackgroundColor, filled: true),
//             testWithoutKeyChatGPT: appConfigs.value.testWithoutKey,
//             loaderWidgetForChatGPT: const ChatGPTLoadingWidget(),
//             decoration: inputDecoration(
//               context,
//               fillColor: context.cardColor,
//               filled: true,
//               labelText: 'Write Your Feedback Here..',
//             ),
//           ).paddingSymmetric(horizontal: 16),
//           16.height,
//           AppButton(
//             width: Get.width,
//             text: locale.value.submit,
//             color: appColorPrimary,
//             textStyle: const TextStyle(color: whiteTextColor),
//             onTap: () {
//               if (appointmentDetailCont.selectedRating.value > 0) {
//                 appointmentDetailCont.saveReview();
//               } else {
//                 toast('Please Select Ratings');
//               }
//             },
//           ).paddingSymmetric(horizontal: 16),
//         ],
//       ),
//     );
//   }
// }

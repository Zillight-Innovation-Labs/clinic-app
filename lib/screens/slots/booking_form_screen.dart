// import 'package:date_picker_timeline/date_picker_timeline.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:healthcelerate/utils/colors.dart';

// import '../../../components/app_scaffold.dart';
// import '../../components/add_files_widget.dart';
// import '../../components/applied_tax_list_bottom_sheet.dart';
// import '../../components/bottom_selection_widget.dart';
// import '../../components/loader_widget.dart';
// import '../../main.dart';
// import '../../utils/app_common.dart';
// import '../../utils/common_base.dart';
// import '../../utils/constants.dart';
// import '../../utils/empty_error_state_widget.dart';
// import '../../utils/price_widget.dart';
// import '../../utils/view_all_label_component.dart';
// import '../clinic/model/clinic_detail_model.dart';
// import '../clinic/model/clinics_res_model.dart';
// import '../doctor/model/doctor_list_res.dart';
// import '../service/model/service_list_model.dart';
// import 'components/clinic_selection_card_widget.dart';
// import 'components/common_selection_comp.dart';
// import 'components/doctor_selection_card_widget.dart';
// import 'components/service_selection_card_widget.dart';
// import 'booking_form_controller.dart';

// class BookingFormScreen extends StatelessWidget {
//   BookingFormScreen({super.key});

//   final BookingFormController timeSlotsCont = Get.put(BookingFormController());

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffoldNew(
//       appBartitleText: "Booking Form",
//       scaffoldBackgroundColor: context.scaffoldBackgroundColor,
//       appBarVerticalSize: Get.height * 0.12,
//       isLoading: timeSlotsCont.isLoading,
//       body: RefreshIndicator(
//         onRefresh: () async => await timeSlotsCont.init(showLoader: false),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             AnimatedScrollView(
//               physics: const AlwaysScrollableScrollPhysics(),
//               listAnimationType: ListAnimationType.FadeIn,
//               children: [
//                 16.height,
//                 const ViewAllLabel(label: "Booking info", isShowAll: false).paddingOnly(right: 8),
//                 Obx(
//                   () => Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: boxDecorationDefault(color: context.cardColor),
//                     child: Column(
//                       children: [
//                         CommonSelectionWid(
//                           title: "Service Name:",
//                           selectedName: timeSlotsCont.serviceNameText.value,
//                           onEdit: () {
//                             serviceCommonBottomSheet(
//                               context,
//                               child: BottomSelectionSheet(
//                                 title: 'Choose Service',
//                                 hintText: 'Search For Service',
//                                 hasError: timeSlotsCont.hasErrorFetchingService.value,
//                                 isEmpty: !timeSlotsCont.isLoading.value && timeSlotsCont.serviceList.isEmpty,
//                                 errorText: timeSlotsCont.errorMessageService.value,
//                                 noDataTitle: 'Service list is empty.',
//                                 noDataSubTitle: 'There are no services listed at the moment. Stay tuned for more service offerings.',
//                                 isLoading: timeSlotsCont.isLoading,
//                                 searchApiCall: (p0) {
//                                   timeSlotsCont.getServiceList(searchText: p0);
//                                 },
//                                 onRetry: () {
//                                   timeSlotsCont.servicePage(1);
//                                   timeSlotsCont.getServiceList();
//                                 },
//                                 listWidget: Obx(() => serviceListWid(timeSlotsCont.serviceList).expand()),
//                               ),
//                             );
//                           },
//                         ),
//                         commonDivider.paddingSymmetric(vertical: 16),
//                         CommonSelectionWid(
//                           title: "Clinic Name:",
//                           selectedName: timeSlotsCont.clinicNameText.value,
//                           onEdit: () {
//                             if (currentSelectedService.value.id.isNegative && timeSlotsCont.selectedService.value.id.isNegative) {
//                               toast('Kindly choose a service first');
//                               return;
//                             }

//                             serviceCommonBottomSheet(
//                               context,
//                               child: BottomSelectionSheet(
//                                 title: 'Choose Clinic',
//                                 hintText: 'Search For Clinic',
//                                 hasError: timeSlotsCont.hasErrorFetchingClinic.value,
//                                 isEmpty: !timeSlotsCont.isLoading.value && timeSlotsCont.clinicList.isEmpty,
//                                 errorText: timeSlotsCont.errorMessageClinic.value,
//                                 noDataTitle: 'Clinic list is empty.',
//                                 noDataSubTitle: 'There are no clinics listed at the moment. Stay tuned for more clinics.',
//                                 isLoading: timeSlotsCont.isLoading,
//                                 searchApiCall: (p0) {
//                                   timeSlotsCont.getClinicList(searchText: p0);
//                                 },
//                                 onRetry: () {
//                                   timeSlotsCont.clinicPage(1);
//                                   timeSlotsCont.getClinicList();
//                                 },
//                                 listWidget: Obx(() => clinicListWid(timeSlotsCont.clinicList).expand()),
//                               ),
//                             );
//                           },
//                         ),
//                         commonDivider.paddingSymmetric(vertical: 16),
//                         CommonSelectionWid(
//                           title: "Doctor Name:",
//                           selectedName: timeSlotsCont.doctorNameText.value,
//                           onEdit: () {
//                             if (timeSlotsCont.doctorList.length == 1 && timeSlotsCont.selectedClinic.value.createdBy == timeSlotsCont.doctorList.first.id) {
//                               //
//                             } else {
//                               if (timeSlotsCont.selectedClinic.value.id.isNegative) {
//                                 toast('Kindly choose a clinic first');
//                                 return;
//                               }

//                               serviceCommonBottomSheet(
//                                 context,
//                                 child: BottomSelectionSheet(
//                                   title: 'Choose Doctor',
//                                   hintText: 'Search For Doctor',
//                                   hasError: timeSlotsCont.hasErrorFetchingDoctor.value,
//                                   isEmpty: !timeSlotsCont.isLoading.value && timeSlotsCont.doctorList.isEmpty,
//                                   errorText: timeSlotsCont.errorMessageDoctor.value,
//                                   isLoading: timeSlotsCont.isLoading,
//                                   noDataTitle: 'There are no doctors listed at the moment. Stay tuned for more options.',
//                                   searchApiCall: (p0) {
//                                     timeSlotsCont.getDoctorList(searchText: p0);
//                                   },
//                                   onRetry: () {
//                                     timeSlotsCont.doctorPage(1);
//                                     timeSlotsCont.getDoctorList();
//                                   },
//                                   listWidget: Obx(() => doctorListWid(timeSlotsCont.doctorList).expand()),
//                                 ),
//                               );
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 16.height,
//                 const ViewAllLabel(label: "Choose Date", isShowAll: false).paddingOnly(right: 8),
//                 Container(
//                   decoration: boxDecorationDefault(color: context.cardColor),
//                   child: DatePicker(
//                     DateTime.now(),
//                     initialSelectedDate: DateTime.now(),
//                     selectionColor: lightPrimaryColor,
//                     selectedTextColor: appColorPrimary,
//                     height: 90,
//                     onDateChange: (date) {
//                       timeSlotsCont.selectedDate(date.formatDateYYYYmmdd());
//                       timeSlotsCont.selectedSlot("");
//                       timeSlotsCont.getTimeSlot();
//                       timeSlotsCont.onDateTimeChange();
//                     },
//                   ),
//                 ),
//                 16.height,
//                 Obx(
//                   () => SnapHelperWidget(
//                     future: timeSlotsCont.doctorsFuture.value,
//                     errorBuilder: (error) {
//                       return NoDataWidget(
//                         title: error,
//                         retryText: locale.value.reload,
//                         imageWidget: const ErrorStateWidget(),
//                         onRetry: () {
//                           timeSlotsCont.getTimeSlot();
//                         },
//                       ).paddingSymmetric(horizontal: 32);
//                     },
//                     loadingWidget: timeSlotsCont.isLoading.value ? const Offstage() : const LoaderWidget(),
//                     onSuccess: (p0) {
//                       if (timeSlotsCont.slots.isEmpty) {
//                         return NoDataWidget(title: 'No time slots available').paddingBottom(12);
//                       }

//                       return Obx(
//                         () => Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const ViewAllLabel(label: "Choose Time", isShowAll: false).paddingOnly(right: 8),
//                             Container(
//                               padding: const EdgeInsets.all(16),
//                               width: Get.width,
//                               alignment: Alignment.center,
//                               decoration: boxDecorationDefault(color: context.cardColor),
//                               child: AnimatedWrap(
//                                 spacing: 12,
//                                 runSpacing: 12,
//                                 alignment: WrapAlignment.start,
//                                 crossAxisAlignment: WrapCrossAlignment.start,
//                                 children: List.generate(
//                                   timeSlotsCont.slots.length,
//                                   (i) {
//                                     String slot = timeSlotsCont.slots[i];
//                                     return Obx(
//                                       () => GestureDetector(
//                                         onTap: () {
//                                           timeSlotsCont.selectedSlot(slot);
//                                           timeSlotsCont.onDateTimeChange();
//                                         },
//                                         child: Container(
//                                           width: Get.width / 3 - 32,
//                                           padding: const EdgeInsets.symmetric(vertical: 12),
//                                           decoration: boxDecorationWithRoundedCorners(
//                                             backgroundColor: timeSlotsCont.selectedSlot.value == slot ? appColorPrimary : context.scaffoldBackgroundColor,
//                                             borderRadius: BorderRadius.circular(defaultRadius / 2),
//                                           ),
//                                           child: Text(
//                                             slot,
//                                             textAlign: TextAlign.center,
//                                             style: primaryTextStyle(
//                                               size: 12,
//                                               color: (timeSlotsCont.selectedSlot.value == slot) ? Colors.white : appColorPrimary,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 30.height,
//                 AppTextField(
//                   textStyle: primaryTextStyle(size: 12),
//                   textFieldType: TextFieldType.MULTILINE,
//                   isValidationRequired: false,
//                   minLines: 5,
//                   controller: timeSlotsCont.medicalReportCont,
//                   decoration: inputDecoration(context, labelText: "Write medical history", fillColor: context.cardColor, filled: true),
//                 ),
//                 30.height,
//                 // AddFilesWidget(
//                 //   width: Get.width * 0.9,
//                 //   fileList: timeSlotsCont.medicalReportFiles,
//                 //   onFilePick: timeSlotsCont.handleFilesPickerClick,
//                 //   onFilePathRemove: (index) {
//                 //     timeSlotsCont.medicalReportFiles.remove(timeSlotsCont.medicalReportFiles[index]);
//                 //   },
//                 // ),
//                 const ViewAllLabel(label: "Payment Details", isShowAll: false).paddingOnly(right: 8),
//                 Obx(
//                   () => Container(
//                     width: Get.width,
//                     padding: const EdgeInsets.all(16),
//                     decoration: boxDecorationDefault(color: context.cardColor),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// Service price
//                         detailWidgetPrice(
//                           title: 'Price',
//                           paddingBottom: timeSlotsCont.selectedService.value.assignDoctor.isNotEmpty ? 0 : 10,
//                           value: timeSlotsCont.selectedService.value.assignDoctor.isNotEmpty ? timeSlotsCont.finalAssignDoctor.priceDetail.servicePrice : timeSlotsCont.selectedService.value.charges,
//                         ),

//                         if (timeSlotsCont.selectedService.value.assignDoctor.isNotEmpty)
//                           Text(
//                             '*as per doctor charges',
//                             style: secondaryTextStyle(color: appColorSecondary, size: 11, fontStyle: FontStyle.italic),
//                           ).paddingBottom(10),

//                         /// Write a code for Apply Coupons

//                         /// Discount price
//                         if (timeSlotsCont.selectedService.value.assignDoctor.isNotEmpty && timeSlotsCont.finalAssignDoctor.priceDetail.discountAmount != 0)
//                           detailWidgetPrice(
//                             leadingWidget: Row(
//                               children: [
//                                 Text('Discount', style: secondaryTextStyle()),
//                                 if (timeSlotsCont.finalAssignDoctor.priceDetail.discountType == TaxType.PERCENTAGE)
//                                   Text(
//                                     ' (${timeSlotsCont.finalAssignDoctor.priceDetail.discountValue}% off)',
//                                     style: boldTextStyle(color: Colors.green, size: 12),
//                                   )
//                                 else if (timeSlotsCont.finalAssignDoctor.priceDetail.discountType == TaxType.FIXED)
//                                   PriceWidget(
//                                     price: timeSlotsCont.finalAssignDoctor.priceDetail.discountValue,
//                                     color: Colors.green,
//                                     size: 12,
//                                     isDiscountedPrice: true,
//                                   )
//                               ],
//                             ),
//                             value: timeSlotsCont.finalAssignDoctor.priceDetail.discountAmount,
//                             textColor: Colors.green,
//                           )
//                         else if (timeSlotsCont.selectedService.value.assignDoctor.isEmpty && timeSlotsCont.selectedService.value.discount)
//                           detailWidgetPrice(
//                             leadingWidget: Row(
//                               children: [
//                                 Text('Discount', style: secondaryTextStyle()),
//                                 if (timeSlotsCont.selectedService.value.discountType == TaxType.PERCENTAGE)
//                                   Text(
//                                     ' (${timeSlotsCont.selectedService.value.discountValue}% off)',
//                                     style: boldTextStyle(color: Colors.green, size: 12),
//                                   )
//                                 else if (timeSlotsCont.selectedService.value.discountType == TaxType.FIXED)
//                                   PriceWidget(
//                                     price: timeSlotsCont.selectedService.value.discountValue,
//                                     color: Colors.green,
//                                     size: 12,
//                                     isDiscountedPrice: true,
//                                   )
//                               ],
//                             ),
//                             value: timeSlotsCont.selectedService.value.discountAmount,
//                             textColor: Colors.green,
//                           ),

//                         /// Subtotal
//                         if (timeSlotsCont.selectedService.value.assignDoctor.isNotEmpty && timeSlotsCont.finalAssignDoctor.priceDetail.discountAmount != 0)
//                           detailWidgetPrice(
//                             title: 'Subtotal',
//                             value: timeSlotsCont.finalAssignDoctor.priceDetail.serviceAmount,
//                           )
//                         else if (timeSlotsCont.selectedService.value.assignDoctor.isEmpty && timeSlotsCont.selectedService.value.discount)
//                           detailWidgetPrice(
//                             title: 'Subtotal',
//                             value: timeSlotsCont.selectedService.value.payableAmount,
//                           ),

//                         /// Tax
//                         if (taxPercentage.isNotEmpty)
//                           detailWidgetPrice(
//                             leadingWidget: Row(
//                               children: [
//                                 Text('Tax', style: secondaryTextStyle()).expand(),
//                                 const Icon(Icons.info_outline_rounded, size: 18, color: appColorPrimary).onTap(
//                                   () {
//                                     showModalBottomSheet(
//                                       context: context,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.only(
//                                           topLeft: radiusCircular(16),
//                                           topRight: radiusCircular(16),
//                                         ),
//                                       ),
//                                       builder: (_) {
//                                         return AppliedTaxListBottomSheet(
//                                           taxes: taxPercentage,
//                                           subTotal: timeSlotsCont.selectedService.value.assignDoctor.isNotEmpty ? timeSlotsCont.finalAssignDoctor.priceDetail.serviceAmount : timeSlotsCont.selectedService.value.payableAmount,
//                                         );
//                                       },
//                                     );
//                                   },
//                                 ),
//                                 16.width,
//                               ],
//                             ).expand(),
//                             value: timeSlotsCont.totalTax,
//                             isSemiBoldText: true,
//                             textColor: appColorSecondary,
//                           ),
//                         commonDivider.paddingSymmetric(vertical: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Total", style: boldTextStyle(size: 14)),
//                             PriceWidget(
//                               price: timeSlotsCont.totalAmount,
//                               color: appColorPrimary,
//                               size: 16,
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 8.height,
//               ],
//             ).makeRefreshable.paddingOnly(left: 16, right: 16, bottom: 80),
//             Positioned(
//               bottom: 16,
//               left: 16,
//               right: 16,
//               height: 50,
//               child: Obx(
//                 () => AppButton(
//                   width: Get.width,
//                   color: timeSlotsCont.nextBtnVisible.value ? appColorSecondary : null,
//                   enabled: timeSlotsCont.nextBtnVisible.value ? true : false,
//                   disabledColor: timeSlotsCont.nextBtnVisible.value ? null : appColorSecondary.withOpacity(0.5),
//                   shapeBorder: RoundedRectangleBorder(borderRadius: radius(defaultAppButtonRadius / 2)),
//                   onTap: () {
//                     if (timeSlotsCont.nextBtnVisible.value) {
//                       doIfLoggedIn(() {
//                         timeSlotsCont.handleNextClick(context);
//                       });
//                     }
//                   },
//                   child: Text(
//                     'Next',
//                     style: boldTextStyle(color: timeSlotsCont.nextBtnVisible.value ? Colors.white : Colors.white70, size: 14),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget serviceListWid(List<ServiceElement> list) {
//     return AnimatedListView(
//       itemCount: list.length,
//       shrinkWrap: true,
//       listAnimationType: ListAnimationType.FadeIn,
//       itemBuilder: (context, index) {
//         return ServiceSelectionCardWidget(
//           serviceElement: list[index],
//           onTap: () {
//             timeSlotsCont.selectedService(list[index]);
//             timeSlotsCont.serviceNameText(timeSlotsCont.selectedService.value.name);
//             currentSelectedService.value.payableAmount = timeSlotsCont.selectedService.value.payableAmount.toDouble();
//             log('currentServiceAmount: ${currentSelectedService.value.payableAmount}');
//             log('percentTaxAmount: ${timeSlotsCont.percentTaxAmount}');
//             log('fixedTaxAmount: ${timeSlotsCont.fixedTaxAmount}');
//             log('totalTax: ${timeSlotsCont.totalTax}');
//             log('TOTAL AMOUNT: ${timeSlotsCont.totalAmount}');
//             timeSlotsCont.clinicNameText("");
//             timeSlotsCont.doctorNameText("");
//             timeSlotsCont.doctorList.clear();
//             timeSlotsCont.selectedSlot("");
//             timeSlotsCont.slots.clear();
//             timeSlotsCont.nextBtnVisible(false);
//             timeSlotsCont.selectedDoctor = Doctor().obs;
//             timeSlotsCont.selectedClinic = Clinic(clinicSession: ClinicSession()).obs;
//             timeSlotsCont.getClinicList();
//             timeSlotsCont.getServiceList();
//             Get.back();
//           },
//         ).paddingBottom(16);
//       },
//       onNextPage: () {
//         if (!timeSlotsCont.isLastPage.value) {
//           timeSlotsCont.servicePage(timeSlotsCont.servicePage.value + 1);
//           timeSlotsCont.getServiceList();
//         }
//       },
//       onSwipeRefresh: () async {
//         timeSlotsCont.servicePage(1);
//         return await timeSlotsCont.getServiceList();
//       },
//     );
//   }

//   Widget clinicListWid(List<Clinic> list) {
//     return AnimatedListView(
//       itemCount: list.length,
//       shrinkWrap: true,
//       listAnimationType: ListAnimationType.FadeIn,
//       itemBuilder: (context, index) {
//         return ClinicSelectionCardWidget(
//           clinicData: list[index],
//           onTap: () {
//             timeSlotsCont.selectedClinic(list[index]);
//             timeSlotsCont.clinicNameText(timeSlotsCont.selectedClinic.value.name);
//             timeSlotsCont.clearDoctorSelection();
//             timeSlotsCont.getDoctorList();
//             timeSlotsCont.nextBtnVisible(false);
//             timeSlotsCont.getClinicList();
//             Get.back();
//           },
//         ).paddingBottom(16);
//       },
//       onNextPage: () {
//         if (!timeSlotsCont.isLastPage.value) {
//           timeSlotsCont.clinicPage(timeSlotsCont.clinicPage.value + 1);
//           timeSlotsCont.getClinicList();
//         }
//       },
//       onSwipeRefresh: () async {
//         timeSlotsCont.clinicPage(1);
//         return await timeSlotsCont.getClinicList();
//       },
//     );
//   }

//   Widget doctorListWid(List<Doctor> list) {
//     return AnimatedListView(
//       itemCount: list.length,
//       shrinkWrap: true,
//       listAnimationType: ListAnimationType.FadeIn,
//       itemBuilder: (context, index) {
//         return DoctorSelectionCardWidget(
//           doctorData: list[index],
//           onTap: () {
//             timeSlotsCont.selectedDoctor(list[index]);
//             timeSlotsCont.doctorNameText(timeSlotsCont.selectedDoctor.value.fullName);
//             timeSlotsCont.getTimeSlot();
//             timeSlotsCont.getDoctorList();
//             Get.back();
//           },
//         ).paddingBottom(16);
//       },
//       onNextPage: () {
//         if (!timeSlotsCont.isLastPage.value) {
//           timeSlotsCont.doctorPage(timeSlotsCont.doctorPage.value + 1);
//           timeSlotsCont.getDoctorList();
//         }
//       },
//       onSwipeRefresh: () async {
//         timeSlotsCont.doctorPage(1);
//         return await timeSlotsCont.getDoctorList();
//       },
//     );
//   }
// }

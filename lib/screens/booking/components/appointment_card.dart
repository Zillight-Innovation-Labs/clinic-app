// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:kivicare_patient/generated/assets.dart';
// import '../../../../components/cached_image_widget.dart';
// import '../../../../utils/colors.dart';
// import '../../../../utils/common_base.dart';
// import '../../../utils/app_common.dart';
// import '../../../utils/constants.dart';
// import '../appointments_controller.dart';
// import '../model/appointments_res_model.dart';

// class AppointmentCard extends StatelessWidget {
//   final VoidCallback? onUpdateBooking;
//   final AppointmentData appointment;

//   AppointmentCard({super.key, required this.appointment, this.onUpdateBooking});

//   final AppointmentsController appointmentsController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         hideKeyboard(context);
//       },
//       child: Stack(
//         children: [
//           Container(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 20),
//             decoration: boxDecorationDefault(
//                 color: context.cardColor, shape: BoxShape.rectangle),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 22.height,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       getDaysToGo("2024-10-27"),
//                       // getDaysToGo(appointment.appointmentDate),
//                       style: boldTextStyle(size: 14, color: appColorPrimary),
//                     ),
//                   ],
//                 ),
//                 16.height,
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   decoration: boxDecorationDefault(
//                       color: lightSecondaryColor, borderRadius: radius(22)),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         formatDateString(appointment.appointmentDate),
//                         style:
//                             boldTextStyle(size: 15, color: appColorSecondary),
//                       ),
//                       6.width,
//                       Text(
//                         "|",
//                         style:
//                             boldTextStyle(size: 13, color: appColorSecondary),
//                       ),
//                       6.width,
//                       Text(
//                         '3:30 PM - 4:00 PM',
//                         style:
//                             boldTextStyle(size: 15, color: appColorSecondary),
//                       ),
//                     ],
//                   ),
//                 ),
//                 22.height,
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Personal Healthcare Management",
//                       style: boldTextStyle(size: 15),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     Text(
//                       "Online",
//                       style: secondaryTextStyle(size: 12),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 16,
//             right: 16,
//             height: 40,
//             width: 40,
//             child: GestureDetector(
//               onTap: () {
//                 if (canLaunchVideoCall(status: appointment.status)) {
//                   if (isOnlineService) {
//                     if (appointment.googleLink.isNotEmpty) {
//                       commonLaunchUrl(appointment.googleLink,
//                           launchMode: LaunchMode.externalApplication);
//                     } else if (appointment.zoomLink.isNotEmpty) {
//                       commonLaunchUrl(appointment.zoomLink,
//                           launchMode: LaunchMode.externalApplication);
//                     } else {
//                       toast("video call link is not found!");
//                     }
//                   } else {
//                     toast("This is not a online service!");
//                   }
//                 } else {
//                   if (appointment.status
//                       .toLowerCase()
//                       .contains(StatusConst.pending)) {
//                     toast("Opps! This appointment is not confirmed yet!");
//                   } else if (appointment.status
//                           .toLowerCase()
//                           .contains(StatusConst.cancel) ||
//                       appointment.status
//                           .toLowerCase()
//                           .contains(BookingStatusConst.CANCELLED)) {
//                     toast("Opps! This appointment has been cancelled!");
//                   } else if (appointment.status
//                       .toLowerCase()
//                       .contains(StatusConst.completed)) {
//                     toast("Opps! This appointment has been completed!");
//                   }
//                 }
//               },
//               child: Container(
//                 decoration: boxDecorationDefault(
//                     shape: BoxShape.circle, color: appColorPrimary),
//                 padding: const EdgeInsets.all(10),
//                 child: const CachedImageWidget(
//                   url: Assets.imagesVideoCamera,
//                   height: 22,
//                   width: 22,
//                   circle: true,
//                   color: white,
//                 ),
//               ),
//             ).visible(isOnlineService),
//           ),
//         ],
//       ),
//     );
//   }

//   bool get isOnlineService =>
//       appointment.serviceType.toLowerCase() == ServiceTypeConst.online;
// }

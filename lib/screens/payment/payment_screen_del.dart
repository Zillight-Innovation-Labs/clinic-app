// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:nb_utils/nb_utils.dart';

// import '../../components/app_scaffold.dart';
// import '../../generated/assets.dart';
// import '../dashboard/dashboard_controller.dart';
// import '../../utils/colors.dart';
// import '../../utils/common_base.dart';
// import '../../utils/constants.dart';
// import 'payment_controller.dart';

// class PaymentScreen extends StatelessWidget {
//   const PaymentScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffoldNew(
//       appBartitleText: "Payment",
//       isLoading: paymentController.isLoading,
//       appBarVerticalSize: Get.height * 0.12,
//       body: RefreshIndicator(
//         onRefresh: () async => await getAppConfigurations(),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "* Note: For cash payment purposes, don't use the 'Pay Now' button. If you want to make a payment with cash, you can manually give the cash to the doctor and complete your appointment by Doctor side.",
//                 style: secondaryTextStyle(color: appColorSecondary, size: 11, fontStyle: FontStyle.italic),
//               ).paddingSymmetric(horizontal: 16).paddingTop(16).visible(paymentController.isFromBookingDetail),
//               16.height,
//               Text("Choose Payment Method", style: primaryTextStyle(size: 18)).paddingSymmetric(horizontal: 16),
//               8.height,
//               Text("Choose our convenient payment option and unlock unlimited access to exclusive privileges.", style: secondaryTextStyle()).paddingSymmetric(horizontal: 16),
//               32.height,
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//                 decoration: boxDecorationDefault(),
//                 child: Column(
//                   children: [
//                     stripePaymentWidget(context),
//                     Divider(color: context.dividerColor.withOpacity(0.2)),
//                     razorPaymentWidget(context),
//                     if (!paymentController.isFromBookingDetail) Divider(color: context.dividerColor.withOpacity(0.2)),
//                     if (!paymentController.isFromBookingDetail) cashAfterService(context),
//                   ],
//                 ),
//               ).paddingSymmetric(horizontal: 16)
//             ],
//           ),
//         ).makeRefreshable,
//       ),
//       widgetsStackedOverBody: [
//         Positioned(
//           bottom: 16,
//           left: 16,
//           right: 16,
//           child: AppButton(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//             color: appColorSecondary,
//             onTap: () {
//               paymentController.handleBookNowClick(context);
//             },
//             textStyle: appButtonFontColorText,
//             child: Text('Proceed', style: primaryTextStyle(color: Colors.white)),
//           ),
//         )
//       ],
//     );
//   }

//   Widget stripePaymentWidget(BuildContext context) {
//     return Obx(
//       () => RadioListTile(
//         dense: true,
//         contentPadding: const EdgeInsets.symmetric(vertical: 2),
//         tileColor: context.cardColor,
//         controlAffinity: ListTileControlAffinity.trailing,
//         shape: RoundedRectangleBorder(borderRadius: radius()),
//         secondary: const Image(
//           image: AssetImage(Assets.imagesStripeLogo),
//           height: 16,
//           width: 22,
//         ),
//         // fillColor: WidgetStateProperty.all(appColorPrimary),
//         title: Text("Stripe", style: primaryTextStyle()),
//         value: PaymentMethods.PAYMENT_METHOD_STRIPE,
//         groupValue: paymentController.paymentOption.value,
//         onChanged: (value) {
//           paymentController.paymentOption(value.toString());
//         },
//       ),
//     );
//   }

//   Widget razorPaymentWidget(BuildContext context) {
//     return Obx(
//       () => RadioListTile(
//         dense: true,
//         contentPadding: const EdgeInsets.symmetric(vertical: 2),
//         tileColor: context.cardColor,
//         controlAffinity: ListTileControlAffinity.trailing,
//         shape: RoundedRectangleBorder(borderRadius: radius()),
//         secondary: const Image(
//           image: AssetImage(Assets.imagesRazorpayLogo),
//           height: 18,
//           width: 24,
//         ),
//         // fillColor: WidgetStateProperty.all(appColorPrimary),
//         title: Text("Razorpay", style: primaryTextStyle()),
//         value: PaymentMethods.PAYMENT_METHOD_RAZORPAY,
//         groupValue: paymentController.paymentOption.value,
//         onChanged: (value) {
//           paymentController.paymentOption(value.toString());
//         },
//       ),
//     );
//   }

//   Widget cashAfterService(BuildContext context) {
//     return Obx(
//       () => RadioListTile(
//         dense: true,
//         contentPadding: const EdgeInsets.symmetric(vertical: 2),
//         tileColor: context.cardColor,
//         controlAffinity: ListTileControlAffinity.trailing,
//         shape: RoundedRectangleBorder(borderRadius: radius()),
//         secondary: const Image(
//           image: AssetImage(Assets.iconsIcCash),
//           color: appColorPrimary,
//           height: 18,
//           width: 24,
//         ),
//         // fillColor: WidgetStateProperty.all(appColorPrimary),
//         title: Text("Cash after service", style: primaryTextStyle()),
//         value: PaymentMethods.PAYMENT_METHOD_CASH,
//         groupValue: paymentController.paymentOption.value,
//         onChanged: (value) {
//           paymentController.paymentOption(value.toString());
//         },
//       ),
//     );
//   }
// }

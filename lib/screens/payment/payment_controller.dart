// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:healthcelerate/screens/home/home_bottom_tabs.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:healthcelerate/api/core_apis.dart';

// import '../../main.dart';
// import '../../payment_gateways/razor_pay_service.dart';
// import '../../payment_gateways/stripe_services.dart';
// import '../../utils/app_common.dart';
// import '../../utils/common_base.dart';
// import '../../utils/constants.dart';
// import '../booking/appointments_controller.dart';
// import '../booking/model/booking_req.dart';
// import '../booking/model/save_payment_req.dart';
// import '../dashboard/dashboard_controller.dart';
// import 'booking_confirmation_dialog.dart';
// import 'booking_success_screen.dart';

// PaymentController paymentController = PaymentController();

// class PaymentController extends GetxController {
//   bool isFromBookingDetail;
//   num? amount;
//   num? tax;
//   int? bid;

//   PaymentController({
//     this.isFromBookingDetail = false,
//     this.amount,
//     this.tax,
//     this.bid,
//   });

//   //
//   BookingReq bookingData = BookingReq();
//   RxString paymentOption = PaymentMethods.PAYMENT_METHOD_CASH.obs;
//   TextEditingController optionalCont = TextEditingController();
//   RxBool isLoading = false.obs;
//   RazorPayService razorPayService = RazorPayService();

//   savePaymentApi({required int bid, required String txnId, required String paymentType, required int paymentStatus}) {
//     isLoading(true);
//     hideKeyBoardWithoutContext();
//     CoreServiceApis.savePayment(
//       request: SavePaymentReq(
//         id: bid,
//         externalTransactionId: txnId,
//         transactionType: paymentType,
//         taxPercentage: taxPercentage.toList(),
//         paymentStatus: paymentStatus,
//       ).toJson(),
//     ).then((value) async {
//       if (isFromBookingDetail) {
//         Get.back(result: true);
//       } else {
//         onPaymentSuccess();
//       }
//       isLoading(false);
//     }).catchError((e) {
//       isLoading(false);
//       toast(e.toString(), print: true);
//     });
//   }

//   handleBookNowClick(BuildContext context) {
//     if (isFromBookingDetail) {
//       payWithSelectedOption(context, isCashPayment: false);
//     } else {
//       showInDialog(
//         context,
//         contentPadding: EdgeInsets.zero,
//         builder: (context) {
//           return ConfirmBookingDialog(
//             titleText: locale.value.confirmAppointment,
//             subTitleText: locale.value.doYouConfirmThisPayment,
//             changeToastMessage: 'Please confirm your appointment by checking the box',
//             onConfirm: () {
//               Get.back();
//               if (saveBookingRes.value.saveBookingResData.id.isNegative) {
//                 saveBooking(context);
//               } else {
//                 payWithSelectedOption(context);
//               }
//             },
//           );
//         },
//       );
//     }
//   }

//   void payWithSelectedOption(BuildContext context, {bool isCashPayment = true}) {
//     if (paymentOption.value == PaymentMethods.PAYMENT_METHOD_STRIPE) {
//       payWithStripe(context);
//     } else if (paymentOption.value == PaymentMethods.PAYMENT_METHOD_RAZORPAY) {
//       payWithRazorPay(context);
//     } else if (paymentOption.value == PaymentMethods.PAYMENT_METHOD_PAYSTACK) {
//       //payWithPayStack();
//     } else if (paymentOption.value == PaymentMethods.PAYMENT_METHOD_FLUTTER_WAVE) {
//       //payWithFlutterWave(context);
//     } else if (paymentOption.value == PaymentMethods.PAYMENT_METHOD_PAYPAL) {
//       //payWithPaypal(context);
//     } else if (paymentOption.value == PaymentMethods.PAYMENT_METHOD_AIRTEL) {
//       //payWithAirtelMoney(context);
//     } else if (paymentOption.value == PaymentMethods.PAYMENT_METHOD_PHONEPE) {
//       //payWithPhonepe(context);
//     } else if (paymentOption.value == PaymentMethods.PAYMENT_METHOD_CASH && isCashPayment) {
//       payWithCash(context);
//     }
//   }

//   payWithStripe(BuildContext context) async {
//     await StripeServices.stripePaymentMethod(
//       loaderOnOFF: (p0) {
//         isLoading(p0);
//       },
//       amount: isFromBookingDetail && amount.validate() > 0 ? amount.validate() : bookingData.totalAmount,
//       onComplete: (res) {
//         savePaymentApi(
//           bid: isFromBookingDetail && bid.validate() > 0 ? bid.validate() : saveBookingRes.value.saveBookingResData.id,
//           paymentType: PaymentMethods.PAYMENT_METHOD_STRIPE,
//           txnId: res["transaction_id"],
//           paymentStatus: 1,
//         );
//       },
//     );
//   }

//   payWithRazorPay(BuildContext context) async {
//     isLoading(true);
//     razorPayService.init(
//       razorKey: appConfigs.value.razorPay.razorpaySecretkey,
//       totalAmount: isFromBookingDetail && amount.validate() > 0 ? amount.validate() : bookingData.totalAmount,
//       onComplete: (res) {
//         log("txn id: $res");
//         savePaymentApi(
//           bid: isFromBookingDetail && bid.validate() > 0 ? bid.validate() : saveBookingRes.value.saveBookingResData.id,
//           paymentType: PaymentMethods.PAYMENT_METHOD_RAZORPAY,
//           txnId: res["transaction_id"],
//           paymentStatus: 1,
//         );
//       },
//     );
//     await Future.delayed(const Duration(seconds: 1));
//     razorPayService.razorPayCheckout();
//     await Future.delayed(const Duration(seconds: 2));
//     isLoading(false);
//   }

//   payWithCash(BuildContext context) async {
//     savePaymentApi(
//       bid: isFromBookingDetail && bid.validate() > 0 ? bid.validate() : saveBookingRes.value.saveBookingResData.id,
//       paymentType: PaymentMethods.PAYMENT_METHOD_CASH,
//       txnId: isFromBookingDetail && bid.validate() > 0 ? "#${bid.validate()}" : "",
//       paymentStatus: isFromBookingDetail && bid.validate() > 0 ? 1 : 0,
//     );
//   }

//   saveBooking(BuildContext context, {List<PlatformFile>? files}) {
//     isLoading(true);

//     CoreServiceApis.bookServiceApi(
//       request: bookingData.toJson(),
//       files: bookingData.files,
//       onSuccess: () async {
//         payWithSelectedOption(context);
//       },
//       loaderOff: () {
//         isLoading(false);
//       },
//     ).then((value) {}).catchError((e) {
//       isLoading(false);
//       toast(e.toString(), print: true);
//     });
//   }

//   void onPaymentSuccess() async {
//     isLoading(false);
//     reLoadBookingsOnDashboard();
//     await Future.delayed(const Duration(milliseconds: 300));
//     Get.offUntil(
//         GetPageRoute(
//             page: () => BookingSuccessScreen(),
//             binding: BindingsBuilder(() {
//               setStatusBarColor(transparentColor, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark);
//             })),
//         (route) => route.isFirst || route.settings.name == '/$HomeBottomNavBarScreen');
//   }
// }

// void reLoadBookingsOnDashboard() {
//   try {
//     AppointmentsController aCont = Get.find();
//     // aCont.getAppointmentList();
//   } catch (e) {
//     log('E: $e');
//   }
//   try {
//     DashboardController dashboardController = Get.find();
//     dashboardController.currentIndex(1);
//   } catch (e) {
//     log('E: $e');
//   }
// }

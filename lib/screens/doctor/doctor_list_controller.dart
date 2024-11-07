// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:stream_transform/stream_transform.dart';
// import 'package:healthcelerate/api/core_apis.dart';

// import '../../utils/app_common.dart';
// import 'model/doctor_list_res.dart';

// class DoctorListController extends GetxController {
//   Rx<Future<RxList<Doctor>>> doctorsFuture = Future(() => RxList<Doctor>()).obs;
//   RxBool isLoading = false.obs;
//   RxList<Doctor> doctors = RxList();
//   RxBool isLastPage = false.obs;
//   RxInt page = 1.obs;
//   Rx<Doctor> selectedDoctor = Doctor().obs;
//   RxInt clinicId = (-1).obs;

//   ///Search
//   TextEditingController searchDoctorCont = TextEditingController();
//   RxBool isSearchDoctorText = false.obs;
//   StreamController<String> searchDoctorStream = StreamController<String>();
//   final _scrollController = ScrollController();

//   @override
//   void onInit() {
//     _scrollController.addListener(
//         () => Get.context != null ? hideKeyboard(Get.context) : null);
//     searchDoctorStream.stream.debounce(const Duration(seconds: 1)).listen((s) {
//       getDoctors();
//     });
//     if (Get.arguments is int) {
//       clinicId(Get.arguments as int);
//       getDoctors();
//     }
//     super.onInit();
//   }

//   Future<void> getDoctors({bool showLoader = true}) async {
//     if (showLoader) {
//       isLoading(true);
//     }
//     await doctorsFuture(
//       CoreServiceApis.getDoctors(
//         page: page.value,
//         doctors: doctors,
//         serviceId: currentSelectedService.value.id,
//         clinicId: clinicId.value,
//         search: searchDoctorCont.text.trim(),
//         lastPageCallBack: (p0) {
//           isLastPage(p0);
//         },
//       ),
//     ).then((value) {
//       log('value.length ==> ${value.length}');
//     }).catchError((e) {
//       isLoading(false);
//       log("getDoctors error $e");
//     }).whenComplete(() => isLoading(false));
//   }

//   @override
//   void onClose() {
//     searchDoctorStream.close();
//     if (Get.context != null) {
//       _scrollController.removeListener(() => hideKeyboard(Get.context));
//     }
//     super.onClose();
//   }
// }

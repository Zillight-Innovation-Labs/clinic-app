// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../api/core_apis.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';
import '../../../utils/constants.dart';
import '../../clinic/model/clinic_detail_model.dart';
import '../../clinic/model/clinics_res_model.dart';
import '../../service/service_list_controller.dart';
import 'components/clinic_filter/filter_clinic_component.dart';
import 'components/price_filter/filter_price_component.dart';
import 'components/service_type_filter/filter_service_type_component.dart';

class FilterController extends GetxController {
  RxString filterType = "".obs;

  //Clinic List
  Rx<Future<RxList<Clinic>>> clinicListFuture = Future(() => RxList<Clinic>()).obs;
  RxBool isClinicLoading = false.obs;
  RxList<Clinic> clinicList = RxList();
  RxBool isClinicLastPage = false.obs;
  RxInt clinicPage = 1.obs;
  RxBool isSearchClinicText = false.obs;
  TextEditingController searchClinicCont = TextEditingController();
  StreamController<String> searchClinicStream = StreamController<String>();
  final _scrollClinicController = ScrollController();
  Rx<Clinic> selectedClinicData = Clinic(clinicSession: ClinicSession()).obs;

  RxString isPriceMin = ''.obs;
  RxString isPriceMax = ''.obs;
  Rx<RangeValues> rangeValues = const RangeValues(1, 5000).obs;

  RxList filterList = ["Price", "Clinic", "Service Type"].obs;
  RxList serviceTypeList = [
    {"title": "In Clinic", "value": ServiceTypeConst.inClinic},
    {"title": "Online", "value": ServiceTypeConst.online}
  ].obs;
  RxString selectedServiceType = "".obs;

  @override
  void onInit() {
    if (Get.arguments[0] is int) {
      selectedClinicData(Clinic(id: Get.arguments[0], clinicSession: ClinicSession()));
    }

    if (Get.arguments[1] is String) {
      selectedServiceType(Get.arguments[1]);
    }

    if (Get.arguments[2] is String && Get.arguments[3] is String) {
      rangeValues(RangeValues(Get.arguments[2].toDouble(), Get.arguments[3].toDouble()));
    }

    filterType(filterList[0]);
    getClinic();
    super.onInit();
  }

  void setMaxPrice(String val) {
    isPriceMax(val);
  }

  void setMinPrice(String val) {
    isPriceMin(val);
  }

  //get Clinic Info
  getClinic() {
    _scrollClinicController.addListener(() => Get.context != null ? hideKeyboard(Get.context) : null);
    searchClinicStream.stream.debounce(const Duration(seconds: 1)).listen((s) {
      getClinicsList();
    });
    getClinicsList();
  }

  getClinicsList({bool showLoader = true, String search = ""}) async {
    if (showLoader) {
      isClinicLoading(true);
    }
    await clinicListFuture(
      CoreServiceApis.getClinics(
        page: clinicPage.value,
        search: searchClinicCont.text.trim(),
        clinics: clinicList,
        lastPageCallBack: (p0) {
          isClinicLastPage(p0);
        },
      ),
    ).then((value) {
      log('value.length ==> ${value.length}');
    }).catchError((e) {
      isClinicLoading(false);
      log('getClinics: $e');
    }).whenComplete(() => isClinicLoading(false));
  }

  getRest() {
    selectedClinicData(Clinic(clinicSession: ClinicSession()));
    selectedServiceType("");
    isPriceMin("");
    isPriceMax("");
    rangeValues(RangeValues(1, 5000));
    ServiceListController serviceCont = Get.find();
    Get.back();
    serviceCont.clinicId(selectedClinicData.value.id);
    serviceCont.serviceType(selectedServiceType.value);
    serviceCont.priceMin(isPriceMin.value);
    serviceCont.priceMax(isPriceMax.value);
    serviceCont.getServiceList();
  }

  viewFilterWidget() {
    switch (filterType.value) {
      case "Price":
        return FilterPriceComponent().expand(flex: 3);
      case "Clinic":
        return FilterClinicComponent().expand(flex: 3);
      case "Service Type":
        return FilterServiceTypeComponent().expand(flex: 3);
      default:
        return FilterPriceComponent().expand(flex: 3);
    }
  }

  Widget applyButton() {
    return AppButton(
      width: Get.width,
      text: "Apply",
      color: appColorPrimary,
      textStyle: appButtonTextStyleWhite,
      onTap: () {
        ServiceListController serviceCont = Get.find();
        serviceCont.clinicId(selectedClinicData.value.id);
        serviceCont.serviceType(selectedServiceType.value);
        serviceCont.priceMin(isPriceMin.value);
        serviceCont.priceMax(isPriceMax.value);
        Get.back();
        serviceCont.getServiceList();
      },
    );
  }

  @override
  void onClose() {
    searchClinicStream.close();
    if (Get.context != null) {
      _scrollClinicController.removeListener(() => hideKeyboard(Get.context));
    }
    super.onClose();
  }
}

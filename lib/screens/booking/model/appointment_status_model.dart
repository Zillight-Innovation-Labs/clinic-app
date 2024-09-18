import 'package:get/get_rx/src/rx_types/rx_types.dart';

enum AppointmentStatus {
  all,
  upcoming,
  completed,
}

class AppointmentStatusModel {
  AppointmentStatus type;
  String name;
  String icon;
  RxBool isFilterSelected = false.obs;

  AppointmentStatusModel({
    this.type = AppointmentStatus.all,
    this.name = "",
    this.icon = '',
  });
}
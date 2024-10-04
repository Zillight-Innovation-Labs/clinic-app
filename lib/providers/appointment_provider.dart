import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/appointment_apis.dart';
import 'package:kivicare_patient/main.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/utils/app_common.dart';
import 'package:nb_utils/nb_utils.dart';

enum AppointmentState { loading, initial, error, success }

class AppointmentProvider extends ChangeNotifier {
  final AppointmentServiceApis _appointmentServiceApis =
      AppointmentServiceApis();
  AppointModel? selectedUserAppointments;

  AppointModel? selectedCallSchedule;

  AppointmentState _state = AppointmentState.initial;
  AppointmentState get state => _state;

  void setState(AppointmentState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> addSelectedAppointment(AppointModel apoint) async {
    selectedUserAppointments = apoint;
    notifyListeners();
  }

  Future<void> addBooking(AppointModel book) async {
    selectedCallSchedule = book;
    notifyListeners();
  }

  Future<void> removeSchedule() async {
    selectedCallSchedule = null;
    notifyListeners();
  }

  Future<void> removedDate() async {
    selectedUserAppointments = null;
    notifyListeners();
  }

  Future<void> bookAppointment({
    required String appointmentTime,
    required String appointmenDate,
  }) async {
    setState(AppointmentState.loading);
    try {
      final response = await _appointmentServiceApis.bookAppoinment(
        userId: loginUserData.value.id.toString(),
        appointmentTime: appointmentTime,
        appointmenDate: appointmenDate,
      );
      if (response.isError) {
        setState(AppointmentState.error);
      } else {
        setState(AppointmentState.success);
        toast("Appointment created successfully");
        removedDate();
        notifyListeners();
      }
    } catch (e) {
      setState(AppointmentState.error);
    }
  }
}

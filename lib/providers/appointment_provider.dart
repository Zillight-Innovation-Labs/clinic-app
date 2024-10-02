import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/appointment_apis.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/utils/app_common.dart';

enum AppointmentState { loading, initial, error, success }

class AppointmentProvider extends ChangeNotifier {
  final AppointmentServiceApis _appointmentServiceApis =
      AppointmentServiceApis();
  final List<AppointModel> _selectedUserAppointments = [];
  List<AppointModel> get selectedUserAppointments => _selectedUserAppointments;

  AppointModel? selectedCallSchedule;

  AppointmentState _state = AppointmentState.initial;
  AppointmentState get state => _state;

  void setState(AppointmentState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> addSelectedAppointment(AppointModel apoint) async {
    _selectedUserAppointments.add(apoint);
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

  Future<void> removedDate(AppointModel date) async {
    if (selectedUserAppointments.contains(date)) {
      selectedUserAppointments.remove(date);
    }
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
        notifyListeners();

        // dialogHandler.showDialog(
        //   arguments: const ErrorDialogArgs(
        //     errorMessage: "Request sent",
        //     color: Palette.purple,
        //   ),
        // );
      }
    } catch (e) {
      setState(AppointmentState.error);
      // dialogHandler.showDialog(
      //   arguments: const ErrorDialogArgs(
      //     errorMessage: "Something went wrong",
      //   ),
      // );
    }
  }
}

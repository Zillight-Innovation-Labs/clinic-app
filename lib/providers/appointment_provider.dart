import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/appointment_apis.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/utils/app_common.dart';
import 'package:nb_utils/nb_utils.dart';

import 'dart:developer' as dev;

enum AppointmentState { loading, initial, error, success }

class AppointmentProvider extends ChangeNotifier {
  final List<AppointModel> _selectedUserAppointments = [];
  List<AppointModel> get selectedUserAppointments => _selectedUserAppointments;

  final List<AppointModel> _selectedUserBooking = [];
  List<AppointModel> get selectedUserBooking => _selectedUserBooking;

  AppointmentState _state = AppointmentState.initial;
  AppointmentState get state => _state;

  final AppointmentServiceApis _appointmentServiceApis =
      AppointmentServiceApis();

  void setState(AppointmentState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> addSelectedAppointment(AppointModel apoint) async {
    _selectedUserAppointments.add(apoint);
    notifyListeners();
  }

  Future<void> addBooking(AppointModel book) async {
    _selectedUserBooking.add(book);
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

import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/appointment_apis.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/screens/booking/model/appointment_model.dart';
import 'package:kivicare_patient/utils/app_common.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

enum AppointmentState { loading, initial, error, success }

class AppointmentProvider extends ChangeNotifier {
  final AppointmentServiceApis _appointmentServiceApis =
      AppointmentServiceApis();

  List<Appointment> _getAppointmentModel = [];
  List<Appointment>? get getAppointmentModel => _getAppointmentModel;
//
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

  Future<void> getAppointment() async {
    try {
      final response = await _appointmentServiceApis.getAppointment(
        userId: loginUserData.value.id.toString(),
      );

      if (response.isError) {
        setState(AppointmentState.error);
      } else {
        setState(AppointmentState.success);

        // Access the 'appointments' field from the response data
        if (response.data['appointments'] is List) {
          _getAppointmentModel = List<Appointment>.from(
            response.data['appointments']
                .map((connects) => Appointment.fromJson(connects)),
          );

          // dev.log("_getAppointmentModel data: ${_getAppointmentModel}");
        } else {
          throw Exception("Unexpected data format");
        }

        notifyListeners();
      }
    } catch (e) {
      dev.log("catch error  $e");
      setState(AppointmentState.error);
    }
  }

  void clearData() {
    _getAppointmentModel = [];
    notifyListeners();
  }
}

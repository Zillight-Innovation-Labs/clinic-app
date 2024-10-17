import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/appointment_apis.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/screens/booking/model/appointment_model.dart';
import 'package:kivicare_patient/screens/booking/model/subscription_model.dart';
import 'package:kivicare_patient/utils/app_common.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

enum AppointmentState { loading, initial, error, success }

class AppointmentProvider extends ChangeNotifier {
  final AppointmentServiceApis _appointmentServiceApis =
      AppointmentServiceApis();

  List<Appointment> _getAppointmentModel = [];
  List<Appointment>? get getAppointmentModel => _getAppointmentModel;
  List<SubscriptionModel> _getSubscriptionModel = [];
  List<SubscriptionModel>? get getSubscriptionModel => _getSubscriptionModel;

  SubscriptionModel? _firstSubscription;
  SubscriptionModel? get firstSubscription => _firstSubscription;

  Appointment? _nextAppointment;
  Appointment? get nextAppointment => _nextAppointment; 

  int? _firstSubscriptionDay;
  int? get firstSubscriptionDay => _firstSubscriptionDay;

  int? _nextAppointmentDay;
  int? get nextAppointmentDay => _nextAppointmentDay;

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

          _getAppointmentModel
              .sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

          _storeNextAppointment();
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

  Future<void> getSubscription() async {
    try {
      final response = await _appointmentServiceApis.getSubscription(
        userId: loginUserData.value.id.toString(),
      );

      if (response.isError) {
        setState(AppointmentState.error);
      } else {
        setState(AppointmentState.success);

        // Convert the response data to List<SubscriptionModel>
        _getSubscriptionModel = (response.data as List)
            .map((item) => SubscriptionModel.fromJson(item))
            .toList();

        _getSubscriptionModel
            .sort((a, b) => b.createdAt.compareTo(a.createdAt));

        // Store the first subscription model
        _storeFirstSubscription();

        notifyListeners();
      }
    } catch (e) {
      dev.log("catch error  $e");
      setState(AppointmentState.error);
    }
  }

  void _storeFirstSubscription() {
    if (_getSubscriptionModel.isNotEmpty) {
      _firstSubscription = _getSubscriptionModel.first;

      _firstSubscriptionDay =
          getDayNumberDateTime(_firstSubscription!.createdAt);

      // dev.log("First subscription: ${_firstSubscriptionDay}");
    } else {
      _firstSubscription = null;
    }
  }

  void _storeNextAppointment() {
    if (_getAppointmentModel.isNotEmpty) {
      _nextAppointment = _getAppointmentModel.first;

      _nextAppointmentDay = getDayNumber(_nextAppointment!.appointmentDate!);

      dev.log(" _nextAppointment: ${_nextAppointment!.appointmentTime}");
    } else {
      _firstSubscription = null;
    }
  }

//
  void clearData() {
    _getAppointmentModel = [];
    _getSubscriptionModel = [];
    _firstSubscription = null;
    notifyListeners();
  }
}

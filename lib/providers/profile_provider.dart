import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/profile_apis.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/models/exercise_model.dart';
import 'package:kivicare_patient/screens/booking/model/appointment_model.dart';
import 'package:kivicare_patient/utils/app_common.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

enum ProfileState { loading, initial, error, success }

class ProfileProvider extends ChangeNotifier {
  final ProfileServiceApis _profileServiceApis = ProfileServiceApis();

  List<Appointment> _getAppointmentModel = [];
  List<Appointment>? get getAppointmentModel => _getAppointmentModel;

  List<Exercise> _getExerciseModel = [];
  List<Exercise>? get getExerciseModel => _getExerciseModel;

  AppointModel? selectedUserAppointments;
  AppointModel? selectedCallSchedule;

  ProfileState _state = ProfileState.initial;
  ProfileState get state => _state;

  void setState(ProfileState state) {
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
    setState(ProfileState.loading);
    try {
      final response = await _profileServiceApis.bookAppoinment(
        userId: loginUserData.value.id.toString(),
        appointmentTime: appointmentTime,
        appointmenDate: appointmenDate,
      );
      if (response.isError) {
        setState(ProfileState.error);
      } else {
        setState(ProfileState.success);
        toast("Appointment created successfully");
        removedDate();
        notifyListeners();
      }
    } catch (e) {
      setState(ProfileState.error);
    }
  }

  Future<void> getExercise() async {
    try {
      final response = await _profileServiceApis.getExercise();

      if (response.isError) {
        setState(ProfileState.error);
      } else {
        setState(ProfileState.success);

        // dev.log("ProfileProvider:${response.data}");

        if (response.data['exercises'] is List) {
          _getExerciseModel = List<Exercise>.from(
            response.data['exercises']
                .map((connects) => Exercise.fromJson(connects)),
          );

          // dev.log("_getExerciseModel data: ${_getExerciseModel}");
        } else {
          throw Exception("Unexpected data format");
        }

        notifyListeners();
      }
    } catch (e) {
      dev.log("catch error  $e");
      setState(ProfileState.error);
    }
  }

  Future<void> postExercise({
    required String exerciseId,
    required String exerciseTime,
  }) async {
    try {
      dev.log("exerciseId:$exerciseId");
      dev.log("exerciseTime:$exerciseTime");
      final response = await _profileServiceApis.postExercise(
        exericseId: "",
        userId: loginUserData.value.id.toString(),
        time: '',
      );

      if (response.isError) {
        setState(ProfileState.error);
      } else {
        setState(ProfileState.success);

        notifyListeners();
      }
    } catch (e) {
      dev.log("catch error  $e");
      setState(ProfileState.error);
    }
  }

  void clearData() {
    _getAppointmentModel = [];
    notifyListeners();
  }
}

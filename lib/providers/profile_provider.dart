import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/profile_apis.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/models/exercise_model.dart' as exercise;
import 'package:kivicare_patient/models/user_exercises_model.dart';
import 'package:kivicare_patient/screens/booking/model/appointment_model.dart';
import 'package:kivicare_patient/service/notification_services.dart';
import 'package:kivicare_patient/utils/app_common.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

enum ProfileState { loading, initial, error, success }

class ProfileProvider extends ChangeNotifier {
  final ProfileServiceApis _profileServiceApis = ProfileServiceApis();

  List<Appointment> _getAppointmentModel = [];
  List<Appointment>? get getAppointmentModel => _getAppointmentModel;

  List<exercise.Exercise> _getExerciseModel = [];
  List<exercise.Exercise>? get getExerciseModel => _getExerciseModel;

  List<UserExercise> _getUserExerciseModel = [];
  List<UserExercise>? get getUserExerciseModel => _getUserExerciseModel;

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

        if (response.data['exercises'] is List) {
          _getExerciseModel = List<exercise.Exercise>.from(
            response.data['exercises']
                .map((connects) => exercise.Exercise.fromJson(connects)),
          );
        } else {
          throw Exception("Unexpected data format");
        }

        notifyListeners();
      }
    } catch (e) {
      dev.log("catch error profile1 $e");
      setState(ProfileState.error);
    }
  }

  Future<void> postExercise({
    required String exerciseId,
    required String reminderTime,
  }) async {
    try {
      final response = await _profileServiceApis.postExercise(
        exericseId: int.parse(exerciseId),
        userId: loginUserData.value.id,
        time: formatExerciseTime(reminderTime),
      );

      if (response.isError) {
        setState(ProfileState.error);
      } else {
        setState(ProfileState.success);
        getUserExercise();
      }
    } catch (e) {
      dev.log("catch error profile 3  $e");
      setState(ProfileState.error);
    }
  }

  Future<void> getUserExercise() async {
    try {
      final response = await _profileServiceApis.getUserExercise(
        userId: loginUserData.value.id.toString(),
      );

      if (response.isError) {
        setState(ProfileState.error);
      } else {
        setState(ProfileState.success);

        if (response.data['userExercises'] is List) {
          _getUserExerciseModel = List<UserExercise>.from(
            response.data['userExercises']
                .map((exe) => UserExercise.fromJson(exe)),
          );
        } else {
          throw Exception("Unexpected data format");
        }

        _getUserExerciseModel
            .sort((a, b) => b.createdAt.compareTo(a.createdAt));

        notifyExercises(getTimeDifference(_getUserExerciseModel.first.reminderTime));

        notifyListeners();
      }
    } catch (e) {
      dev.log("catch error profile 4  $e");
      setState(ProfileState.error);
    }
  }

  void notifyExercises(int timeInterval) async {
    await NotificationService.showNotification(
        title: "Exercise reminder",
        body: "Its time for your daily exercise",
        payload: {
          "navigate": "true",
          "exerciseName": "",
        },
        scheduled: true,
        interval: timeInterval,
        actionButtons: [
          NotificationActionButton(
            key: 'check',
            label: 'Preview',
            actionType: ActionType.Default,
            color: Colors.green,
          )
        ]);
  }

  void clearData() {
    _getAppointmentModel = [];
    notifyListeners();
  }
}

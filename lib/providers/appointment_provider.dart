import 'package:flutter/material.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'dart:developer' as dev;

class AppointmentProvider extends ChangeNotifier {
  final List<AppointModel> _selectedUserAppointment = [];
  List<AppointModel> get selectedUserAppointment => _selectedUserAppointment;

  Future<void> addSelectedAppointment(AppointModel apoint) async {
    _selectedUserAppointment.add(apoint);

    dev.log("service list-- :${selectedUserAppointment.length}");
    notifyListeners();
  }


  //   Future<void> requestConnection({
  //   required String userId,
  //   required String friendId,
  //   required String senderName,
  // }) async {
  //   try {
  //     final response = await connectionService.requestConnection(
  //       userId: userId,
  //       friendId: friendId,
  //       senderName: senderName,
  //     );
  //     if (response.isError) {
  //       setState(ConnectState.error);
  //     } else {
  //       setState(ConnectState.success);
  //       notifyListeners();

  //       dialogHandler.showDialog(
  //         arguments: const ErrorDialogArgs(
  //           errorMessage: "Request sent",
  //           color: Palette.purple,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     setState(ConnectState.error);
  //     dialogHandler.showDialog(
  //       arguments: const ErrorDialogArgs(
  //         errorMessage: "Something went wrong",
  //       ),
  //     );
  //   }
  // }
}

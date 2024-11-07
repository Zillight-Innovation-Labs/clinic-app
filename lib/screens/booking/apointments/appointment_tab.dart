import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcelerate/components/app_scaffold.dart';
import 'package:healthcelerate/screens/profile/profile_controller.dart';
import 'package:healthcelerate/screens/booking/apointments/mt_book_appoinment.dart';
import 'package:healthcelerate/screens/booking/apointments/appointments_history.dart';

class AppointmentTabs extends StatelessWidget {
  AppointmentTabs({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppScaffoldNew(
        appBartitleText: "Appointment",
        hasLeadingWidget: false,
        isLoading: profileController.isLoading,
        appBarVerticalSize: Get.height * 0.12,
        body: const Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Book Appointment'),
                Tab(text: 'Appointment History'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BookAppoinment(),
                  AppointmentsHistory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

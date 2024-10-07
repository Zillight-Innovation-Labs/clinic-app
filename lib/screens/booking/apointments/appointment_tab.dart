import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/screens/profile/profile_controller.dart';
import 'package:kivicare_patient/screens/booking/apointments/mt_book_appoinment.dart';
import 'package:kivicare_patient/screens/booking/apointments/appointments_history.dart';

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
   
        body: Column(
          children: [
            const TabBar(
            tabs: [
              Tab(text: 'Book Appointment'),
              Tab(text: 'Appointment History'),
            ],
          ),
            Expanded(
              child: TabBarView(
                children: [
                  const BookAppoinment(),
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


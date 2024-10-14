import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/providers/appointment_provider.dart';
import 'package:kivicare_patient/providers/bottom_nav_provider.dart';
import 'package:kivicare_patient/screens/booking/apointments/appointments_history.dart';
import 'package:kivicare_patient/screens/booking/model/appointment_model.dart';
import 'package:kivicare_patient/screens/booking/model/appointments_res_model.dart';
import 'package:kivicare_patient/screens/booking/model/employee_review_data.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../utils/view_all_label_component.dart';
import '../../booking/components/appointment_card.dart';
import '../home_controller.dart';

List<AppointmentData> upcomingAppointment = [
  AppointmentData(
    id: 0,
    status: "pending",
    startDateTime: "2024-10-27T00:00:00.000",
    userId: 0,
    userName: "Toye",
    userImage: "",
    userMobile: "+23456585030w",
    userPhone: "+273727377q",
    clinicId: 0,
    clinicName: "Clinic name",
    doctorId: 0,
    doctorName: "doctorName",
    doctorImage: "",
    doctorMobile: "doctorMobile",
    doctorPhone: "doctorPhone",
    appointmentDate: "2024-10-27T05:10:00.000",
    appointmentTime: "2024-10-27T20:09:20.000",
    endTime: "2024-10-27T00:00:00.000",
    duration: 0,
    serviceId: 0,
    serviceName: "serviceName",
    serviceType: "serviceType",
    serviceImage: "",
    appointmentExtraInfo: "",
    totalAmount: 0,
    servicePrice: 0,
    discountType: "",
    discountValue: 0,
    discountAmount: 0,
    subtotal: 0,
    totalTax: 0,
    paymentStatus: "",
    googleLink: "",
    zoomLink: "",
    medicalReport: [], // List<MedicalReport>,
    encounterId: 0,
    encounterDescription: "",
    encounterStatus: false,
    tax: [], // List<TaxPercentage>

    reviews: DoctorReviewData(),
    createdBy: 0,
    updatedBy: 0,
    deletedBy: 0,
    createdAt: "2024-10-27T00:00:00.000",
    updatedAt: "2024-10-27T00:00:00.000",
    deletedAt: "2024-10-27T00:00:00.000",
  ),
];

class UpcomingAppointmentComponents extends StatelessWidget {
  UpcomingAppointmentComponents({Key? key}) : super(key: key);
  final HomeController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    final appointVm = context.watch<AppointmentProvider>();

    if (appointVm.getAppointmentModel!.isEmpty) {
      return const Offstage();
    }
    Appointment appoint = appointVm.getAppointmentModel![0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        ViewAllLabel(
          label: "Upcoming Appointments",
          isShowAll: true,
          onTap: () {
            context.read<BottomNavProvider>().setNavbarIndex(1);
          },
        ),
        AppointmentCard(appoint: appoint),
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}

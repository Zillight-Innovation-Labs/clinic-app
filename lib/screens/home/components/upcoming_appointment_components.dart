import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/screens/booking/model/appointments_res_model.dart';
import 'package:kivicare_patient/screens/booking/model/employee_review_data.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/view_all_label_component.dart';
import '../../booking/components/appointment_card.dart';
import '../home_controller.dart';

List<AppointmentData> upcomingAppointment = [
  AppointmentData(
    id: 0,
    status: "pending",
    startDateTime: "2023-07-03T00:00:00.000",
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
    appointmentDate: "2023-07-03T05:10:00.000",
    appointmentTime: "2023-07-03T20:09:20.000",
    endTime: "2023-07-03T00:00:00.000",
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
    createdAt: "2023-07-03T00:00:00.000",
    updatedAt: "2023-07-03T00:00:00.000",
    deletedAt: "2023-07-03T00:00:00.000",
  ),
];

class UpcomingAppointmentComponents extends StatelessWidget {
  UpcomingAppointmentComponents({Key? key}) : super(key: key);
  final HomeController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    // if (homeScreenController.dashboardData.value.upcomingAppointment.isEmpty) {
    //   return const Offstage();
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        const ViewAllLabel(label: "Upcoming Appointments", isShowAll: true),
        AppointmentCard(appointment: upcomingAppointment.first),
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}

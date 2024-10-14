import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/providers/appointment_provider.dart';
import 'package:kivicare_patient/screens/booking/model/appointment_model.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/empty_error_state_widget.dart';
import '../appointments_controller.dart';

class AppointmentsHistory extends StatefulWidget {
  const AppointmentsHistory({super.key});

  @override
  State<AppointmentsHistory> createState() => _AppointmentsHistoryState();
}

class _AppointmentsHistoryState extends State<AppointmentsHistory> {
  final AppointmentsController appointmentsCont =
      Get.put(AppointmentsController());

  @override
  void initState() {
    context.read<AppointmentProvider>().getAppointment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appointVm = context.watch<AppointmentProvider>();
    if (appointVm.getAppointmentModel!.isEmpty) {
      return NoDataWidget(
        title: 'No Appointment found',
        imageWidget: const EmptyStateWidget(),
        subTitle: 'There are currently no active appointment available.',
      );
    }
    appointVm.getAppointmentModel!.sort((a, b) {
      DateTime dateA = DateTime.parse(a.createdAt!);
      DateTime dateB = DateTime.parse(b.createdAt!);
      return dateB.compareTo(dateA);
    });
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: ListView.builder(
          itemCount: appointVm.getAppointmentModel!.length,
          itemBuilder: (context, int index) {
            final Appointment appoint = appointVm.getAppointmentModel![index];
            return AppointmentCard(appoint: appoint);
          }),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appoint;
  const AppointmentCard({
    super.key,
    required this.appoint,
  });

  @override
  Widget build(BuildContext context) {
    final appointVm = context.watch<AppointmentProvider>();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 20),
      decoration: boxDecorationDefault(
          color: context.cardColor, shape: BoxShape.rectangle),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          22.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Appointment #${appoint.id.toString()}',
                style: boldTextStyle(size: 14, color: appColorPrimary),
              ),
              Text(
                formatDateToDaysToGo(appoint.appointmentDate!),
                style: boldTextStyle(size: 14, color: appColorPrimary),
              ),
            ],
          ),
          16.height,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: boxDecorationDefault(
                color: lightSecondaryColor, borderRadius: radius(22)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  appoint.appointmentTime!.substring(0, 5),
                  style: boldTextStyle(size: 15, color: appColorSecondary),
                ),
                6.width,
                Text(
                  "|",
                  style: boldTextStyle(size: 13, color: appColorSecondary),
                ),
                6.width,
                Text(
                  "Every ${getDayWithSuffix(appointVm.nextAppointmentDay!)} of the month",
                  // appoint.appointmentDate!.substring(0, 5),
                  style: boldTextStyle(size: 15, color: appColorSecondary),
                ),
              ],
            ),
          ),
          22.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointVm.firstSubscription?.package.service.name ?? "",
                style: boldTextStyle(size: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Online",
                style: secondaryTextStyle(size: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}

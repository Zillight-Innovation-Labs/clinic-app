import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kivicare_patient/providers/appointment_provider.dart';
import 'package:kivicare_patient/screens/booking/model/appointment_model.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../../components/cached_image_widget.dart';
import '../../../components/loader_widget.dart';
import '../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/empty_error_state_widget.dart';
import '../appointments_controller.dart';
import '../components/appointment_card.dart';
import '../model/appointment_status_model.dart';

class AppointmentsHistory extends StatefulWidget {
  AppointmentsHistory({super.key});

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
    return ListView.builder(
        itemCount: appointVm.getAppointmentModel!.length,
        itemBuilder: (context, int index) {
          final Appointment appoint = appointVm.getAppointmentModel![index];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding:
                const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 20),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: boxDecorationDefault(
                      color: lightSecondaryColor, borderRadius: radius(22)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        appoint.appointmentDate!.dateInDMMMMyyyyFormat,
                        style:
                            boldTextStyle(size: 15, color: appColorSecondary),
                      ),
                      6.width,
                      Text(
                        "|",
                        style:
                            boldTextStyle(size: 13, color: appColorSecondary),
                      ),
                      6.width,
                      Text(
                        appoint.appointmentTime!.substring(0, 5),
                        style:
                            boldTextStyle(size: 15, color: appColorSecondary),
                      ),
                    ],
                  ),
                ),
                22.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Healthcare Management",
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
        });

    /*
 
        Container(
      child: Obx(
        () => SnapHelperWidget(
          future: appointmentsCont.getAppointments.value,
          initialData: appointmentsCont.appointments.isNotEmpty
              ? appointmentsCont.appointments
              : null,
          errorBuilder: (error) {
            return NoDataWidget(
              title: error,
              retryText: locale.value.reload,
              imageWidget: const ErrorStateWidget(),
              onRetry: () {
                appointmentsCont.page(1);
                appointmentsCont.getAppointmentList();
              },
            ).paddingSymmetric(horizontal: 16);
          },
          loadingWidget: appointmentsCont.isLoading.value
              ? const Offstage()
              : const LoaderWidget(),
          onSuccess: (booking) {
            return Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HorizontalList(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    spacing: 16,
                    itemCount: appointmentsCont.filterStatus.length,
                    itemBuilder: (ctx, index) {
                      AppointmentStatusModel filterStatus =
                          appointmentsCont.filterStatus[index];
                      return Obx(
                        () => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FilterChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: radius(6),
                                  side: const BorderSide(
                                      color: Colors.transparent)),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              label: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedImageWidget(
                                    url: filterStatus.icon,
                                    fit: BoxFit.fitHeight,
                                    height: 14,
                                    color: appointmentsCont
                                                .selectedTab.value.type ==
                                            filterStatus.type
                                        ? whiteTextColor
                                        : secondaryTextColor,
                                  ),
                                  4.width,
                                  Text(
                                    filterStatus.name,
                                    style: boldTextStyle(
                                      size: 14,
                                      color: appointmentsCont
                                                  .selectedTab.value.type ==
                                              filterStatus.type
                                          ? whiteTextColor
                                          : secondaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              selected: false,
                              backgroundColor:
                                  appointmentsCont.selectedTab.value.type ==
                                          filterStatus.type
                                      ? appColorSecondary
                                      : context.cardColor,
                              onSelected: (bool selected) {
                                appointmentsCont.selectedTab(
                                    appointmentsCont.filterStatus[index]);
                                appointmentsCont.page(1);
                                appointmentsCont.getAppointmentList(
                                    status: appointmentsCont
                                        .selectedTab.value.type
                                        .toString());
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  16.height,
                  AnimatedListView(
                    shrinkWrap: true,
                    itemCount: appointmentsCont.appointments.length,
                    listAnimationType: ListAnimationType.None,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 80),
                    emptyWidget: NoDataWidget(
                      title: 'No Appointments found',
                      imageWidget: const EmptyStateWidget(),
                      subTitle:
                          'There are currently no appointments available. Start booking your next appointment now.',
                    )
                        .paddingSymmetric(horizontal: 16)
                        .paddingBottom(Get.height * 0.1),
                    itemBuilder: (context, index) {
                      return AppointmentCard(
                        appointment: appointmentsCont.appointments[index],
                        onUpdateBooking: () {
                          appointmentsCont.page(1);
                          appointmentsCont.getAppointmentList();
                        },
                      ).paddingBottom(16);
                    },
                    onNextPage: () async {
                      if (!appointmentsCont.isLastPage.value) {
                        appointmentsCont.page(appointmentsCont.page.value + 1);
                        appointmentsCont.getAppointmentList();
                      }
                    },
                    onSwipeRefresh: () async {
                      appointmentsCont.page(1);
                      return await appointmentsCont.getAppointmentList(
                          showLoader: false);
                    },
                  ).expand(),
                ],
              ),
            );
          },
        ).makeRefreshable,
      ).paddingTop(16),
    );
    */
  }
}

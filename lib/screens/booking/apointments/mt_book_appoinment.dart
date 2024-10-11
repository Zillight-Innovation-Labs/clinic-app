import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/components/date_time_appoint_card.dart';
import 'package:kivicare_patient/components/loader.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/providers/appointment_provider.dart';
import 'package:kivicare_patient/screens/booking/components/appointment_card.dart';
import 'package:kivicare_patient/screens/home/components/upcoming_appointment_components.dart';
import 'package:kivicare_patient/screens/service/service_screen.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class BookAppoinment extends StatefulWidget {
  const BookAppoinment({super.key});

  @override
  State<BookAppoinment> createState() => _BookAppoinmentState();
}

class _BookAppoinmentState extends State<BookAppoinment> {
  var index = 0;

  String formatTime = '9.00 am';
  String selectedTime = '';
  String selectedDate = '';

  String selectedMethod = 'Online';
  String selectedConsultation = 'Physical';

  List<IconData> iconList = [
    Icons.sunny,
    FontAwesomeIcons.cloudSun,
    FontAwesomeIcons.cloudMoon,
  ];
  // bool hasActiveAppointment = false;

  @override
  void initState() {
    context.read<AppointmentProvider>().getAppointment();
    context.read<AppointmentProvider>().getSubscription();
    super.initState();
  }

  // bool hasActiveSubscription = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final appointVm = context.watch<AppointmentProvider>();

    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: kbigContainerColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        if (appointVm.getSubscriptionModel!.isNotEmpty) ...{
                          //if there is active subscription
                          Column(
                            children: [
                              if (appointVm
                                  .getAppointmentModel!.isNotEmpty) ...[
                                //if there is active appointment
                                const SizedBox(height: 20),
                                const Text(
                                  "Active Appointment",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: appColorPrimary,
                                      fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                RichText(
                                  overflow: TextOverflow.clip,
                                  text: TextSpan(
                                    text: 'You are currently on a ',
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${appointVm.firstSubscription?.package.name}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: appColorPrimary),
                                      ),
                                      const TextSpan(
                                        text:
                                            ' plan, and your appointment day would be ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${(appointVm.nextAppointment!.appointmentTime!)} every ${appointVm.nextAppointmentDay} of the month',
                                        // '${formatTimenowString(appointVm.nextAppointment!.appointmentTime!)} every ${appointVm.nextAppointmentDay} of the month',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: appColorPrimary),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 10),

                                AppointmentCard(
                                    appointment: upcomingAppointment.first),
                              ] else ...[
                                //inactive
                                RichText(
                                  overflow: TextOverflow.clip,
                                  text: TextSpan(
                                    text: 'You are currently on a ',
                                    style: DefaultTextStyle.of(context).style,
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Basic Personal Health Management',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: appColorPrimary),
                                      ),
                                      TextSpan(
                                        text:
                                            ' plan, Which allows you to book one appointment per month',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          children: [
                                            Text(
                                              "No Active Appointment",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "Book now!",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  selectedTime == "" ||
                                                          selectedDate == ""
                                                      ? appColorPrimary
                                                          .withOpacity(0.5)
                                                      : appColorPrimary),
                                          onPressed: () {
                                            if (selectedTime != "" &&
                                                selectedDate != '') {
                                              final AppointModel model =
                                                  AppointModel(
                                                time: formatTime,
                                                date: selectedDate,
                                                formatedTime: formatSlectedTime(
                                                    selectedTime),
                                              );
                                              context
                                                  .read<AppointmentProvider>()
                                                  .addSelectedAppointment(
                                                      model);
                                              setState(() {
                                                selectedTime = '';
                                                selectedDate = '';
                                              });
                                            }
                                          },
                                          child: Text(
                                            "Add Date ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: selectedTime == "" ||
                                                      selectedDate == ""
                                                  ? white.withOpacity(0.5)
                                                  : white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DatePicker(
                                        DateTime.now(),
                                        height: 100,
                                        initialSelectedDate: DateTime.now(),
                                        selectionColor: appColorPrimary,
                                        selectedTextColor: Colors.white,
                                        deactivatedColor: greenColor,
                                        onDateChange: (date) {
                                          // New date selected
                                          setState(() {
                                            selectedDate =
                                                formatDate(date, true);
                                            // dev.log(":$selectedDate");
                                          });
                                        },
                                      ),
                                    ),
                                    GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: times.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 6,
                                        mainAxisSpacing: 5,
                                        childAspectRatio: 2,
                                      ),
                                      itemBuilder: (_, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              formatTime =
                                                  times[index]['times'];
                                              selectedTime =
                                                  times[index]['time'];
                                            });
                                            // dev.log("formatTime:$formatTime");
                                            // dev.log(
                                            //     "selectedTime:${formatSlectedTime(selectedTime)}");
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: kSubTitleColor
                                                    .withOpacity(0.10),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              color: formatTime ==
                                                      times[index]['times']
                                                  ? appColorPrimary
                                                  : kLikeWhiteColor,
                                            ),
                                            child: Center(
                                              child: Text(
                                                times[index]['times'],
                                                style: TextStyle(
                                                    color: formatTime ==
                                                            times[index]
                                                                ['times']
                                                        ? kLikeWhiteColor
                                                        : kSubTitleColor,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    Builder(builder: (context) {
                                      final appointmentVM =
                                          context.watch<AppointmentProvider>();
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (appointmentVM
                                                  .selectedUserAppointments !=
                                              null) ...{
                                            const Text(
                                              "Selected Appointment Date:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          },
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          if (appointmentVM
                                                  .selectedUserAppointments !=
                                              null) ...[
                                            DateTimeAppointmentCard(
                                              selectedDate: appointmentVM
                                                  .selectedUserAppointments!,
                                            ),
                                          ]
                                        ],
                                      );
                                    }),
                                    SizedBox(
                                      height: size.height * 0.15,
                                    ),
                                  ],
                                ),
                              ]
                            ],
                          ),
                        } else ...[
                          Center(
                            child: Column(
                              children: [
                                SizedBox(height: size.height * 0.1),
                                const Text(
                                  "You don't have an active Service",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: appColorPrimary,
                                      fontSize: 18),
                                ),
                                const Text(
                                  "Click below to select your favourite service",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: appColorPrimary,
                                      fontSize: 16),
                                ),
                                SizedBox(height: size.height * 0.05),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => const ServiceScreen());
                                  },
                                  child: const Text("Explore Services"),
                                )
                              ],
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Consumer<AppointmentProvider>(
                  builder: (context, viewModel, _) {
                if (!appointVm.getAppointmentModel!.isNotEmpty) {
                  if (viewModel.selectedUserAppointments != null) {
                    return AppButton(
                      text: "Proceed",
                      width: size.width * 0.9,
                      enabled: true,
                      textColor: kLikeWhiteColor,
                      enableScaleAnimation: false,
                      color: appColorPrimary,
                      onTap: () {
                        if (viewModel.selectedUserAppointments != null) {
                          final model = AppointModel(
                            date: viewModel.selectedUserAppointments!.date,
                            time: viewModel
                                .selectedUserAppointments!.formatedTime,
                          );
                          //selectedUserAppointments
                          viewModel.bookAppointment(
                            appointmentTime: model.time,
                            appointmenDate: model.date,
                          );
                        }
                      },
                      elevation: 0,
                    );
                  }
                }

                return const SizedBox.shrink();
              }),
            ),
          ),
          Builder(builder: (context) {
            final viewModel = context.watch<AppointmentProvider>();
            if (viewModel.state == AppointmentState.loading) {
              return const LoaderWidget();
            }
            return const SizedBox.shrink();
          })
        ],
      ),
    );
  }
}

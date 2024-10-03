import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/components/bottom_selection_widget.dart';
import 'package:kivicare_patient/components/loader.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/providers/appointment_provider.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

class TalkToDoctor extends StatefulWidget {
  const TalkToDoctor({super.key});

  @override
  State<TalkToDoctor> createState() => _TalkToDoctorState();
}

class _TalkToDoctorState extends State<TalkToDoctor> {
  var index = 0;
  List times = [
    {"time": "9 00 am", "times": "9.00 am"},
    {"time": "9 30 am", "times": "9.30 am"},
    {"time": "10 00 am", "times": "10.00 am"},
    {"time": "10 30 am", "times": "10.30 am"},
    {"time": "11 00 am", "times": "11.00 am"},
    {"time": "11 30 am", "times": "11.30 am"},
    {"time": "12 00 pm", "times": "12.00 pm"},
    {"time": "12 30 pm", "times": "12.30 pm"},
    {"time": "1 00 pm", "times": "1.00 pm"},
    {"time": "1 30 pm", "times": "1.30 pm"},
    {"time": "2 00 pm", "times": "2.00 pm"},
    {"time": "2 30 pm", "times": "2.30 pm"},
    {"time": "3 00 pm", "times": "3.00 pm"},
    {"time": "3 30 pm", "times": "3.30 pm"},
    {"time": "4 00 pm", "times": "4.00 pm"},
    {"time": "4 30 pm", "times": "4.30 pm"},
    // {"time": "5 00 pm", "times": "5.00 pm"},
    // {"time": "5 30 pm", "times": "5.30 pm"},
    // {"time": "6 00 pm", "times": "6.00 pm"},
    // {"time": "6 30 pm", "times": "6.30 pm"},
  ];

  String formatTime = '9.00 am';
  String selectedTime = '';
  String selectedDate = '';

  String isSelected = 'Morning';
  String selectedMethod = 'Online';
  String selectedConsultation = 'Physical';

  List<IconData> iconList = [
    Icons.sunny,
    FontAwesomeIcons.cloudSun,
    FontAwesomeIcons.cloudMoon,
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppScaffoldNew(
      appBartitleText: "Talk To Doctor",
      appBarVerticalSize: Get.height * 0.12,
      body: Stack(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "The Doctor is available",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: appColorPrimary),
                              onPressed: () {
                                serviceCommonBottomSheet(context,
                                    child: SizedBox(
                                      height: size.height * 0.3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              onTap: () {},
                                              leading: const Icon(Icons.phone),
                                              title: const Text("Audio call"),
                                            ),
                                            ListTile(
                                              onTap: () {},
                                              leading:
                                                  const Icon(Icons.video_call),
                                              title: const Text("Video call"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                              child: const Text(
                                "Call now ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Schedule new call",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                        ),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
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
                                  formatTime = times[index]['times'];
                                  selectedTime = times[index]['time'];
                                });
                                // dev.log("formatTime:$formatTime");
                                // dev.log(
                                //     "selectedTime:${formatSlectedTime(selectedTime)}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kSubTitleColor.withOpacity(0.10),
                                  ),
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: formatTime == times[index]['times']
                                      ? appColorPrimary
                                      : kLikeWhiteColor,
                                ),
                                child: Center(
                                  child: Text(
                                    times[index]['times'],
                                    style: TextStyle(
                                        color:
                                            formatTime == times[index]['times']
                                                ? kLikeWhiteColor
                                                : kSubTitleColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        Builder(builder: (context) {
                          final appointmentVM =
                              context.watch<AppointmentProvider>();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (appointmentVM.selectedCallSchedule !=
                                  null) ...{
                                const Text(
                                  "Scheduled Call Time:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              },
                              const SizedBox(
                                height: 10,
                              ),
                              if (appointmentVM.selectedCallSchedule !=
                                  null) ...[
                                DateTimeAppointmentCard(
                                  selectedDate:
                                      appointmentVM.selectedCallSchedule!,
                                )
                              ],
                            ],
                          );
                        }),
                        SizedBox(
                          height: size.height * 0.15,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Consumer<AppointmentProvider>(
                  builder: (context, viewModel, _) {
                if (selectedTime != '') {
                  return AppButton(
                    text: "Proceed",
                    width: size.width * 0.9,
                    enabled: true,
                    textColor: kLikeWhiteColor,
                    enableScaleAnimation: false,
                    color: selectedTime != ''
                        ? appColorPrimary
                        : appColorPrimary.withOpacity(0.5),
                    onTap: () {
                      if (viewModel.selectedCallSchedule == null) {
                        if (selectedTime != "") {
                          final AppointModel model = AppointModel(
                              time: formatTime,
                              formatedTime: formatSlectedTime(selectedTime),
                              date: DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()));
                          viewModel.addBooking(model);
                          setState(() {
                            selectedTime = '';
                            selectedDate = '';
                          });
                        }
                      }
                    },
                    elevation: 0,
                  );
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

class DateTimeAppointmentCard extends StatelessWidget {
  const DateTimeAppointmentCard({
    super.key,
    required this.selectedDate,
  });

  final AppointModel selectedDate;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 10,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ).copyWith(right: 20),
          decoration: BoxDecoration(
            color: appColorPrimary,
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/dateIcon.svg',
                    height: size.height * 0.02,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    selectedDate.date,
                    style: const TextStyle(
                      color: white,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/timeIcon.svg',
                    height: size.height * 0.02,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    selectedDate.time,
                    style: const TextStyle(
                      color: white,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: -8,
          top: -13,
          child: IconButton(
              onPressed: () {
                context.read<AppointmentProvider>().removeSchedule();
              },
              icon: const Icon(
                Icons.cancel,
                color: white,
              )),
        )
      ],
    );
  }
}
//
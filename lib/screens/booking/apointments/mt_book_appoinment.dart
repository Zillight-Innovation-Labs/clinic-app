import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/providers/appointment_provider.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';

import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as dev;

import 'package:provider/provider.dart';

class BookAppoinment extends StatefulWidget {
  const BookAppoinment({super.key});

  @override
  State<BookAppoinment> createState() => _BookAppoinmentState();
}

class _BookAppoinmentState extends State<BookAppoinment> {
  var index = 0;

  List time = [
    {"time": "9 00 am", "times": "9.00 am"},
    "9 00 am",
    "9 30 am",
    "10 00 am",
    "10 30 am",
    "11 00 am",
    "11 30 am",
    "12 00 am",
    "12 30 pm",
    "1 00 pm",
    "1 30 pm",
    "2 00 pm",
    "2 30 pm",
  ];
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
    {"time": "5 00 pm", "times": "5.00 pm"},
    {"time": "5 30 pm", "times": "5.30 pm"},
    {"time": "6 00 pm", "times": "6.00 pm"},
    {"time": "6 30 pm", "times": "6.30 pm"},
  ];

  String isTime = '9.00 am';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
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
                  Text(
                    formatDate(DateTime.now(), false),
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.black),
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
                          selectedDate = formatDate(date, true);
                          selectedDate = formatDate(date, true);
                          dev.log(":$selectedDate");
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Available Time",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: selectedTime == ""
                                ? appColorPrimary.withOpacity(0.5)
                                : appColorPrimary),
                        onPressed: () {
                          if (selectedTime != "") {
                            final AppointModel model = AppointModel(
                              time: selectedTime,
                              date: selectedDate,
                            );
                            context
                                .read<AppointmentProvider>()
                                .addSelectedAppointment(model);
                          }
                        },
                        child: Text(
                          "Add time",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: selectedTime == ""
                                  ? white.withOpacity(0.5)
                                  : white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color: appColorPrimary,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/dateIcon.svg'),
                              const SizedBox(width: 5),
                              Text(
                                selectedDate,
                                style: const TextStyle(color: white),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/timeIcon.svg'),
                              const SizedBox(width: 5),
                              Text(
                                selectedTime,
                                style: const TextStyle(color: white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: times.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6,
                            childAspectRatio: 2),
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isTime = times[index]['times'];
                            selectedTime = times[index]['time'];
                          });
                          dev.log("isTime:${formatSlectedTime(selectedTime)}");
                          // formatTime(isTime);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: kSubTitleColor.withOpacity(0.10)),
                            borderRadius: BorderRadius.circular(6.0),
                            color: isTime == times[index]['times']
                                ? appColorPrimary
                                : kLikeWhiteColor,
                          ),
                          child: Center(
                            child: Text(
                              times[index]['times'],
                              style: TextStyle(
                                  color: isTime == times[index]['times']
                                      ? kLikeWhiteColor
                                      : kSubTitleColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

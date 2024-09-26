import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kivicare_patient/models/appointment_model.dart';
import 'package:kivicare_patient/providers/appointment_provider.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

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
                context.read<AppointmentProvider>().removedDate(
                      selectedDate,
                    );
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
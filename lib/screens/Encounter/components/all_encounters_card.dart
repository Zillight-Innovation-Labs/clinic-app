import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kivicare_patient/utils/common_base.dart';

import '../../../utils/colors.dart';
import '../model/encounter_list_model.dart';

class AllEncountersCard extends StatelessWidget {
  final EncounterElement encounterElement;

  const AllEncountersCard({super.key, required this.encounterElement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationDefault(
        color: context.cardColor,
        borderRadius: radius(defaultRadius / 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Row(
            children: [
              Text("Dr.${encounterElement.doctorName}", style: boldTextStyle(size: 16)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: boxDecorationDefault(
                  borderRadius: BorderRadius.circular(20),
                  color: encounterElement.status ? lightGreenColor : lightSecondaryColor,
                ),
                child: Text(
                  encounterElement.status ? "ACTIVE" : "CLOSED",
                  style: boldTextStyle(
                    size: 10,
                    color: encounterElement.status ? completedStatusColor : pendingStatusColor,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 16),
          8.height,
          Row(
            children: [
              Text('Date:', style: primaryTextStyle(size: 12, color: secondaryTextColor)),
              6.width,
              Text(
                encounterElement.encounterDate.dateInDMMMMyyyyFormat,
                overflow: TextOverflow.ellipsis,
                style: boldTextStyle(size: 12),
              ).expand(),
            ],
          ).paddingSymmetric(horizontal: 16),
          8.height,
          Row(
            children: [
              Text('Clinic Name:', style: primaryTextStyle(size: 12, color: secondaryTextColor)),
              6.width,
              Text(
                encounterElement.clinicName,
                overflow: TextOverflow.ellipsis,
                style: boldTextStyle(size: 12),
              ).expand(),
            ],
          ).paddingSymmetric(horizontal: 16).visible(encounterElement.clinicName.isNotEmpty),
          16.height,
        ],
      ),
    );
  }
}

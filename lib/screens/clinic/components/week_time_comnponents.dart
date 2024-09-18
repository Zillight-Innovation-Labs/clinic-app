import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/app_time_dropdown_widget.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';
import '../model/clinic_detail_model.dart';

class WeekTimeComponent extends StatelessWidget {
  final AllClinicSession weekData;

  const WeekTimeComponent({super.key, required this.weekData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        16.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTimeDropDownWidget(
              value: timeFormat(time: weekData.startTime),
              bgColor: appScreenBackground,
            ).expand(),
            16.width,
            Text(
              "-",
              style: boldTextStyle(size: 20),
            ),
            16.width,
            AppTimeDropDownWidget(
              value: timeFormat(time: weekData.endTime),
              bgColor: appScreenBackground,
            ).expand(),
          ],
        ),
        weekData.breaks.isEmpty ? 0.height : 24.height,
        AnimatedListView(
          shrinkWrap: true,
          itemCount: weekData.breaks.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          listAnimationType: ListAnimationType.None,
          itemBuilder: (ctx, index) {
            BreakListModel breakReport = weekData.breaks[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Break: ${timeFormat(time: breakReport.startBreak)} - ${timeFormat(time: breakReport.endBreak)}",
                  style: primaryTextStyle(size: 12, color: textSecondaryColor),
                ).expand(),
              ],
            ).paddingBottom(6);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';

class AboutClinicComponent extends StatelessWidget {
  const AboutClinicComponent({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.height,
        ReadMoreText(
          parseHtmlString("Etiam ut congue massa. Fusce vel leo gravida, felis a, venenatis ante. Nullam id ligula tempor, convallis dui sed, mattis dolor. Pellentesque vel lacus et nunc aliquam dignissim. Cras vitae viverra"),
          trimLines: 4,
          style: secondaryTextStyle(size: 14, color: secondaryTextColor),
          colorClickableText: appColorPrimary,
          trimMode: TrimMode.Line,
          trimCollapsedText: " ...${"Read More"}",
          trimExpandedText: "Read Less",
          locale: Localizations.localeOf(context),
        ),
        32.height,
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Working Hours",
            style: boldTextStyle(size: 16),
          ),
        ),
        16.height,
        Row(
          children: [
            Text(
              "Monday to Friday",
              style: primaryTextStyle(size: 12, color: secondaryTextColor),
            ).expand(flex: 3),
            Text(
              "8:30 AM - 9:30 PM",
              style: boldTextStyle(size: 12),
            ).expand(flex: 4),
          ],
        ),
        12.height,
        Row(
          children: [
            Text(
              "Saturday to Sunday",
              style: primaryTextStyle(size: 12, color: secondaryTextColor),
            ).expand(flex: 3),
            Text(
              "10:00 AM - 4:30 PM",
              style: boldTextStyle(size: 12),
            ).expand(flex: 4),
          ],
        ),
        80.height,
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}

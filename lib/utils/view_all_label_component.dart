import 'package:flutter/material.dart';
import 'package:healthcelerate/providers/bottom_nav_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:healthcelerate/utils/colors.dart';
import 'package:healthcelerate/utils/constants.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ViewAllLabel extends StatelessWidget {
  final String label;
  final String? trailingText;
  final List? list;
  final VoidCallback? onTap;
  final int? labelSize;
  final bool isShowAll;
  final Color? trailingTextColor;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final bool expandedText;

  const ViewAllLabel({
    super.key,
    required this.label,
    this.onTap,
    this.labelSize,
    this.list,
    this.isShowAll = true,
    this.trailingText,
    this.trailingTextColor,
    this.maxLines,
    this.textOverflow,
    this.expandedText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (expandedText)
          Text(label,
                  style:
                      boldTextStyle(size: labelSize ?? Constants.labelTextSize),
                  maxLines: maxLines ?? 1,
                  overflow: textOverflow)
              .expand()
        else
          Text(label,
              style: boldTextStyle(size: labelSize ?? Constants.labelTextSize)),
        if (isShowAll)
          TextButton(
              onPressed: onTap,
              // () {
              //
              // },
              child: Text('See All',
                  style: boldTextStyle(
                      color: trailingTextColor ?? appColorSecondary, size: 14)))
        else
          46.height,
      ],
    );
  }
}

bool isViewAllVisible(List list) => list.length >= 4;

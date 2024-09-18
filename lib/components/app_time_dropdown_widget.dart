import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colors.dart';

class AppTimeDropDownWidget extends StatelessWidget {
  final String value;
  final double? height;
  final Color? bgColor;

  const AppTimeDropDownWidget({super.key, required this.value, this.height, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.0,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: boxDecorationDefault(color: bgColor ?? white, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              value.split(" ").first,
              style: secondaryTextStyle(size: 12, color: value.isNotEmpty ? blackColor : appBodyColor),
            ),
          ).expand(),
          Container(height: 40.0, width: 1.0, color: borderColor),
          18.width,
          Text(
            value.isEmpty ? "-" : value.split(" ").last.toString(),
            style: secondaryTextStyle(size: 12, color: value.isNotEmpty ? blackColor : appBodyColor),
          ),
          18.width
        ],
      ),
    );
  }
}

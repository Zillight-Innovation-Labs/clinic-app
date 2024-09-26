import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kivicare_patient/utils/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 4.0, sigmaY: 4.0, tileMode: TileMode.mirror),
          child: SpinKitFadingCircle(
            size: 50,
            itemBuilder: (BuildContext context, int index) {
              return const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appColorPrimary,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
//
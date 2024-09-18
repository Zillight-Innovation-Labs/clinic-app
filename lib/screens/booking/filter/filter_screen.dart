import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';

import '../../../utils/colors.dart';
import 'components/type_list_component.dart';
import 'filter_controller.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  final FilterController filterCont = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: 'Filter By',
      appBarVerticalSize: Get.height * 0.12,
      actions: [
        TextButton(
          onPressed: () {
            filterCont.getRest();
          },
          child: Text("Reset", style: boldTextStyle(size: 14, color: whiteTextColor))
        ),
      ],
      body: Container(
        height: Get.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: appScreenBackground,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterTypeListComponent().expand(flex: 1),
                Obx(() => filterCont.viewFilterWidget()),
              ],
            ).expand(),
            Container(
              decoration: boxDecorationDefault(color: whiteTextColor),
              width: Get.width,
              padding: const EdgeInsets.all(16),
              child: filterCont.applyButton(),
            ),
          ],
        ),
      ),
    );
  }
}

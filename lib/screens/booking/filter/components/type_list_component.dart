import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/colors.dart';
import '../filter_controller.dart';

class FilterTypeListComponent extends StatelessWidget {
  FilterTypeListComponent({super.key});

  final FilterController filterCont = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: 80,
      color: white,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: filterCont.filterList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Obx(
            () => InkWell(
              onTap: () {
                filterCont.filterType(filterCont.filterList[index]);
                filterCont.filterType.refresh();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                color: filterCont.filterType.value == filterCont.filterList[index] ? appScreenBackground : white,
                child: Text(
                  "${filterCont.filterList[index]}",
                  style: primaryTextStyle(
                    size: 12,
                    weight: checkFilterType(filterCont.filterList[index]) ? FontWeight.w600 : FontWeight.w500,
                    color: checkFilterType(filterCont.filterList[index]) ? appColorPrimary : darkGrayTextColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool checkFilterType(String type) {
    if (filterCont.filterType.value == type) {
      return true;
    }
    return false;
  }
}

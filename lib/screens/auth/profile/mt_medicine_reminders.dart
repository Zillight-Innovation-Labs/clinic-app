import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:nb_utils/nb_utils.dart';



class MedicineRemindersScreen extends StatefulWidget {
  const MedicineRemindersScreen({Key? key}) : super(key: key);

  @override
  State<MedicineRemindersScreen> createState() =>
      _MedicineRemindersScreenState();
}

class _MedicineRemindersScreenState extends State<MedicineRemindersScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldNew(
      appBartitleText: "Medicine Reminder",
      appBarVerticalSize: Get.height * 0.12,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "12 July, 2022",
                style:
                    TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
              ),
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
                selectionColor: kMainColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: kContainerBgColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            text: "Today",
                            enabled: true,
                            textColor: kMainColor,
                            enableScaleAnimation: false,
                            color: kLikeWhiteColor,
                            onTap: () {},
                            elevation: 0,
                            shapeBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: kMainColor)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AppButton(
                            text: "Week",
                            enabled: true,
                            textColor: kMainColor,
                            enableScaleAnimation: false,
                            color: kLikeWhiteColor,
                            onTap: () {},
                            elevation: 0,
                            shapeBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: kMainColor)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AppButton(
                            text: "Month",
                            enabled: true,
                            textColor: kMainColor,
                            enableScaleAnimation: false,
                            color: kLikeWhiteColor,
                            onTap: () {},
                            elevation: 0,
                            shapeBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: kMainColor)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: kLikeWhiteColor),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Omega 3",
                                          style: ktitleTextStyle.copyWith(
                                              fontSize: 16),
                                        ),
                                        Icon(
                                          Icons.medication,
                                          color: kWatchColor,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "1 capsule  | 300 mg",
                                      style: ksubTitleTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppButton(
                                          text: "Before Eating",
                                          enabled: true,
                                          textColor: kBadgeColor,
                                          enableScaleAnimation: false,
                                          color: kBadgeColor.withOpacity(0.1),
                                          onTap: () {},
                                          elevation: 0,
                                          shapeBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide.none),
                                        ),

                                        Text(
                                          "Breakfast",
                                          style: ksubTitleTextStyle,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) {
                                                    return Dialog(
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                                kLikeWhiteColor,
                                                          borderRadius: BorderRadius.circular(20)
                                                            ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(15.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize.min,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Check Stock",
                                                                    style:
                                                                        ktitleTextStyle,
                                                                  ),
                                                                  Icon(
                                                                    Icons.close,
                                                                    color:
                                                                        kTitleColor,
                                                                  ).onTap(()=>finish(context))
                                                                ],
                                                              ),
                                                              const Text(
                                                                "Program",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              const SizedBox(
                                                                height: 4,
                                                              ),
                                                              Text(
                                                                "Total 4 weeks | 1 week left",
                                                                style:
                                                                    ksubTitleTextStyle,
                                                              ),
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              const Text(
                                                                "Quantity",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,),
                                                              ),
                                                              const SizedBox(
                                                                height: 4,
                                                              ),
                                                              Text(
                                                                "Total 120 capsules | 40 capsules left",
                                                                style:
                                                                    ksubTitleTextStyle,
                                                              ),
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              AppButton(
                                                                width: double.infinity,
                                                                text: "Add Stock",
                                                                textColor: kLikeWhiteColor,
                                                                color: kMainColor,
                                                                onTap: (){},
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },);
                                            },
                                            child: Text(
                                              "View Details",
                                              style:
                                                  TextStyle(color: kMainColor),
                                            ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kivicare_patient/api/const/const.dart';

import 'package:nb_utils/nb_utils.dart';



class BookAppoinment extends StatefulWidget {
  const BookAppoinment({super.key});

  @override
  State<BookAppoinment> createState() => _BookAppoinmentState();
}

class _BookAppoinmentState extends State<BookAppoinment> {
  var index = 0;

  List times = [
    "9.00 am",
    "9.30 am",
    "10.00 am",
    "10.30 am",
    "11.00 am",
    "11.30 am",
    "12.00 am",
    "12.30 pm",
    "1.00 pm",
    "1.30 pm",
    "2.00 pm",
    "2.30 pm",
  ];

  String isTime = '9.00 am';

  List<String> schedule = [
    'Morning',
    'Afternoon',
    'Evening',
  ];

  String isSelected = 'Morning';
  String selectedMethod = 'Online';
  String selectedConsultation = 'Physical';

  List<IconData> iconList = [
    Icons.sunny,
    FontAwesomeIcons.cloudSun,
    FontAwesomeIcons.cloudMoon,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     child: Column(
       children: [
         const SizedBox(
           height: 16,
         ),
         Container(
           decoration: BoxDecoration(
               color: kbigContainerColor,
               borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(20),
                 topRight: Radius.circular(20),
               )),
           child: Padding(
             padding: const EdgeInsets.all(15.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text(
                   "12 July, 2024",
                   style: TextStyle(
                       fontWeight: FontWeight.w700, color: Colors.black),
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
                     deactivatedColor: greenColor,
                     onDateChange: (date) {
                       // New date selected
                       setState(() {});
                     },
                   ),
                 ),
                 const SizedBox(
                   height: 24,
                 ),
                 const Text(
                   "Available Time",
                   style: TextStyle(
                       fontWeight: FontWeight.w700, color: Colors.black),
                 ),
                 // const SizedBox(
                 //   height: 12,
                 // ),
                 // HorizontalList(
                 //   spacing: 10.0,
                 //   itemCount: 3,
                 //   padding: EdgeInsets.zero,
                 //   itemBuilder: (_, i) {
                 //     return GestureDetector(
                 //       onTap: () {
                 //         setState(() {
                 //           isSelected = schedule[i];
                 //         });
                 //       },
                 //       child: Container(
                 //         padding: const EdgeInsets.all(12),
                 //         decoration: BoxDecoration(
                 //           border: Border.all(
                 //             color: kSubTitleColor.withOpacity(0.10),
                 //           ),
                 //           borderRadius: BorderRadius.circular(6.0),
                 //           color: isSelected == schedule[i]
                 //               ? kMainColor
                 //               : kLikeWhiteColor,
                 //         ),
                 //         child: Row(
                 //           mainAxisAlignment:
                 //               MainAxisAlignment.spaceBetween,
                 //           children: [
                 //             Icon(iconList[i],
                 //                 color: isSelected == schedule[i]
                 //                     ? kLikeWhiteColor
                 //                     : kSubTitleColor),
                 //             const SizedBox(
                 //               width: 4,
                 //             ),
                 //             Text(
                 //               schedule[i],
                 //               style: TextStyle(
                 //                   color: isSelected == schedule[i]
                 //                       ? kLikeWhiteColor
                 //                       : kSubTitleColor,
                 //                   fontWeight: FontWeight.w600),
                 //             ),
                 //           ],
                 //         ),
                 //       ),
                 //     );
                 //   },
                 // ),
                 const SizedBox(
                   height: 20,
                 ),
                 GridView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: times.length,
                   gridDelegate:
                       const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 4,
                           crossAxisSpacing: 6,
                           mainAxisSpacing: 6,
                           childAspectRatio: 2),
                   itemBuilder: (_, index) {
                     return GestureDetector(
                       onTap: () {
                         setState(() {
                           isTime = times[index];
                         });
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           border: Border.all(
                               color: kSubTitleColor.withOpacity(0.10)),
                           borderRadius: BorderRadius.circular(6.0),
                           color: isTime == times[index]
                               ? kMainColor
                               : kLikeWhiteColor,
                         ),
                         child: Center(
                           child: Text(
                             times[index],
                             style: TextStyle(
                                 color: isTime == times[index]
                                     ? kLikeWhiteColor
                                     : kSubTitleColor,
                                 fontWeight: FontWeight.w600),
                           ),
                         ),
                       ),
                     );
                   },
                 ),
                 const SizedBox(
                   height: 24,
                 ),
               ],
             ),
           ),
         )
       ],
     ),
          );
  }
}

// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:maan_doctor_appoinment/const/const.dart';
// import 'package:maan_doctor_appoinment/ui/Diagnostics/mt_diagnostics_book_appoinment.dart';
// import 'package:maan_doctor_appoinment/ui/Home/Doctor%20Appoinment/mt_book_appoinment.dart';
// import 'package:maan_doctor_appoinment/ui/Home/Notifications/mt_notifications.dart';
// import 'package:maan_doctor_appoinment/ui/Home/home_card.dart';
// import 'package:maan_doctor_appoinment/ui/Home/mt_next_appointment.dart';
// import 'package:maan_doctor_appoinment/ui/Home/mt_services.dart';
// import 'package:maan_doctor_appoinment/ui/Nursing%20Care/mt_nursing_care.dart';
// import 'package:maan_doctor_appoinment/ui/Styles/style.dart';
// import 'package:maan_doctor_appoinment/ui/utils/util.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:badges/badges.dart' as badges;
// import '../../model/mt_doctor_model.dart';
// import '../Ambulance/mt_ambulance.dart';
// import '../Diagnostics/mt_diagnostics.dart';
// import 'Doctor Appoinment/mt_next_appointment.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   var bannerSlider = [
//     {
//       "text": "Spend time each day\nFocusing on your mental\nhealth",
//       "image": "assets/images/dash-image.png",
//     },
//     {
//       "text": "Allow yourself the\nopportunity to meet\na trained therapist",
//       "image": "assets/images/consult_therapist_image.png",
//     },
//     {
//       "text": "Spend time each day\nFocusing on your mental\nhealth",
//       "image": "assets/images/dash-image.png",
//     },
//     {
//       "text": "Allow yourself the\nopportunity to meet\na trained therapist",
//       "image": "assets/images/consult_therapist_image.png",
//     },
//   ];
//   bool isSearch = false;
//   final FocusNode _focusNode = FocusNode();
//   final PageController _pageController = PageController(initialPage: 0);
//   int _currentPage = 0;

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     _pageController.dispose(); // Clean up the controller

//     super.dispose();
//   }

//   int _current = 0;
//   final CarouselSliderController _controller = CarouselSliderController();

//   void _animateToPage(int pageIndex) {
//     _pageController.animateToPage(
//       pageIndex, // The target page index
//       // Animation duration
//       curve: Curves.easeInOut,
//       duration: const Duration(milliseconds: 500), // Animation curve
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isSearch) {
//       _focusNode.requestFocus();
//     } else {
//       _focusNode.unfocus();
//     }
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         titleSpacing: 0.0,
//         title: ListTile(
//           tileColor: Colors.white,
//           leading: const CircleAvatar(
//             backgroundColor: Colors.white,
//             radius: 25,
//             child: Image(
//               image: AssetImage("assets/images/menmini.png"),
//             ),
//           ),
//           title: Text(
//             "Hey John",
//             style: TextStyle(fontWeight: FontWeight.w600, color: kMainColor),
//           ),
//           trailing: SizedBox(
//             width: 90,
//             child: Row(
//               children: [
//                 Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border:
//                           Border.all(color: kTextFieldBorderColor, width: 1)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       IconlyLight.search,
//                       color: kTitleColor,
//                     ),
//                   ),
//                 ).onTap(() {
//                   setState(() {
//                     isSearch = !isSearch;
//                   });
//                 }),
//                 const SizedBox(width: 10),
//                 Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border:
//                           Border.all(color: kTextFieldBorderColor, width: 1)),
//                   child: badges.Badge(
//                       badgeStyle: badges.BadgeStyle(
//                         badgeColor: kBadgeColor,
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       badgeContent: Text(
//                         "2",
//                         style: TextStyle(color: kLikeWhiteColor),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Icon(
//                           IconlyLight.notification,
//                           color: kTitleColor,
//                         ),
//                       )),
//                 ).onTap(() => const NotificationsScreen().launch(context)),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             AnimatedContainer(
//               duration: const Duration(seconds: 1),
//               curve: Curves.easeInOut,
//               width: isSearch ? MediaQuery.of(context).size.width : 0,
//               height: isSearch ? 90 : 0,
//               padding: isSearch ? const EdgeInsets.all(10.0) : EdgeInsets.zero,
//               child: isSearch
//                   ? Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: TextField(
//                         focusNode: _focusNode,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.zero,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                             borderSide: BorderSide.none,
//                           ),
//                           prefixIcon: Icon(
//                             IconlyLight.search,
//                             color: kTitleColor,
//                           ),
//                           hintText: "Search...",
//                           hintStyle: TextStyle(color: kSubTitleColor),
//                           filled: true,
//                           fillColor: kTextFieldColor,
//                         ),
//                       ),
//                     )
//                   : null,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SizedBox(
//               height: 140,
//               width: size.width,
//               child: PageView.builder(
//                 controller: _pageController,
//                 itemCount: bannerSlider.length,
//                 onPageChanged: (index) {
//                   setState(() {
//                     _currentPage = index;
//                   });
//                 },
//                 itemBuilder: (context, index) {
//                   return const SliderCard();
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: bannerSlider.asMap().entries.map((entry) {
//                       return GestureDetector(
//                         onTap: () {
//                           _animateToPage(entry.key);
//                         },
//                         child: Container(
//                           height: 8,
//                           width: _currentPage == entry.key ? 20 : 10,
//                           margin: const EdgeInsets.symmetric(
//                               vertical: 8.0, horizontal: 4.0),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(3),
//                               color: (Theme.of(context).brightness ==
//                                           Brightness.dark
//                                       ? Colors.white
//                                       : Colors.blue)
//                                   .withOpacity(
//                                       _currentPage == entry.key ? 0.9 : 0.4)),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Column(
//                     children: [
//                       Row(
//                         children: [
//                           HomeCard(
//                             imagePath: "assets/images/diagnostics.png",
//                             title: "Tests",
//                             onTap: () => flushBar(
//                               context,
//                               message: "UI design-screen needed ",
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           HomeCard(
//                             imagePath: "assets/images/nursing.png",
//                             title: "Talk to\nDoctor",
//                             onTap: () => flushBar(
//                               context,
//                               message: "UI design-screen needed ",
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           HomeCard(
//                             imagePath: "assets/images/ambulance.png",
//                             title: "Appointment",
//                             onTap: () {
//                               flushBar(context,
//                                   message: "appointment avatar needed ");
//                               Future.delayed(const Duration(seconds: 3), () {
//                                 const BookAppoinment().launch(context);
//                               });
//                             },
//                           ),
//                           const SizedBox(width: 12),
//                           HomeCard(
//                             imagePath: "assets/images/pharmacy.png",
//                             title: "Medication",
//                             onTap: () => flushBar(
//                               context,
//                               message: "UI design-screen needed ",
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 24,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Next appointment",
//                         style: ktitleTextStyle.copyWith(fontSize: 18.0),
//                       ),
//                       Text(
//                         "View All",
//                         style: ksubTitleTextStyle,
//                       ).onTap(
//                           () => const NextAppointmentScreen().launch(context)),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   HorizontalList(
//                     runSpacing: 0.0,
//                     padding: EdgeInsets.zero,
//                     itemBuilder: (BuildContext context, int index) {
//                       return NextAppointmentCard(index: index);
//                     },
//                     itemCount: allDoctors.length,
//                     spacing: 0.0,
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Tests",
//                         style: ktitleTextStyle,
//                       ),
//                       Text(
//                         "View All",
//                         style: ksubTitleTextStyle,
//                       ).onTap(
//                         () => flushBar(
//                           context,
//                           message: "UI design-screen with tests avatar needed",
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   HorizontalList(
//                     padding: EdgeInsets.zero,
//                     itemCount: 4,
//                     itemBuilder: (BuildContext context, int index) {
//                       return SizedBox(
//                         width: context.width() / 2.2,
//                         child: Card(
//                           elevation: 0,
//                           shape: RoundedRectangleBorder(
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(10)),
//                               side: BorderSide(
//                                   color: kSubTitleColor.withOpacity(0.10))),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const CircleAvatar(
//                                   radius: 30,
//                                   backgroundImage:
//                                       AssetImage("assets/images/covid.png"),
//                                 ),
//                                 const SizedBox(
//                                   height: 16,
//                                 ),
//                                 Text(
//                                   "Covid RT PCR",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       color: kTitleColor),
//                                 ),
//                                 const SizedBox(
//                                   height: 6,
//                                 ),
//                                 FittedBox(
//                                   child: Text(
//                                     "Known as Covid-19 Virus\nQuantitaticve Pcr",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         color: kSubTitleColor),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 6,
//                                 ),
//                                 AppButton(
//                                   text: "Take test",
//                                   textColor: kLikeWhiteColor,
//                                   width: context.width(),
//                                   elevation: 0,
//                                   padding: EdgeInsets.zero,
//                                   enableScaleAnimation: false,
//                                   color: kMainColor,
//                                   onTap: () {
//                                     flushBar(
//                                       context,
//                                       message:
//                                           "UI design-screen with tests avatar needed",
//                                     );
//                                   },
//                                   shapeBorder: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.circular(6)),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Services",
//                         style: ktitleTextStyle,
//                       ),
//                       Text(
//                         "View All",
//                         style: ksubTitleTextStyle,
//                       ).onTap(() {
//                         flushBar(
//                           context,
//                           message:
//                               "UI design-screen with service avatar needed",
//                         );
//                       }),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ServiesList()
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SliderCard extends StatelessWidget {
//   const SliderCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 125,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage("assets/images/dr_appoinment.png"),
//             fit: BoxFit.fill),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 17.0, left: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Doctor Appointment",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: kLikeWhiteColor,
//                   fontSize: 18.0),
//             ),
//             Text(
//               "Online consultancy of\npopular doctor",
//               style: TextStyle(color: kLikeWhiteColor.withOpacity(0.9)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ListContainer extends StatefulWidget {
//   final bool isShowPop;
//   final ValueChanged<String> onItemSelected;

//   const ListContainer({
//     Key? key,
//     required this.isShowPop,
//     required this.onItemSelected,
//   }) : super(key: key);

//   @override
//   _ListContainerState createState() => _ListContainerState();
// }

// class _ListContainerState extends State<ListContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//       width: widget.isShowPop ? MediaQuery.of(context).size.width * 0.9 : 0,
//       height: widget.isShowPop ? 150 : 0,
//       padding: widget.isShowPop ? const EdgeInsets.all(10.0) : EdgeInsets.zero,
//       child: widget.isShowPop
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () => widget.onItemSelected('Services'),
//                   child: const Text('Services', style: TextStyle(fontSize: 18)),
//                 ),
//                 const SizedBox(height: 10),
//                 GestureDetector(
//                   onTap: () => widget.onItemSelected('Appointment'),
//                   child:
//                       const Text('Appointment', style: TextStyle(fontSize: 18)),
//                 ),
//                 const SizedBox(height: 10),
//                 GestureDetector(
//                   onTap: () => widget.onItemSelected('Tests'),
//                   child: const Text('Tests', style: TextStyle(fontSize: 18)),
//                 ),
//               ],
//             )
//           : null,
//     );
//   }
// }

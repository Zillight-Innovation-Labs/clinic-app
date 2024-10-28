// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:kivicare_patient/api/const/const.dart';
// import 'package:nb_utils/nb_utils.dart';


// class TrackOrderScreen extends StatefulWidget {
//   const TrackOrderScreen({Key? key}) : super(key: key);

//   @override
//   State<TrackOrderScreen> createState() => _TrackOrderScreenState();
// }

// class _TrackOrderScreenState extends State<TrackOrderScreen> {

//   GoogleMapController? mapController; //contrller for Google map
//   // ignore: prefer_collection_literals
//   Set<Marker> markers = Set(); //markers for google map
//   LatLng showLocation = const LatLng(27.7089427, 85.3086209);

//   @override
//   void initState() {
//     markers.add(Marker(
//       //add marker on google map
//       markerId: MarkerId(showLocation.toString()),
//       position: showLocation, //position of marker
//       infoWindow: const InfoWindow(
//         //popup info
//         title: 'Your Current Location',
//         snippet: 'Set it as Delivery Address',
//       ),
//       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//     ));
//     super.initState();
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: const BackButton(color: Colors.black),
//         elevation: 0,
//         title:  Text(
//           "Track Your Order",
//           style: TextStyle(color: kTitleColor,fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           GoogleMap(
//             //Map widget from google_maps_flutter package
//             zoomGesturesEnabled: true,
//             //enable Zoom in, out on map
//             initialCameraPosition: CameraPosition(
//               //innital position in map
//               target: showLocation, //initial position
//               zoom: 10.0, //initial zoom level
//             ),
//             markers: markers,
//             //markers to show on map
//             mapType: MapType.normal,
//             //map type
//             onMapCreated: (controller) {
//               //method called when map is created
//               setState(() {
//                 mapController = controller;
//               });
//             },
//           ),
//           Container(
//             height: context.height() / 2,
//             decoration:  BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(35),
//                   topRight: Radius.circular(35),
//                 ),
//                 color: kMainColor),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: ListTile(
//                 leading: const CircleAvatar(
//                   backgroundImage: AssetImage("assets/images/order-confirm.png"),
//                   radius: 30,

//                 ),
//                 title:  Text(
//                   "Ibne Riead",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold, color: kLikeWhiteColor),
//                 ),
//                 subtitle: Text(
//                   "Pharmecy Courier",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: kLikeWhiteColor),
//                 ),
//                 trailing: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(
//                       Icons.star,
//                       color: kStarColor,
//                     ),
//                     Text(
//                       " 5.0",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w400, color: kLikeWhiteColor),
//                     ),
//                     Text(
//                       " (27)",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           color:kLikeWhiteColor.withOpacity(0.6)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: context.height() / 2.65,
//             decoration:  BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(35),
//                   topRight: Radius.circular(35),
//                 ),
//                 color: kLikeWhiteColor),
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   ListTile(
//                     contentPadding: EdgeInsets.zero,
//                     leading: Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: kWatchColor.withOpacity(0.10),
//                       ),
//                       child:  Icon(
//                         IconlyBold.location,
//                         color: kWatchColor,
//                       ),
//                     ),
//                     title:  Text(
//                       "Addrass",
//                       style: TextStyle(
//                           color: kSubTitleColor),
//                     ),
//                     subtitle:  Text(
//                       "421 Duke street, M54ader",
//                       style: TextStyle(
//                           color: kTitleColor),
//                     ),
//                   ),
//                   ListTile(
//                     contentPadding: EdgeInsets.zero,
//                     leading: Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: kBadgeColor.withOpacity(0.10),
//                       ),
//                       child:  Icon(
//                         IconlyBold.timeCircle,
//                         color: kBadgeColor,
//                       ),
//                     ),
//                     title:  Text(
//                       "Delivery Time",
//                       style: TextStyle(
//                           color: kSubTitleColor),
//                     ),
//                     subtitle:  Text(
//                       "20-30 minutes",
//                       style: TextStyle(
//                           color: kTitleColor),
//                     ),
//                   ),
//                   ListTile(
//                     contentPadding: EdgeInsets.zero,
//                     leading: Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: kStarColor.withOpacity(0.10),
//                       ),
//                       child:  Icon(

//                         IconlyBold.shieldDone,
//                         color: kStarColor,
//                       ),
//                     ),
//                     title:  Text(
//                       "Order#",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w400, color: kSubTitleColor),
//                     ),
//                     subtitle:  Text(
//                       "15462",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w400, color: kTitleColor),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

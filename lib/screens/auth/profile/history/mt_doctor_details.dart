import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/screens/auth/model/mt_doctor_model.dart';
import 'package:kivicare_patient/screens/booking/apointments/mt_book_appoinment.dart';
import 'package:nb_utils/nb_utils.dart';


class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  var index = 0;

  List galleryImages = [
    "assets/images/gimg1.png",
    "assets/images/gimg2.png",
    "assets/images/gimg3.png",
    "assets/images/gimg1.png",
    "assets/images/gimg2.png",
    "assets/images/gimg3.png",
  ];

  List reviewImages = [
    "assets/images/review_man.png",
    "assets/images/review_women.png",
    "assets/images/review_man.png",
    "assets/images/review_women.png",
    "assets/images/review_man.png",
    "assets/images/review_women.png",
    "assets/images/review_man.png",
    "assets/images/review_women.png",
    "assets/images/review_man.png",
    "assets/images/review_women.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: kTitleColor,
          ),
          title: Text(
            "Doctor Details",
            style: ktitleTextStyle,
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                color: kLikeWhiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), color: kMainColor.withOpacity(0.10)),
                  child: Icon(
                    IconlyBold.heart,
                    color: kMainColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AppButton(
                    enableScaleAnimation: false,
                    onTap: () => const BookAppoinment().launch(context),
                    shapeBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                    color: kMainColor,
                    text: "Book Appointment",
                    textStyle: TextStyle(color: kElevatedButtonTextColor, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 82,
                          height: 82,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(image: AssetImage(allDoctors[index].image ?? ''), fit: BoxFit.fill)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              allDoctors[index].doctorName ?? '',
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: context.width() / 1.5,
                              child: Text(
                                "National Institute of Cancer Research & Hospital, (Cancer Specialist)",
                                maxLines: 2,
                                style: TextStyle(color: kSubTitleColor),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: context.width() / 2.2,
                          height: context.height() / 7.7,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), color: kDrContainerColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: kWatchColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset("assets/images/drexp.png"),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "7 Years",
                                    style: ktitleTextStyle,
                                  ),
                                  Text(
                                    "Experiences",
                                    style: ksubTitleTextStyle,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: context.width() / 2.2,
                          height: context.height() / 7.7,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), color: kPatientContainerColor),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: kStarColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset(
                                    "assets/images/drexp.png",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "5,000+",
                                    style: TextStyle(fontWeight: FontWeight.w600, color: kTitleColor),
                                  ),
                                  Text(
                                    "Patient",
                                    style: TextStyle(fontWeight: FontWeight.w400, color: kSubTitleColor),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                    color: kbigContainerColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Biography",
                        style: ktitleTextStyle,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        biography,
                        style: ksubTitleTextStyle,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Gallery",
                        style: ktitleTextStyle,
                      ),
                      HorizontalList(
                        itemCount: galleryImages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: context.height() / 5.5,
                            width: context.width() / 3.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(
                                  galleryImages[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Text(
                        "Availability",
                        style: ktitleTextStyle,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Mon - Fri 09.00 AM - 08.00 PM",
                        style: ksubTitleTextStyle,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Review (${allDoctors[index].ratingCount})",
                            style: ktitleTextStyle,
                          ),
                          Row(
                            children: [
                              Icon(
                                IconlyBold.star,
                                size: 12,
                                color: kStarColor,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "${allDoctors[index].ratings}",
                                style: ktitleTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: reviewImages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: context.width(),
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: kSubTitleColor.withOpacity(0.10))),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      minVerticalPadding: 0.0,
                                      leading: CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage(reviewImages[index]),
                                      ),
                                      title: Text(
                                        "Jerome Bell",
                                        style: TextStyle(fontWeight: FontWeight.w500, color: kTitleColor),
                                      ),
                                      subtitle: RatingBarWidget(
                                        size: 14,
                                        onRatingChanged: (value) {},
                                        itemCount: 5,
                                        rating: 4,
                                        activeColor: kStarColor,
                                        inActiveColor: kStarColor,
                                      ),
                                      trailing: Text(
                                        "31 Min Ago",
                                        style: TextStyle(color: kSubTitleColor),
                                      ),
                                    ),
                                    Text(
                                      reviewWomen,
                                      style: TextStyle(fontWeight: FontWeight.w400, color: kSubTitleColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/const/const.dart';
import 'package:kivicare_patient/screens/home/home_bottom_tabs.dart';
import 'package:nb_utils/nb_utils.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Write a Review',
          style: ktitleTextStyle,
        ),
        elevation: 0,
        leading: BackButton(
          color: kTitleColor,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14.0),
        child: AppButton(
          text: "Submit Review",
          textColor: kLikeWhiteColor,
          elevation: 0,
          color: kMainColor,
          onTap: ()=>const HomeBottomNavBarScreen().launch(context),
          //  padding: EdgeInsets.zero,
          shapeBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(6)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: kbigContainerColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/drhand.png"),
                          radius: 40,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: Text(
                          "haw was your exprience with",
                          style: TextStyle(
                            color: kSubTitleColor,
                          ),
                        ),
                      ),

                      Center(
                        child: Text(
                          "Dr. Josiah Toor",
                          style: TextStyle(
                            color: kMainColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),

                      Text(
                        "Select Rating",
                        style: TextStyle(
                            color: kTitleColor, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RatingBarWidget(
                        onRatingChanged: (val) {},
                        itemCount: 5,
                        rating: 4,
                        activeColor: kStarColor,
                        inActiveColor: kSubTitleColor,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      AppTextField(
                          textFieldType: TextFieldType.MULTILINE,
                          decoration: InputDecoration(
                              label: const Text("Write a Comment"),
                              labelStyle: TextStyle(color: kTitleColor),
                              hintText: "Enter card holder name",
                              hintStyle: TextStyle(color: kSubTitleColor),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kTextFieldBorderColor,
                                      width: 1)))),

                      //  SizedBox(height: 40,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

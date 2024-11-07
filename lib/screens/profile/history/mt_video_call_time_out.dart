import 'package:flutter/material.dart';
import 'package:healthcelerate/api/const/const.dart';
import 'package:nb_utils/nb_utils.dart';
import 'mt_write_review.dart';

class VideoCallTimeOutScreen extends StatelessWidget {
  const VideoCallTimeOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: kTitleColor,
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
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/drhand.png"),
                        radius: 40,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Dr. Josiah Toor",
                        style: TextStyle(
                            fontSize: 24,
                            color: kTitleColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Time end for video calling appointment",
                        style: TextStyle(
                          color: kSubTitleColor,
                        ),
                      ),
                      Text(
                        "12:08 Min",
                        style: TextStyle(
                          color: kMainColor,
                        ),
                      ),
                      const SizedBox(
                        height: 105,
                      ),
                      AppButton(
                        text: "Write a Review",
                        enableScaleAnimation: false,
                        textColor: kLikeWhiteColor,
                        width: context.width(),
                        elevation: 0,
                        color: kMainColor,
                        onTap: () => const WriteReviewScreen().launch(context),
                        //  padding: EdgeInsets.zero,
                        shapeBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AppButton(
                        text: "Back to Home",
                        textColor: kMainColor,
                        width: context.width(),
                        enableScaleAnimation: false,
                        elevation: 0,
                        color: kLikeWhiteColor,
                        onTap: () {},
                        //  padding: EdgeInsets.zero,
                        shapeBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kMainColor),
                            borderRadius: BorderRadius.circular(6)),
                      ),

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

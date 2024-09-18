import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../components/cached_image_widget.dart';
import '../../../utils/colors.dart';

class ProfilePicHorizotalWidget extends StatelessWidget {
  final double picSize;
  final String profileImage;
  final String heroTag;
  final String firstName;
  final String lastName;
  final String userName;
  final String subInfo;
  final Function()? onCameraTap;
  final Function()? onPicTap;
  final bool showOnlyPhoto;
  final bool showCameraIconOnCornar;
  const ProfilePicHorizotalWidget({
    super.key,
    this.picSize = 70,
    required this.profileImage,
    required this.heroTag,
    this.firstName = "",
    this.lastName = "",
    required this.userName,
    this.subInfo = "",
    this.onCameraTap,
    this.onPicTap,
    this.showCameraIconOnCornar = true,
    this.showOnlyPhoto = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: boxDecorationDefault(),
      child: Stack(
        children: [
          Row(
            children: [
              16.width,
              GestureDetector(
                onTap: onPicTap,
                child: SizedBox(
                  height: picSize + 16,
                  width: picSize + 16,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircularPercentIndicator(
                        radius: (picSize * 0.5) + 8,
                        lineWidth: 1.5,
                        percent: 1,
                        startAngle: 360 - 20,
                        progressColor: appColorSecondary,
                        fillColor: transparentColor,
                        circularStrokeCap: CircularStrokeCap.round,
                        backgroundColor: transparentColor,
                        center: Hero(
                          tag: heroTag,
                          child: CachedImageWidget(
                            url: profileImage,
                            firstName: firstName,
                            lastName: lastName,
                            height: picSize,
                            width: picSize,
                            fit: BoxFit.cover,
                            circle: true,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 26,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(3),
                          decoration: boxDecorationDefault(borderRadius: radius(100), color: context.cardColor),
                          child: AppButton(
                            height: 20,
                            width: 88,
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            elevation: 0,
                            shapeBorder: RoundedRectangleBorder(borderRadius: radius(100)),
                            color: appColorSecondary,
                            onTap: onCameraTap,
                            child: Text("EDIT", style: boldTextStyle(size: 12, color: white)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (!showOnlyPhoto) ...[
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName, style: boldTextStyle(size: 20)),
                    4.height,
                    Text(subInfo, style: primaryTextStyle(size: 14, color: secondaryTextColor)),
                  ],
                ).expand(),
                /* IconButton(
                  onPressed: onCameraTap,
                  icon: const CachedImageWidget(
                    url: Assets.iconsIcEditReview,
                    height: 20,
                    fit: BoxFit.fitHeight,
                  ),
                ), */
              ],
            ],
          ),
        ],
      ),
    );
  }
}

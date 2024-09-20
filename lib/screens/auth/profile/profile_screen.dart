import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/screens/auth/profile/history/mt_history.dart';
import 'package:kivicare_patient/screens/auth/profile/mt_excersize_reminder.dart';
import 'package:kivicare_patient/screens/auth/profile/mt_medicine_reminders.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../components/app_scaffold.dart';
import '../../../generated/assets.dart';
import '../../../main.dart';
import 'common_horizontal_profile_widget.dart';
import 'edit_user_profile_controller.dart';
import 'profile_controller.dart';
import '../../../utils/app_common.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';
import '../other/settings_screen.dart';
import '../other/about_us_screen.dart';
import 'edit_user_profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffoldNew(
        appBartitleText: "Profile",
        hasLeadingWidget: false,
        isLoading: profileController.isLoading,
        appBarVerticalSize: Get.height * 0.12,
        body: AnimatedScrollView(
          padding: const EdgeInsets.only(top: 16, bottom: 80),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => ProfilePicHorizotalWidget(
                    heroTag: loginUserData.value.profileImage,
                    profileImage: loginUserData.value.profileImage,
                    firstName: loginUserData.value.firstName,
                    lastName: loginUserData.value.lastName,
                    userName: loginUserData.value.userName,
                    subInfo: loginUserData.value.email,
                    onCameraTap: () {
                      EditUserProfileController editUserProfileController = EditUserProfileController(isProfilePhoto: true);
                      editUserProfileController.showBottomSheet(context);
                    },
                  ),
                ),
                16.height,
                SettingItemWidget(
                  decoration: boxDecorationDefault(),
                  title: locale.value.editProfile,
                  subTitle: locale.value.personalizeYourProfile,
                  splashColor: transparentColor,
                  onTap: () {
                    Get.to(() => EditUserProfileScreen(), duration: const Duration(milliseconds: 800));
                  },
                  titleTextStyle: boldTextStyle(size: 14),
                  leading: commonLeadingWid(imgPath: Assets.iconsIcEditprofileOutlined).circularLightPrimaryBg(),
                  trailing: trailing,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                ).paddingTop(16),
                SettingItemWidget(
                  decoration: boxDecorationDefault(),
                  title: "Medicine Reminder",
                  subTitle: "See Your Medicine Reminder Data",
                  splashColor: transparentColor,
                  onTap: () {
                    Get.to(() => const MedicineRemindersScreen());
                  },
                  titleTextStyle: boldTextStyle(size: 14),
                  leading: commonLeadingWid(imgPath: Assets.iconsIcMedicine, color: appColorPrimary).circularLightPrimaryBg(),
                  trailing: trailing,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                ).paddingTop(16),
                SettingItemWidget(
                  decoration: boxDecorationDefault(),
                  title: "Exercise Reminder",
                  subTitle: "See Your Exercise Reminder Data",
                  splashColor: transparentColor,
                  onTap: () {
                    Get.to(() => const ExcersizeReminderScreen());
                  },
                  titleTextStyle: boldTextStyle(size: 14),
                  leading: commonLeadingWid(imgPath: Assets.iconsIcMeter , color: appColorPrimary).circularLightPrimaryBg(),
                  trailing: trailing,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                ).paddingTop(16),
                   SettingItemWidget(
                  title: "History",
                  decoration: boxDecorationDefault(),
                  subTitle: "See Your Medical History",
                  splashColor: transparentColor,
                  onTap: () {
                    Get.to(() => const MyHistoryScreen());
                  },
                  titleTextStyle: boldTextStyle(size: 14),
                  leading: commonLeadingWid(imgPath: Assets.iconsIcHistory).circularLightPrimaryBg(),
                  trailing: trailing,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                ).paddingTop(16),
                SettingItemWidget(
                  title: locale.value.settings,
                  decoration: boxDecorationDefault(),
                  subTitle: "${locale.value.changePassword},${locale.value.themeAndMore}",
                  splashColor: transparentColor,
                  onTap: () {
                    Get.to(() => SettingScreen());
                  },
                  titleTextStyle: boldTextStyle(size: 14),
                  leading: commonLeadingWid(imgPath: Assets.iconsIcSetting).circularLightPrimaryBg(),
                  trailing: trailing,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                ).paddingTop(16),
             
                SettingItemWidget(
                  title: locale.value.rateApp,
                  decoration: boxDecorationDefault(),
                  subTitle: locale.value.showSomeLoveShare,
                  splashColor: transparentColor,
                  onTap: () async {
                    //TODO In app review
                    /* final InAppReview inAppReview = InAppReview.instance;

                    if (await inAppReview.isAvailable()) {
                      inAppReview.requestReview();
                    } */
                    handleRate();
                  },
                  titleTextStyle: boldTextStyle(size: 14),
                  leading: commonLeadingWid(imgPath: Assets.iconsIcStar).circularLightPrimaryBg(),
                  trailing: trailing,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                ).paddingTop(16),
                SettingItemWidget(
                  title: locale.value.aboutApp,
                  decoration: boxDecorationDefault(),
                  subTitle: locale.value.privacyPolicyTerms,
                  splashColor: transparentColor,
                  onTap: () {
                    Get.to(() => const AboutScreen());
                  },
                  titleTextStyle: boldTextStyle(size: 14),
                  leading: commonLeadingWid(imgPath: Assets.iconsIcInfo).circularLightPrimaryBg(),
                  trailing: trailing,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                ).paddingTop(16),
                SettingItemWidget(
                  title: locale.value.logout,
                  decoration: boxDecorationDefault(),
                  subTitle: locale.value.securelyLogOutOfAccount,
                  splashColor: transparentColor,
                  onTap: () {
                    showConfirmDialogCustom(
                      primaryColor: appColorPrimary,
                      context,
                      negativeText: locale.value.cancel,
                      positiveText: locale.value.logout,
                      onAccept: (_) {
                        profileController.handleLogout();
                      },
                      dialogType: DialogType.CONFIRMATION,
                      subTitle: locale.value.doYouWantToLogout,
                      title: locale.value.ohNoYouAreLeaving,
                    );
                  },
                  titleTextStyle: boldTextStyle(size: 14),
                  leading: commonLeadingWid(imgPath: Assets.iconsIcLogout).circularLightPrimaryBg(),
                  trailing: trailing,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                ).paddingTop(16),
                30.height,
                VersionInfoWidget(prefixText: 'Version  ', textStyle: primaryTextStyle(color: secondaryTextColor)).center(),
                32.height,
              ],
            ).paddingSymmetric(horizontal: 16),
          ],
        ),
      ),
    );
  }

  Widget get trailing => const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: darkGray);
}

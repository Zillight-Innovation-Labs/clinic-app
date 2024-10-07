import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/providers/bottom_nav_provider.dart';
import 'package:kivicare_patient/screens/profile/mt_medicine_reminders.dart';
import 'package:kivicare_patient/screens/booking/talk_to_doc/talk_to_doctor.dart';
import 'package:kivicare_patient/screens/home/home_card.dart';
import 'package:kivicare_patient/screens/tests/take_test_page.dart';
import 'package:provider/provider.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            children: [
              HomeCard(
                imagePath: "assets/images/nursing.png",
                // "assets/icons/bookAppointmentIcon.svg",
                title: "Book an\nAppointment",
                onTap: () {
                  context.read<BottomNavProvider>().setNavbarIndex(1);
                },
              ),
              const SizedBox(width: 12),
              HomeCard(
                  imagePath: "assets/images/eventService.png",
                  // imagePath: "assets/icons/talkToDocIcon.svg",
                  title: "Talk to a\nDoctor",
                  onTap: () {
                    Get.to(() => const TalkToDoctor());
                  }),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              HomeCard(
                  // imagePath: "assets/icons/medicIcon.svg",
                  imagePath: "assets/images/pharmacyImage.png",
                  title: "Medication",
                  onTap: () {
                    Get.to(() => const MedicineRemindersScreen());
                  }),
              const SizedBox(width: 12),
              HomeCard(
                  // imagePath: "assets/icons/testCardIcon.svg",
                  imagePath: "assets/images/diagnostics.png",
                  title: "Tests/ Diagnosis",
                  onTap: () {
                    Get.to(() => const TakeTestPage());
                  }),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}



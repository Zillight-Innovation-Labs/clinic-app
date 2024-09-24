import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/screens/auth/profile/profile_controller.dart';
import 'package:kivicare_patient/screens/home/components/home_service_slider.dart';
import 'package:kivicare_patient/screens/service/components/service_card.dart';
import 'package:kivicare_patient/screens/service/event_outreach_service.dart';
import 'package:kivicare_patient/screens/service/personalized_self_service.dart';
import 'package:kivicare_patient/screens/service/personalized_senior_service.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AppScaffoldNew(
      appBartitleText: "Services",
      appBarVerticalSize: size.height * 0.12,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: servicePages.length,
                itemBuilder: (context, index) {
                  return ServiceCard(
                    title: servicePages[index]['title'],
                    desc: servicePages[index]['desc'],
                    img: servicePages[index]['image'],
                    onTap: () {
                      Get.to(servicePages[index]['page']);
                    },
                    color: servicePages[index]['color'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/models/get_services_model.dart';
import 'package:kivicare_patient/providers/services_provider.dart';
import 'package:kivicare_patient/screens/auth/profile/profile_controller.dart';
import 'package:kivicare_patient/screens/home/components/home_service_slider.dart';
import 'package:kivicare_patient/screens/service/components/service_card.dart';
import 'package:kivicare_patient/screens/service/event_outreach_service.dart';
import 'package:kivicare_patient/screens/service/personalized_self_service.dart';
import 'package:kivicare_patient/screens/service/personalized_senior_service.dart';
import 'package:provider/provider.dart';

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

    final servicesVM = context.watch<ServicesProvider>();

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
                itemCount: servicesVM.getServicesModel?.length,
                itemBuilder: (context, index) {
                  final Service model = servicesVM.getServicesModel![index];
                  return ServiceCard(
                    title: model.name!,
                    desc: model.description!,
                    img: servicePages[index]['image'],
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PersonalizedHomeCareService(model: model),
                          ),
                        );
                      } else if (index == 1) {
                        Get.to(
                          () => PersonalizedHomeCareForSeniorService(
                              model: model),
                        );
                      } else {
                        Get.to(
                          () => EventOutreachService(model: model),
                        );
                      }
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

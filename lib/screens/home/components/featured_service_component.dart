import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/view_all_label_component.dart';
import '../../service/components/service_card.dart';
import '../../service/model/service_list_model.dart';
import '../../service/services_list_screen.dart';
import '../home_controller.dart';

class FeaturedServiceComponent extends StatelessWidget {
  FeaturedServiceComponent({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    if (homeController.dashboardData.value.featuredServices.isEmpty) {
      return const Offstage();
    }

    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          16.height,
          ViewAllLabel(
            label: "Services",
            onTap: () {
              Get.to(() => ServiceListScreen(title: 'Services', isFromDashboard: true), arguments: ServiceElement(featured: 1));
            },
            trailingText: "See All",
          ).paddingOnly(left: 16, right: 8),

          HorizontalList(
              spacing: 16,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ServiceCard();
              },
            )
        
        ],
      ),
    );
  }
}

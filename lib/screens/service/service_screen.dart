import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/screens/auth/profile/profile_controller.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
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
      appBartitleText: "Services ",
      appBarVerticalSize: size.height * 0.12,
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: Column(
          children: [
            Image.asset(
              'assets/images/serviceOne.png',
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal Healthcare Management",
                    style: primaryTextStyle(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Our app empowers users to take control of their health with personalized plans, appointment scheduling, and remote consultations, ensuring comprehensive care at their fingertips.",
                    style: secondaryTextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Features",
                    style: primaryTextStyle(),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 7),
                      height: 45,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        isScrollable: false,
                        indicatorPadding: const EdgeInsets.only(right: 10),
                        labelPadding: const EdgeInsets.only(
                            top: 1, left: 1, bottom: 1, right: 11),
                        labelStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                ),
                        unselectedLabelStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black, fontSize: 13),
                        dividerColor: Colors.transparent,
                        splashBorderRadius: BorderRadius.circular(10),
                        indicator: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                // color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(child: Text("Basic")),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                // color: Colors.grey,
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(child: Text("Standard")),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                // color: Colors.grey,
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(child: Text("Premium")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Add TabBarView for each tab content
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1 Content
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      child: Column(
                        children: [
                          Text(
                            "Basic",
                            style: primaryTextStyle(size: 22),
                          ),
                          Text(
                            "${getCurrency()} N1000/user",
                            style: secondaryTextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Tab 2 Content
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Easily schedule appointments with healthcare professionals.",
                      style: secondaryTextStyle(color: Colors.black),
                    ),
                  ),

                  // Tab 3 Content
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Access remote consultations for expert medical advice anytime.",
                      style: secondaryTextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/screens/auth/profile/profile_controller.dart';
import 'package:kivicare_patient/screens/service/service_plan_card.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class PersonalizedHomeCareService extends StatefulWidget {
  const PersonalizedHomeCareService({super.key});

  @override
  State<PersonalizedHomeCareService> createState() =>
      _PersonalizedHomeCareServiceState();
}

class _PersonalizedHomeCareServiceState
    extends State<PersonalizedHomeCareService> with TickerProviderStateMixin {
  final ProfileController profileController = Get.put(ProfileController());

  String selectedPlan = 'Basic';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Add listener to handle tab changes
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _onTabChanged(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color tabColor = appColorPrimary;

  // Function to perform actions when a tab is selected
  void _onTabChanged(int index) {
    if (index == 0) {
      tabColor = appColorPrimary;
      selectedPlan = 'Basic';
    } else if (index == 1) {
      tabColor = serviceStandard;
      selectedPlan = 'Standard';
    } else if (index == 2) {
      tabColor = servicePremium;
      selectedPlan = 'Premium';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AppScaffoldNew(
      appBartitleText: "Personal Healthcare Management ",
      appBarVerticalSize: size.height * 0.12,
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/personalizedServiceImg.png',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 10),
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
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                            isScrollable: false,
                            indicatorPadding: const EdgeInsets.only(right: 10),
                            labelPadding: const EdgeInsets.only(
                                top: 1, left: 1, bottom: 1, right: 11),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                            unselectedLabelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.black, fontSize: 13),
                            dividerColor: Colors.transparent,
                            splashBorderRadius: BorderRadius.circular(10),
                            indicator: BoxDecoration(
                              color: tabColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            tabs: [
                              Tab(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: tabColor.withOpacity(0.5),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(child: Text("Basic")),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: tabColor.withOpacity(0.5),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(child: Text("Standard")),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: tabColor.withOpacity(0.5),
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
                    controller: _tabController,
                    children: const [
                      // Tab 1 Content
                      ServicePlanCard(
                        name: 'Basic',
                        price: '1000',
                        textOne: "Access to the app with",
                        textTwo:
                            "Personalized health plans, Monthly\nhealth reminders and tips",
                        textThree: "Basic appointment scheduling\nfeatures",
                      ),

                      // Tab 2 Content
                      ServicePlanCard(
                        name: 'Standard',
                        price: '3000',
                        textOne: "All Basic Plan benefits",
                        textTwo:
                            "Bi-weekly remote consultations with\nhealthcare professionals",
                        textThree:
                            "Bi-weekly remote consultations with\nhealthcare professionals",
                      ),

                      // Tab 3 Content
                      ServicePlanCard(
                        name: 'Premium',
                        price: '5000',
                        textOne: "All Standard Plan benefits",
                        textTwo: "Weekly remote consultations",
                        textThree: "Weekly remote consultations",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    log("selectedpage:$selectedPlan");
                  },
                  child: Container(
                    width: 150,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color: tabColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Text(
                          "Choose this plan",
                          style: secondaryTextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

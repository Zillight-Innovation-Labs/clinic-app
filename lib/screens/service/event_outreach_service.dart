import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/models/payment_model.dart';
import 'package:kivicare_patient/providers/bottom_nav_provider.dart';
import 'package:kivicare_patient/providers/payment_provider.dart';
import 'package:kivicare_patient/screens/auth/profile/profile_controller.dart';
import 'package:kivicare_patient/screens/home/home_bottom_tabs.dart';
import 'package:kivicare_patient/screens/service/service_plan_card.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class EventOutreachService extends StatefulWidget {
  const EventOutreachService({super.key});

  @override
  State<EventOutreachService> createState() => _EventOutreachServiceState();
}

class _EventOutreachServiceState extends State<EventOutreachService>
    with TickerProviderStateMixin {
  final ProfileController profileController = Get.put(ProfileController());

  String selectedPlan = 'Basic';
  String selectedPrice = '1000';
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
      selectedPrice = '1000';
    } else if (index == 1) {
      tabColor = serviceStandard;
      selectedPlan = 'Standard';
      selectedPrice = '3000';
    } else if (index == 2) {
      tabColor = servicePremium;
      selectedPlan = 'Premium';
      selectedPrice = '5000';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AppScaffoldNew(
      appBartitleText: "Event and Outreach Health Services ",
      appBarVerticalSize: size.height * 0.12,
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/eventService.png',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Event and Outreach Health Services",
                        style: primaryTextStyle(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Our platform provides on-site health services for events and community outreach programs, ensuring participants have access to medical consultations, screenings, and wellness resources in a convenient and engaging setting.",
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
                        textOne: "Access to community health events",
                        textTwo: "Health education materials",
                        textThree: "Monthly newsletter with health\ntips",
                      ),

                      // Tab 2 Content
                      ServicePlanCard(
                        name: 'Standard',
                        price: '3000',
                        textOne: "All Basic Plan benefits",
                        textTwo:
                            "Participation in two on-site health\nscreenings per month",
                        textThree:
                            "Discounted rates for additional event\nservices",
                      ),

                      // Tab 3 Content
                      ServicePlanCard(
                        name: 'Premium',
                        price: '5000',
                        textOne: "All Standard Plan benefits",
                        textTwo: "Access to exclusive workshops and\nwebinars",
                        textThree: "Free wellness kits for event participants",
                        textFour: "Priority scheduling for events",
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
                  onTap: () async {
                    final homeTabVM = context.read<BottomNavProvider>();
                    final paymentVM = context.read<PaymentProvider>();
                    final selectedService = PaymentModel(
                      title: "Event and Outreach Health Services",
                      desc:
                          'On-site health services for events and community outreach programs',
                      price: selectedPrice,
                      serviceType: selectedPlan,
                      createdAt: DateTime.now(),
                    );

                    await paymentVM.addSelectedService(selectedService);

                    homeTabVM.setNavbarIndex(3);
                    Get.to(() => const HomeBottomNavBarScreen());
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/screens/auth/profile/profile_controller.dart';
import 'package:kivicare_patient/screens/payment/payment_list.dart';
import 'package:kivicare_patient/screens/payment/payment_pending_list.dart';
import 'package:kivicare_patient/screens/service/service_plan_card.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  final ProfileController profileController = Get.put(ProfileController());

  String selectedPlan = 'Basic';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

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
      appBartitleText: "Payment ",
      hasLeadingWidget: false,
      appBarVerticalSize: size.height * 0.12,
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.1),
                      Text(
                        "Available Balance",
                        style: primaryTextStyle(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${getCurrency()} 1000",
                        style: primaryTextStyle(size: 22, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "+Add money",
                        style: primaryTextStyle(color: appColorPrimary),
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
                              color: appColorPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            tabs: [
                              Tab(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: appColorPrimary.withOpacity(0.5),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                      const Center(child: Text("Payment History")),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: appColorPrimary.withOpacity(0.5),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                      child: Text("Payment Pending")),
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
                      PaymentList(),

                      // Tab 2 Content
                      PaymentPayementList()
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

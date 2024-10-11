import 'package:flutter/material.dart';
import 'package:kivicare_patient/providers/app_provider.dart';
import 'package:kivicare_patient/providers/appointment_provider.dart';
import 'package:kivicare_patient/screens/booking/model/subscription_model.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appointVM = context.watch<AppointmentProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 20),
            Column(
              children: List.generate(
                appointVM.getSubscriptionModel!.length,
                (index) => Builder(builder: (context) {
                  final SubscriptionModel model =
                      appointVM.getSubscriptionModel![index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        "Personal Healthcare Management",
                        style: primaryTextStyle(),
                      ),
                      subtitle: Text(
                        "Basic plan",
                        style: secondaryTextStyle(),
                      ),
                      trailing: Text(
                        "${getCurrency()} ${model.amount}",
                        style: primaryTextStyle(color: appColorPrimary),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

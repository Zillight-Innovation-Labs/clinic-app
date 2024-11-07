import 'package:flutter/material.dart';
import 'package:healthcelerate/providers/appointment_provider.dart';
import 'package:healthcelerate/screens/booking/model/subscription_model.dart';
import 'package:healthcelerate/utils/colors.dart';
import 'package:healthcelerate/utils/common_base.dart';
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

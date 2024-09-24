import 'package:flutter/material.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20)
          .copyWith(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 20),
            Column(
                children: List.generate(
                    15,
                    (index) => Card(
                          child: ListTile(
                            title: Text(
                              "Laboratory test",
                              style: primaryTextStyle(),
                            ),
                            subtitle: Text(
                              "Laboratory test desc lorem lorem lorem",
                              style: secondaryTextStyle(),
                            ),
                            trailing: Text(
                              "${getCurrency()} 12000",
                              style: primaryTextStyle(),
                            ),
                          ),
                        ))),
          ],
        ),
      ),
    );
  }
}
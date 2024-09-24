import 'package:flutter/material.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';

class PaymentPayementList extends StatelessWidget {
  const PaymentPayementList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 20),
            Column(
                children: List.generate(
                    15,
                    (index) => Card(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: ListTile(
                                  title: Text(
                                    "Laboratory test",
                                    style: primaryTextStyle(size: 18),
                                  ),
                                  subtitle: Text(
                                    "Laboratory test desc lorem lorem lorem",
                                    style: secondaryTextStyle(size: 10),
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: appColorPrimary),
                                      child: Text(
                                        "Pay now",
                                        style: secondaryTextStyle(color: white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: -2,
                                child: Text(
                                  "${getCurrency()} 12000",
                                  style: secondaryTextStyle(
                                      color: appColorPrimary, size: 10),
                                ),
                              ),
                            ],
                          ),
                        ))),
          ],
        ),
      ),
    );
  }
}

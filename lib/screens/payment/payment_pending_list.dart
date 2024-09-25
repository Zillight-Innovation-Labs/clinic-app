import 'package:flutter/material.dart';
import 'package:kivicare_patient/models/payment_model.dart';
import 'package:kivicare_patient/providers/payment_provider.dart';
import 'package:kivicare_patient/utils/colors.dart';
import 'package:kivicare_patient/utils/common_base.dart';
import 'package:kivicare_patient/utils/empty_error_state_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class PaymentPending extends StatelessWidget {
  const PaymentPending({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final paymentVM = context.watch<PaymentProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 20),
            Builder(builder: (context) {
              if (paymentVM.services.isEmpty) {
                return NoDataWidget(
                  title: 'No Payment found',
                  imageWidget: const EmptyStateWidget(),
                  subTitle: 'There are currently no pending payment available.',
                )
                    .paddingSymmetric(horizontal: 16)
                    .paddingBottom(size.height * 0.1);
              }
              return Column(
                  children: List.generate(
                      paymentVM.services.length + 1,
                      (index) => Card(
                            child: Builder(builder: (context) {
                              if (index == paymentVM.services.length) {
                                return const SizedBox(
                                  height: 30,
                                );
                              }
                              paymentVM.services.sort((a, b) {
                                DateTime dateA = a.createdAt;
                                DateTime dateB = b.createdAt;
                                return dateB.compareTo(dateA);
                              });
                              final PaymentModel model =
                                  paymentVM.services[index];
                              return Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: ListTile(
                                      title: Text(
                                        model.title,
                                        style: primaryTextStyle(size: 18),
                                      ),
                                      subtitle: Text(
                                        model.desc,
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
                                            style: secondaryTextStyle(
                                                color: white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 15,
                                    top: -2,
                                    child: Text(
                                      "${getCurrency()} ${model.price}",
                                      style: secondaryTextStyle(
                                          color: appColorPrimary, size: 10),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          )));
            }),
          ],
        ),
      ),
    );
  }
}

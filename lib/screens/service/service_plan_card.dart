import 'package:flutter/material.dart';
import 'package:healthcelerate/utils/common_base.dart';
import 'package:nb_utils/nb_utils.dart';

class ServicePlanCard extends StatelessWidget {
  ServicePlanCard({
    super.key,
    required this.name,
    required this.price,
    this.features,
  });
  final String name;
  final String price;

  List? features;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: primaryTextStyle(size: 22),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: '${getCurrency()} $price ',
                  style: primaryTextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: '/user',
                      style: secondaryTextStyle(size: 10),
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  SizedBox(width: 30),
                  Expanded(child: Divider()),
                  SizedBox(width: 30),
                ],
              ),
              if (features!.isNotEmpty) ...[
                ...List.generate(features!.length, (int index) {
                  return tileText(text: features![index], size: size);
                }),
              ],
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
//
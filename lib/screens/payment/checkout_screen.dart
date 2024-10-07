import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:kivicare_patient/providers/payment_provider.dart';
import 'package:kivicare_patient/utils/api_end_points.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  final String paymentUrl;
  final String reference;
  static const String routeName = '/checkout';

  const CheckoutScreen({
    Key? key,
    required this.paymentUrl,
    required this.reference,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageFinished: (url) {},
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.contains('')) {
              //api/subscription/paystack/callback
              dev.log('===========X================: ${request.url}');

              await context.read<PaymentProvider>().verifyPayment(context, referenceUrl: request.url);
              // await context.read<HomeProvider>().getTransaction();
              // context.read<AuthProvider>().getUserProfile();

              // return NavigationDecision.prevent;

              // Future.delayed(const Duration(seconds: 1), () {
              //   Navigator.of(context).pop();
              // });
            }
            // return NavigationDecision.navigate;
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
    return AppScaffoldNew(
      appBartitleText: "Payment",
      appBarVerticalSize: size.height * 0.12,
      body: WebViewWidget(controller: controller),
    );
  }
}

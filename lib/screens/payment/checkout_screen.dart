import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivicare_patient/components/app_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  final String reference;
  final String paymentUrl;
  static const String routeName = '/checkout';

  const CheckoutScreen({
    Key? key,
    required this.reference,
    required this.paymentUrl,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
     
        NavigationDelegate(
          onProgress: (int progress) {},

          onPageFinished: (url) {},
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.contains('')) {
              log('===========X================: ${request.url}');
              // await context.read<HomeProvider>().verifyPayment();
              // await context.read<HomeProvider>().getTransaction();
              // context.read<AuthProvider>().getUserProfile();

              // return NavigationDecision.prevent;

              Future.delayed(const Duration(seconds: 1), () {
                Navigator.of(context).pop();
              });
            }
            // return NavigationDecision.navigate;
            return NavigationDecision.prevent;
          },

     
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
    return PopScope(
      onPopInvoked: (bool pop){},
    canPop: true,
      child: AppScaffoldNew(
      appBartitleText: "Secured Payment",
      appBarVerticalSize: Get.height * 0.12,
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}

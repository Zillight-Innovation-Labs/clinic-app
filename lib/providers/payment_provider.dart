import 'package:flutter/material.dart';
import 'package:healthcelerate/api/payment_services.dart';
import 'package:healthcelerate/models/payment_model.dart';
import 'package:healthcelerate/screens/home/home_bottom_tabs.dart';
import 'package:healthcelerate/screens/payment/checkout_screen.dart';
import 'dart:developer' as dev;

import 'package:healthcelerate/utils/app_common.dart';
import 'package:nb_utils/nb_utils.dart';

enum PaymentState { loading, initial, error, success }

class PaymentProvider extends ChangeNotifier {
  final PaymentServiceApis _paymentServiceApis = PaymentServiceApis();

  List<PaymentModel> _services = [];
  List<PaymentModel> get services => _services;

  PaymentState _state = PaymentState.initial;
  PaymentState get state => _state;

  void setState(PaymentState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> addSelectedService(PaymentModel service) async {
    _services.add(service);

    // dev.log("service list-- :${services.length}");
    notifyListeners();
  }

  Future<void> makePayment(context, {required String packageId}) async {
    setState(PaymentState.loading);
    try {
      final response = await _paymentServiceApis.makePayment(
        userId: loginUserData.value.id.toString(),
        packageId: packageId,
      );

      if (response.isError) {
        toast(response.data['message'].toString());
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeBottomNavBarScreen(),
            ),
          );
        });
        dev.log("error  data: ${response.data['message']}");
        setState(PaymentState.error);
      } else {
        setState(PaymentState.success);

        // Extract the 'data' field from the response
        var responseData = response.data as Map<String, dynamic>;

        // Log to inspect the extracted data
        dev.log("makePayment data: ${responseData['paystack_url']}");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutScreen(
              paymentUrl: responseData['paystack_url']!,
              reference: '',
            ),
          ),
        );

        // notifyListeners();
      }
    } catch (e) {
      dev.log("catch error pay1 $e");
      setState(PaymentState.error);
    }
  }

  Future<void> verifyPayment(context, {required String referenceUrl}) async {
    setState(PaymentState.loading);
    try {
      final response = await _paymentServiceApis.verifyPayment(
        referenceUrl: referenceUrl,
      );

      if (response.isError) {
        setState(PaymentState.error);
      } else {
        setState(PaymentState.success);

        // var responseData = response.data as Map<String, dynamic>;

        // Log to inspect the extracted data
        // dev.log("verify============ data: $responseData");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeBottomNavBarScreen(),
          ),
        );

        // notifyListeners();
      }
    } catch (e) {
      dev.log("catch error pay2 $e");
      setState(PaymentState.error);
    }
  }

  Future<void> getPaymentHistory() async {
    try {
      final response = await _paymentServiceApis.getPaymentHistory();

      if (response.isError) {
        setState(PaymentState.error);
      } else {
        setState(PaymentState.success);

        // var responseData = response.data as Map<String, dynamic>;

        // dev.log("response data: $responseData");

        // var paymentList = responseData['data'] as List<dynamic>;

        // _getServicesModel = paymentList.map((service) => Service.fromJson(service)).toList();

        notifyListeners();
      }
    } catch (e) {
      dev.log("catch error pay3 $e");
      setState(PaymentState.error);
    }
  }

  clearService() {
    _services = [];
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/payment_services.dart';
import 'package:kivicare_patient/models/payment_model.dart';
import 'dart:developer' as dev;

enum PaymentState { loading, initial, error, success }

class PaymentProvider extends ChangeNotifier {
  final PaymentServiceApis _paymentServiceApis = PaymentServiceApis();

  final List<PaymentModel> _services = [];
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

  Future<void> makePayment(context) async {
    try {
      final response = await _paymentServiceApis.makePayment(
        serviceName: '',
        serviceDesc: "",
        packageName: "",
        price: "",
      );

      if (response.isError) {
        setState(PaymentState.error);
      } else {
        setState(PaymentState.success);

        // Extract the 'data' field from the response
        var responseData = response.data as Map<String, dynamic>;

        // Log to inspect the extracted data
        // dev.log("response data: $responseData");

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const CheckoutScreen(
        //       reference: '',
        //       paymentUrl: '',
        //     ),
        //   ),
        // );

        notifyListeners();
      }
    } catch (e) {
      dev.log("catch error  $e");
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

        var responseData = response.data as Map<String, dynamic>;

        // dev.log("response data: $responseData");

        var paymentList = responseData['data'] as List<dynamic>;

        // _getServicesModel = paymentList.map((service) => Service.fromJson(service)).toList();

        notifyListeners();
      }
    } catch (e) {
      dev.log("catch error  $e");
      setState(PaymentState.error);
    }
  }
}

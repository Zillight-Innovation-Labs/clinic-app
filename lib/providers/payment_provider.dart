import 'package:flutter/material.dart';
import 'package:kivicare_patient/models/payment_model.dart';
// import 'dart:developer' as dev;

class PaymentProvider extends ChangeNotifier {
  final List<PaymentModel> _services = [];
  List<PaymentModel> get services => _services;

  Future<void> addSelectedService(PaymentModel service) async {
    _services.add(service);

    // dev.log("service list-- :${services.length}");
    notifyListeners();
  }
}

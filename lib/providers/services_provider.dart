//GetServicesModel

import 'package:flutter/material.dart';
import 'package:kivicare_patient/api/app_services_api.dart';
import 'package:kivicare_patient/models/get_services_model.dart';
import 'package:kivicare_patient/models/payment_model.dart';
import 'dart:developer' as dev;

enum ServicesState { loading, initial, error, success }

class ServicesProvider extends ChangeNotifier {
  final AppServiceApis _appServiceApis = AppServiceApis();
  final List<PaymentModel> _services = [];
  List<PaymentModel> get services => _services;

  List<Service> _getServicesModel = [];
  List<Service>? get getServicesModel => _getServicesModel;
  ServicesState _state = ServicesState.initial;
  ServicesState get state => _state;

  void setState(ServicesState state) {
    _state = state;
    notifyListeners();
  }

Future<void> getServices() async {
  try {
    final response = await _appServiceApis.getServices();
    
    if (response.isError) {
      setState(ServicesState.error);
    } else {
      setState(ServicesState.success);
      
      var responseData = response.data as Map<String, dynamic>;
      
      // Log to inspect the extracted data
      // dev.log("response data: $responseData");
      
      var servicesList = responseData['data'] as List<dynamic>;
      
      // Map the list of dynamic objects to a list of Service objects
      _getServicesModel = servicesList.map((service) => Service.fromJson(service)).toList();
      
      notifyListeners();
    }
  } catch (e) {
    dev.log("catch error  $e");
    setState(ServicesState.error);
  }
}


}

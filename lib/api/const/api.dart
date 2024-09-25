import 'dart:async';
import 'dart:io';

import 'package:kivicare_patient/screens/service/test_services.dart';

ApiResponse handleError(Object e) {
  if (e is SocketException) {
    return ApiResponse(
        statusCode: 500,
        isError: true,
        data: {'message': 'Kindly check your internet connection'});
  } else if (e is TimeoutException) {
    return ApiResponse(
        statusCode: 500, isError: true, data: {'message': 'request timeout'});
  } else {
    return ApiResponse(
        statusCode: 500, isError: true, data: {'message': e.toString()});
  }
}
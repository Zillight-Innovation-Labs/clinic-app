import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kivicare_patient/api/const/api.dart';
import 'package:kivicare_patient/screens/service/test_services.dart';
import 'package:kivicare_patient/utils/api_end_points.dart';
import 'package:http/http.dart' as http;

class PaymentServiceApis {
  final _secureStorage = const FlutterSecureStorage();

  Future<ApiResponse> makePayment({required String serviceName, required String serviceDesc,required String packageName, required String price, }) async {
    final url = Uri.parse('${APIEndPoints.baseUrl}/${APIEndPoints.getServices}' );
    String? token = await _secureStorage.read(key: "apiToken");

    final header = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token"
    };

    try {

      final response = await http.get(url, headers: header);

      dev.log(response.statusCode.toString());
      dev.log("services res:${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(
          statusCode: response.statusCode,
          isError: false,
          data: jsonDecode(response.body),
        );
      } else {
        return ApiResponse(
          statusCode: response.statusCode,
          isError: true,
          data: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return handleError(e);
    }
  }

    Future<ApiResponse> getPaymentHistory() async {
    final url = Uri.parse('${APIEndPoints.baseUrl}/${APIEndPoints.getServices}' );
    String? token = await _secureStorage.read(key: "apiToken");

    final header = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token"
    };

    try {

      final response = await http.get(url, headers: header);

      dev.log(response.statusCode.toString());
      // dev.log("services res:${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(
          statusCode: response.statusCode,
          isError: false,
          data: jsonDecode(response.body),
        );
      } else {
        return ApiResponse(
          statusCode: response.statusCode,
          isError: true,
          data: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return handleError(e);
    }
  }

  //getPaymentHistory
}

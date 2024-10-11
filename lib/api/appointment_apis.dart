import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kivicare_patient/api/const/api.dart';
import 'package:kivicare_patient/screens/service/test_services.dart';
import 'package:kivicare_patient/utils/api_end_points.dart';
import 'package:http/http.dart' as http;

class AppointmentServiceApis {
  final _secureStorage = const FlutterSecureStorage();

  Future<ApiResponse> bookAppoinment({
    required String userId,
    required String appointmenDate,
    required String appointmentTime,
  }) async {
    final url = Uri.parse('${APIEndPoints.baseUrl}/appointments2');
    String? token = await _secureStorage.read(key: "token");
    final header = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token"
    };



    try {
      final body = jsonEncode({
        'user_id': userId,
        'appointment_date': appointmenDate,
        'appointment_time': appointmentTime,
        'duration': 60,
        'location': 'Online',
      });

      final response = await http.post(url, body: body, headers: header);

      dev.log(response.statusCode.toString());
      // dev.log("appointment res:${response.body}");

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

  Future<ApiResponse> getAppointment({required String userId}) async {
    final url = Uri.parse('${APIEndPoints.baseUrl}/appointments/$userId');
    String? token = await _secureStorage.read(key: "apiToken");

    final header = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token"
    };


    try {
      final response = await http.get(url, headers: header);

      dev.log(response.statusCode.toString());
      dev.log("getAppointment res:${response.body}");

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
}

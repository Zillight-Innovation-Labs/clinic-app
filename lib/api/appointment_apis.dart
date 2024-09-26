import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kivicare_patient/api/const/api.dart';
import 'package:kivicare_patient/screens/booking/apointments/mt_book_appoinment.dart';
import 'package:kivicare_patient/screens/service/test_services.dart';
import 'package:kivicare_patient/utils/api_end_points.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;

class AppointmentServiceApis {
  final _secureStorage = const FlutterSecureStorage();

  Future<ApiResponse> bookAppoinment({
    required String userId,
    required String appointmenDate,
    required String appointmentTime,
  }) async {
    final url = Uri.parse(APIEndPoints.appointment);
    String? token = await _secureStorage.read(key: "token");
    final header = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token"
    };

    // if (token == null || token.isEmpty) {
    //   log("Token not found");
    //   return ApiResponse(
    //     statusCode: 401,
    //     isError: true,
    //     data: {"message": "No authentication token found"},
    //   );
    // }

    dev.log("userId:$userId");
    dev.log("appointmenDate:$appointmenDate");
    dev.log("appointmentTime:$appointmentTime");
    /*
      "doctor_id": 3,
  "user_id": 12,
  "appointment_date": "2024-09-25",
  "appointment_time": "14:00",
  "duration": 60,
  "location": "1234 Elm Street, City, State",
  "status": "Confirmed"

    */
    try {
      final body = jsonEncode({
        'user_id': userId,
        'appointment_date': appointmenDate,
        'appointment_time': appointmentTime,
        'duration': 60,
        'location': '',
      });

      final response = await http.post(url, body: body, headers: header);
      dev.log(response.statusCode.toString());
      dev.log("appointment res:${response.body}");

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

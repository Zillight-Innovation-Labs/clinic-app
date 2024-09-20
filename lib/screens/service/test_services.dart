// import 'package:how_bodi_mobile/v2/src/components/api_services/auth_services.dart';

import 'package:kivicare_patient/models/get_all_test_detail_model.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

abstract class TestService {

  Future<ApiResponse> addTest(String testId,  response);
  Future<ApiResponse<GetAllTestModel>>? getAllTest();

}




class TestServiceImpl implements TestService {
  final storage = const FlutterSecureStorage();

  @override
  Future<ApiResponse> addTest(String testId, response) async {
    final url = Uri.parse("UrlEndpoints.addTest");
    String? token = await storage.read(key: 'token') ?? "";

    final body = jsonEncode({'testId': testId, 'response': response});
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token"
    };

    try {
      final response = await http.post(url, body: body, headers: headers);
      if (response.statusCode == 200) {
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
      return ApiResponse(
          statusCode: 500, isError: true, data: {'msg': e.toString()});
    }
  }


  @override
  Future<ApiResponse<GetAllTestModel>>? getAllTest() async {
    final url = Uri.parse("UrlEndpoints.getAllTest");
    String? token = await storage.read(key: 'token') ?? "";

    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token"
    };

    try {
      final response = await http.get(url, headers: headers);
  

      GetAllTestModel getTestModel = getAllTestModelFromJson(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(
          statusCode: response.statusCode,
          isError: false,
          data: getTestModel,
        );
      } else {
        return ApiResponse(
          statusCode: response.statusCode,
          isError: true,
          data: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return ApiResponse(
        statusCode: 500,
        isError: true,
        data: GetAllTestModel(),
      );
    }
  }


}



class ApiResponse<T> {
  final int? statusCode;
  final bool isError;
  final T? data;

  ApiResponse({
    this.statusCode,
    required this.isError,
    this.data,
  });
}


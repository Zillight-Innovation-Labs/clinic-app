// ignore_for_file: constant_identifier_names

import 'dart:convert';

// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

import '../network/network_utils.dart';
import '../utils/app_common.dart';
import '../../configs.dart';

class StripeServices {
  static Future<void> stripePaymentMethod({required num amount, required Function(bool) loaderOnOFF, required Function(Map<String, dynamic>) onComplete}) async {
    loaderOnOFF(true);
    try {
     
    } catch (e) {
      log('stripePaymentMethod catch: $e');
    }
  }

  static Future<Map<String, dynamic>?> getStripePaymentIntents({required num amount, required Function(bool) loderOnOFF}) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${appConfigs.value.stripePay.stripeSecretkey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      var request = http.Request('POST', Uri.parse(STRIPE_URL));

      request.bodyFields = {
        'amount': (amount * 100).toInt().toString(),
        'currency': isIqonicProduct ? STRIPE_CURRENCY_CODE : appCurrency.value.currencyCode,
        'description': 'Name: ${loginUserData.value.userName} - Email: ${loginUserData.value.email}',
      };

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var res = jsonDecode(await response.stream.bytesToString());

      log('RESPONSE: ${response.reasonPhrase}');

      apiPrint(
        url: STRIPE_URL,
        request: jsonEncode(request.bodyFields),
        responseBody: jsonEncode(res),
        statusCode: response.statusCode,
      );
      if (response.statusCode == 200) {
        log("Response: $res");
        loderOnOFF.call(false);
        var paymentDetail = {"transaction_id": res["id"], "client_secret": res["client_secret"]};
        return paymentDetail;
      } else {
        loderOnOFF.call(false);
      }
    } catch (e) {
      toast(e.toString(), print: true);
    }
    return null;
  }
}

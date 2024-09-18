import '../../../utils/constants.dart';
import '../../home/model/dashboard_res_model.dart';

class ConfigurationResponse {
  CustomerAppUrl customerAppUrl;
  RazorPay razorPay;
  StripePay stripePay;
  PaystackPay paystackPay;
  PaypalPay paypalPay;
  FlutterwavePay flutterwavePay;
  int isForceUpdateforAndroid;
  int androidMinimumForceUpdateCode;
  int androidLatestVersionUpdateCode;
  int isForceUpdateforIos;
  int isoMinimumForceUpdateCode;
  int isoLatestVersionUpdateCode;
  Currency currency;
  String siteDescription;
  bool isUserPushNotification;
  bool enableChatGpt;
  bool testWithoutKey;
  String chatgptKey;
  String notification;
  String firebaseKey;
  String applicationLanguage;
  bool isMultiVendor;
  bool status;
  List<TaxPercentage> taxPercentage;

  ConfigurationResponse({
    required this.customerAppUrl,
    required this.razorPay,
    required this.stripePay,
    required this.paystackPay,
    required this.paypalPay,
    required this.flutterwavePay,
    this.isForceUpdateforAndroid = -1,
    this.androidMinimumForceUpdateCode = -1,
    this.androidLatestVersionUpdateCode = -1,
    this.isForceUpdateforIos = -1,
    this.isoMinimumForceUpdateCode = -1,
    this.isoLatestVersionUpdateCode = -1,
    required this.currency,
    this.siteDescription = "",
    this.isUserPushNotification = false,
    this.enableChatGpt = false,
    this.testWithoutKey = false,
    this.chatgptKey = "",
    this.notification = "",
    this.firebaseKey = "",
    this.applicationLanguage = "",
    this.isMultiVendor = false,
    this.status = false,
    this.taxPercentage = const <TaxPercentage>[],
  });

  factory ConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return ConfigurationResponse(
      customerAppUrl: json['customer_app_url'] is Map ? CustomerAppUrl.fromJson(json['customer_app_url']) : CustomerAppUrl(),
      razorPay: json['razor_pay'] is Map ? RazorPay.fromJson(json['razor_pay']) : RazorPay(),
      stripePay: json['stripe_pay'] is Map ? StripePay.fromJson(json['stripe_pay']) : StripePay(),
      paystackPay: json['paystack_pay'] is Map ? PaystackPay.fromJson(json['paystack_pay']) : PaystackPay(),
      paypalPay: json['paypal_pay'] is Map ? PaypalPay.fromJson(json['paypal_pay']) : PaypalPay(),
      flutterwavePay: json['flutterwave_pay'] is Map ? FlutterwavePay.fromJson(json['flutterwave_pay']) : FlutterwavePay(),
      isForceUpdateforAndroid: json['isForceUpdateforAndroid'] is int ? json['isForceUpdateforAndroid'] : -1,
      androidMinimumForceUpdateCode: json['android_minimum_force_update_code'] is int ? json['android_minimum_force_update_code'] : -1,
      androidLatestVersionUpdateCode: json['android_latest_version_update_code'] is int ? json['android_latest_version_update_code'] : -1,
      isForceUpdateforIos: json['isForceUpdateforIos'] is int ? json['isForceUpdateforIos'] : -1,
      isoMinimumForceUpdateCode: json['iso_minimum_force_update_code'] is int ? json['iso_minimum_force_update_code'] : -1,
      isoLatestVersionUpdateCode: json['iso_latest_version_update_code'] is int ? json['iso_latest_version_update_code'] : -1,
      currency: json['currency'] is Map ? Currency.fromJson(json['currency']) : Currency(),
      siteDescription: json['site_description'] is String ? json['site_description'] : "",
      isUserPushNotification: json['is_user_push_notification'] is bool ? json['is_user_push_notification'] : json['is_user_push_notification'] == 1,
      enableChatGpt: json['enable_chat_gpt'] is bool ? json['enable_chat_gpt'] : json['enable_chat_gpt'] == 1,
      testWithoutKey: json['test_without_key'] is bool ? json['test_without_key'] : json['test_without_key'] == 1,
      chatgptKey: json['chatgpt_key'] is String ? json['chatgpt_key'] : "",
      notification: json['notification'] is String ? json['notification'] : "",
      firebaseKey: json['firebase_key'] is String ? json['firebase_key'] : "",
      applicationLanguage: json['application_language'] is String ? json['application_language'] : "",
      isMultiVendor: json['is_multi_vendor'] is int
          ? json['is_multi_vendor'] == 1
              ? true
              : false
          : false,
      status: json['status'] is bool ? json['status'] : json['status'] == 1,
      taxPercentage: json['tax'] is List ? List<TaxPercentage>.from(json['tax'].map((x) => TaxPercentage.fromJson(x))) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_app_url': customerAppUrl.toJson(),
      'razor_pay': razorPay.toJson(),
      'stripe_pay': stripePay.toJson(),
      'paystack_pay': paystackPay.toJson(),
      'paypal_pay': paypalPay.toJson(),
      'flutterwave_pay': flutterwavePay.toJson(),
      'isForceUpdateforAndroid': isForceUpdateforAndroid,
      'android_minimum_force_update_code': androidMinimumForceUpdateCode,
      'android_latest_version_update_code': androidLatestVersionUpdateCode,
      'isForceUpdateforIos': isForceUpdateforIos,
      'iso_minimum_force_update_code': isoMinimumForceUpdateCode,
      'iso_latest_version_update_code': isoLatestVersionUpdateCode,
      'currency': currency.toJson(),
      'site_description': siteDescription,
      'is_user_push_notification': isUserPushNotification,
      'enable_chat_gpt': enableChatGpt,
      'test_without_key': testWithoutKey,
      'chatgpt_key': chatgptKey,
      'notification': notification,
      'firebase_key': firebaseKey,
      'application_language': applicationLanguage,
      'is_multi_vendor': isMultiVendor,
      'status': status,
      'tax': taxPercentage.map((e) => e.toJson()).toList(),
    };
  }
}

class CustomerAppUrl {
  String customerAppPlayStore;
  String customerAppAppStore;

  CustomerAppUrl({
    this.customerAppPlayStore = "",
    this.customerAppAppStore = "",
  });

  factory CustomerAppUrl.fromJson(Map<String, dynamic> json) {
    return CustomerAppUrl(
      customerAppPlayStore: json['customer_app_play_store'] is String ? json['customer_app_play_store'] : "",
      customerAppAppStore: json['customer_app_app_store'] is String ? json['customer_app_app_store'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_app_play_store': customerAppPlayStore,
      'customer_app_app_store': customerAppAppStore,
    };
  }
}

class RazorPay {
  String razorpaySecretkey;
  String razorpayPublickey;

  RazorPay({
    this.razorpaySecretkey = "",
    this.razorpayPublickey = "",
  });

  factory RazorPay.fromJson(Map<String, dynamic> json) {
    return RazorPay(
      razorpaySecretkey: json['razorpay_secretkey'] is String ? json['razorpay_secretkey'] : "",
      razorpayPublickey: json['razorpay_publickey'] is String ? json['razorpay_publickey'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'razorpay_secretkey': razorpaySecretkey,
      'razorpay_publickey': razorpayPublickey,
    };
  }
}

class StripePay {
  String stripeSecretkey;
  String stripePublickey;

  StripePay({
    this.stripeSecretkey = "",
    this.stripePublickey = "",
  });

  factory StripePay.fromJson(Map<String, dynamic> json) {
    return StripePay(
      stripeSecretkey: json['stripe_secretkey'] is String ? json['stripe_secretkey'] : "",
      stripePublickey: json['stripe_publickey'] is String ? json['stripe_publickey'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stripe_secretkey': stripeSecretkey,
      'stripe_publickey': stripePublickey,
    };
  }
}

class PaystackPay {
  String paystackSecretkey;
  String paystackPublickey;

  PaystackPay({
    this.paystackSecretkey = "",
    this.paystackPublickey = "",
  });

  factory PaystackPay.fromJson(Map<String, dynamic> json) {
    return PaystackPay(
      paystackSecretkey: json['paystack_secretkey'] is String ? json['paystack_secretkey'] : "",
      paystackPublickey: json['paystack_publickey'] is String ? json['paystack_publickey'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paystack_secretkey': paystackSecretkey,
      'paystack_publickey': paystackPublickey,
    };
  }
}

class PaypalPay {
  String paypalSecretkey;
  String paypalClientid;

  PaypalPay({
    this.paypalSecretkey = "",
    this.paypalClientid = "",
  });

  factory PaypalPay.fromJson(Map<String, dynamic> json) {
    return PaypalPay(
      paypalSecretkey: json['paypal_secretkey'] is String ? json['paypal_secretkey'] : "",
      paypalClientid: json['paypal_clientid'] is String ? json['paypal_clientid'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paypal_secretkey': paypalSecretkey,
      'paypal_clientid': paypalClientid,
    };
  }
}

class FlutterwavePay {
  String flutterwaveSecretkey;
  String flutterwavePublickey;

  FlutterwavePay({
    this.flutterwaveSecretkey = "",
    this.flutterwavePublickey = "",
  });

  factory FlutterwavePay.fromJson(Map<String, dynamic> json) {
    return FlutterwavePay(
      flutterwaveSecretkey: json['flutterwave_secretkey'] is String ? json['flutterwave_secretkey'] : "",
      flutterwavePublickey: json['flutterwave_publickey'] is String ? json['flutterwave_publickey'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flutterwave_secretkey': flutterwaveSecretkey,
      'flutterwave_publickey': flutterwavePublickey,
    };
  }
}

class Currency {
  String currencyName;
  String currencySymbol;
  String currencyCode;
  String currencyPosition;
  int noOfDecimal;
  String thousandSeparator;
  String decimalSeparator;

  Currency({
    this.currencyName = "Doller",
    this.currencySymbol = "\$",
    this.currencyCode = "USD",
    this.currencyPosition = CurrencyPosition.CURRENCY_POSITION_LEFT,
    this.noOfDecimal = 2,
    this.thousandSeparator = ",",
    this.decimalSeparator = ".",
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      currencyName: json['currency_name'] is String ? json['currency_name'] : "Doller",
      currencySymbol: json['currency_symbol'] is String ? json['currency_symbol'] : "\$",
      currencyCode: json['currency_code'] is String ? json['currency_code'] : "USD",
      currencyPosition: json['currency_position'] is String ? json['currency_position'] : "left",
      noOfDecimal: json['no_of_decimal'] is int ? json['no_of_decimal'] : 2,
      thousandSeparator: json['thousand_separator'] is String ? json['thousand_separator'] : ",",
      decimalSeparator: json['decimal_separator'] is String ? json['decimal_separator'] : ".",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency_name': currencyName,
      'currency_symbol': currencySymbol,
      'currency_code': currencyCode,
      'currency_position': currencyPosition,
      'no_of_decimal': noOfDecimal,
      'thousand_separator': thousandSeparator,
      'decimal_separator': decimalSeparator,
    };
  }
}

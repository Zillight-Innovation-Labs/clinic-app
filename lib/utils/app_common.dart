import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:healthcelerate/screens/home/model/system_service_res.dart';
import '../configs.dart';
import '../screens/auth/model/about_page_res.dart';
import '../screens/auth/model/app_configuration_res.dart';
import '../screens/auth/model/login_response.dart';
import '../screens/booking/model/save_booking_res.dart';
import '../screens/clinic/model/clinic_detail_model.dart';
import '../screens/clinic/model/clinics_res_model.dart';
import '../screens/doctor/model/doctor_list_res.dart';
import '../screens/home/model/dashboard_res_model.dart';
import '../screens/service/model/service_list_model.dart';
import 'constants.dart';

bool isIqonicProduct = DOMAIN_URL.contains("apps.iqonic.design") ||
    DOMAIN_URL.contains("iqonic.design");

RxString selectedLanguageCode = DEFAULT_LANGUAGE.obs;
RxBool isLoggedIn = false.obs;
Rx<UserData> loginUserData = UserData().obs;
RxBool isDarkMode = false.obs;
RxString tempOTP = "".obs;

// Firebase Constants
// String get appNameTopic => APP_NAME.toLowerCase().replaceAll(' ', '_');
//endregion

Rx<Currency> appCurrency = Currency().obs;
Rx<ConfigurationResponse> appConfigs = ConfigurationResponse(
  customerAppUrl: CustomerAppUrl(),
  razorPay: RazorPay(),
  stripePay: StripePay(),
  paystackPay: PaystackPay(),
  paypalPay: PaypalPay(),
  flutterwavePay: FlutterwavePay(),
  currency: Currency(),
).obs;

Rx<SystemService> selectedSysService = SystemService().obs;

//
Rx<PackageInfoData> currentPackageinfo = PackageInfoData().obs;

// Currency position common
bool get isCurrencyPositionLeft =>
    appCurrency.value.currencyPosition ==
    CurrencyPosition.CURRENCY_POSITION_LEFT;

bool get isCurrencyPositionRight =>
    appCurrency.value.currencyPosition ==
    CurrencyPosition.CURRENCY_POSITION_RIGHT;

bool get isCurrencyPositionLeftWithSpace =>
    appCurrency.value.currencyPosition ==
    CurrencyPosition.CURRENCY_POSITION_LEFT_WITH_SPACE;

bool get isCurrencyPositionRightWithSpace =>
    appCurrency.value.currencyPosition ==
    CurrencyPosition.CURRENCY_POSITION_RIGHT_WITH_SPACE;
//endregion

//region Tax CalCulation
RxList<TaxPercentage> taxPercentage = RxList();

Rx<ServiceElement> currentSelectedService = ServiceElement().obs;
Rx<Clinic> currentSelectedClinic = Clinic(clinicSession: ClinicSession()).obs;
Rx<Doctor> currentSelectedDoctor = Doctor().obs;

RxList<AboutDataModel> aboutPages = RxList();

//Booking Success
RxString bookingSuccessDate = "".obs;
Rx<SaveBookingRes> saveBookingRes =
    SaveBookingRes(saveBookingResData: SaveBookingResData()).obs;
//

bool canLaunchVideoCall({required String status}) =>
    status.toLowerCase().contains(StatusConst.confirmed) ||
    status.toLowerCase().contains(StatusConst.checkIn);

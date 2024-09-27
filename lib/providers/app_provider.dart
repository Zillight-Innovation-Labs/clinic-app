import 'package:kivicare_patient/providers/appointment_provider.dart';
import 'package:kivicare_patient/providers/bottom_nav_provider.dart';
import 'package:kivicare_patient/providers/payment_provider.dart';
import 'package:kivicare_patient/providers/services_provider.dart';
import 'package:kivicare_patient/providers/test_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  //The providers for dependency injection and state management will be added here
  //as the app will use MultiProvider
  static final providers = <SingleChildWidget>[
    ChangeNotifierProvider(create: (_) => UserTestProvider()),
    ChangeNotifierProvider(create: (_) => BottomNavProvider()),
    ChangeNotifierProvider(create: (_) => PaymentProvider()),
    ChangeNotifierProvider(create: (_) => AppointmentProvider()),
    ChangeNotifierProvider(create: (_) => ServicesProvider()),
    // ChangeNotifierProvider(create: (_) => AuthTokenProvider()),

  ];
}

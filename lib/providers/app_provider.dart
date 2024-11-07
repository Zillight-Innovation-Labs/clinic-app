import 'package:healthcelerate/providers/appointment_provider.dart';
import 'package:healthcelerate/providers/bottom_nav_provider.dart';
import 'package:healthcelerate/providers/payment_provider.dart';
import 'package:healthcelerate/providers/profile_provider.dart';
import 'package:healthcelerate/providers/services_provider.dart';
import 'package:healthcelerate/providers/talk_to_doctor.dart';
import 'package:healthcelerate/providers/test_provider.dart';
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
    ChangeNotifierProvider(create: (_) => TalkToDoctorProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
    // ChangeNotifierProvider(create: (_) => AuthTokenProvider()),
  ];
}

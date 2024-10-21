import 'package:get/get.dart';
import 'package:round_app/presentation/android_seven_screen/android_seven_screen.dart';
import 'package:round_app/presentation/android_seven_screen/binding/android_seven_binding.dart';
import 'package:round_app/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:round_app/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:round_app/presentation/filtter_screen/binding/filtter_binding.dart';
import 'package:round_app/presentation/filtter_screen/filtter_screen.dart';
import 'package:round_app/presentation/login_screen/binding/login_binding.dart';
import 'package:round_app/presentation/login_screen/login_screen.dart';
import 'package:round_app/presentation/onb_4_1_interessi_selezionati_screen/binding/onb_4_1_interessi_selezionati_binding.dart';
import 'package:round_app/presentation/onb_4_1_interessi_selezionati_screen/onb_4_1_interessi_selezionati_screen.dart';
import 'package:round_app/presentation/payment_transfer_screen/binding/payment_transfer_binding.dart';
import 'package:round_app/presentation/payment_transfer_screen/payment_transfer_screen.dart';
import 'package:round_app/presentation/profile_screen/binding/profile_binding.dart';
import 'package:round_app/presentation/profile_screen/profile_screen.dart';
import 'package:round_app/presentation/splash_screen/binding/splash_binding.dart';
import 'package:round_app/presentation/splash_screen/splash_screen.dart';
import 'package:round_app/presentation/splash_two_screen/binding/splash_two_binding.dart';
import 'package:round_app/presentation/splash_two_screen/splash_two_screen.dart';
import 'package:round_app/presentation/video_concluso_screen/binding/video_concluso_binding.dart';
import 'package:round_app/presentation/video_concluso_screen/video_concluso_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String viewAllPage = '/view_all_page';

  static const String filtterScreen = '/filtter_screen';

  static const String paymentTransferScreen = '/payment_transfer_screen';

  static const String androidSixPage = '/android_six_page';

  static const String androidSevenScreen = '/android_seven_screen';

  static const String profileScreen = '/profile_screen';

  static const String loginScreen = '/login_screen';

  static const String onb41InteressiSelezionatiScreen =
      '/onb_4_1_interessi_selezionati_screen';

  static const String splashTwoScreen = '/splash_two_screen';

  static const String videoConclusoScreen = '/video_concluso_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: filtterScreen,
      page: () => FiltterScreen(),
      bindings: [
        FiltterBinding(),
      ],
    ),
    GetPage(
      name: paymentTransferScreen,
      page: () => PaymentTransferScreen(),
      bindings: [
        PaymentTransferBinding(),
      ],
    ),
    GetPage(
      name: androidSevenScreen,
      page: () => AndroidSevenScreen(),
      bindings: [
        AndroidSevenBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: onb41InteressiSelezionatiScreen,
      page: () => Onb41InteressiSelezionatiScreen(),
      bindings: [
        Onb41InteressiSelezionatiBinding(),
      ],
    ),
    GetPage(
      name: splashTwoScreen,
      page: () => SplashTwoScreen(),
      bindings: [
        SplashTwoBinding(),
      ],
    ),
    GetPage(
      name: videoConclusoScreen,
      page: () => VideoConclusoScreen(reward: 0.0, id: 0),
      bindings: [
        VideoConclusoBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}

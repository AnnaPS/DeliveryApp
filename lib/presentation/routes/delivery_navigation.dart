import 'package:deliveryApp/presentation/home/home_binding.dart';
import 'package:deliveryApp/presentation/home/home_screen.dart';
import 'package:deliveryApp/presentation/login/login_binding.dart';
import 'package:deliveryApp/presentation/login/login_screen.dart';
import 'package:deliveryApp/presentation/splash/splash_binding.dart';
import 'package:deliveryApp/presentation/splash/splashscreen.dart';
import 'package:get/get.dart';

import '../main_binding.dart';

class DeliveryRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
}

class DeliveryPages {
  static final pages = [
    GetPage(
        name: DeliveryRoutes.splash,
        page: () => SplashScreen(),
        binding: SplashBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 2000)),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => LoginScreen(),
      bindings: [MainBinding(), LoginBinding()],
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
        name: DeliveryRoutes.home,
        page: () => HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 700))
  ];
}

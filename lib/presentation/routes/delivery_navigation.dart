import 'package:deliveryApp/presentation/home/home_screen.dart';
import 'package:deliveryApp/presentation/login/login_binding.dart';
import 'package:deliveryApp/presentation/login/login_screen.dart';
import 'package:deliveryApp/presentation/splash/splash_binding.dart';
import 'package:deliveryApp/presentation/splash/splashscreen.dart';
import 'package:get/get.dart';

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
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
        name: DeliveryRoutes.home,
        page: () => HomeScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 700))
  ];
}

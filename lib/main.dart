import 'package:deliveryApp/presentation/main_binding.dart';
import 'package:deliveryApp/presentation/routes/delivery_navigation.dart';
import 'package:deliveryApp/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: DeliveryRoutes.splash,
      getPages: DeliveryPages.pages,
      initialBinding: MainBinding(),
    );
  }
}

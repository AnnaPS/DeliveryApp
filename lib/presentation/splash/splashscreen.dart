import 'package:deliveryApp/presentation/splash/splash_controller.dart';
import 'package:deliveryApp/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashScreen extends GetWidget<SplashController> {
  final SplashController splashController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradient,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'deliveryIcon',
              child: CircleAvatar(
                backgroundColor: Theme.of(context).canvasColor,
                radius: 50,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/img/fast-food.png',
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Delivery Food',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

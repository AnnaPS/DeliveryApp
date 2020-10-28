import 'package:deliveryApp/presentation/profile/profile_controller.dart';
import 'package:deliveryApp/presentation/routes/delivery_navigation.dart';
import 'package:deliveryApp/presentation/theme.dart';
import 'package:deliveryApp/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  Future<void> logout() async {
    await ProfileController.controller.logOut();
    Get.offNamed(DeliveryRoutes.login);
  }

  void onThemeUpdated(bool isDark) {
    ProfileController.controller.updateTheme(isDark);
    Get.changeTheme(isDark ? darkTheme : lightTheme);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Obx(() {
      final user = ProfileController.controller.user.value;
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: user != null
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: DeliveryColors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                backgroundColor: DeliveryColors.dark,
                                radius: 50,
                                child: ClipOval(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      user.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          Text(
                            user.name,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 14),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: height / 40),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 8,
                            color: Theme.of(context).canvasColor,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height / 30,
                                ),
                                Text(
                                  'Personal information',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Correo',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                                fontSize: 12,
                                                color: DeliveryColors.green),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        user.email,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                              fontSize: 12,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25.0, left: 15.0, bottom: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Dark mode',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 15.0,
                                        ),
                                        child: Obx(() {
                                          return Switch(
                                            value: ProfileController
                                                .controller.darkTheme.value,
                                            onChanged: onThemeUpdated,
                                            activeColor: DeliveryColors.green,
                                          );
                                        }),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: DeliveryButton(
                              onTap: logout,
                              text: 'Log out',
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 4),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            : SizedBox.shrink(),
      );
    });
  }
}

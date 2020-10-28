import 'package:deliveryApp/presentation/home/home_controller.dart';
import 'package:deliveryApp/presentation/home/products/products_screen.dart';
import 'package:deliveryApp/presentation/profile/profile_screen.dart';
import 'package:deliveryApp/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart/cart_screen.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.indexSelected.value,
                children: [
                  ProductScreen(),
                  Placeholder(),
                  CartScreen(
                    callback: () {
                      controller.updateIndexSelected(0);
                    },
                  ),
                  Placeholder(),
                  ProfileScreen()
                ],
              ),
            ),
          ),
          Obx(
            () => _DeliveryNavigationBar(
              index: controller.indexSelected.value,
              onIndexSelected: (index) {
                controller.updateIndexSelected(index);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends GetWidget<HomeController> {
  final int index;
  final ValueChanged<int> onIndexSelected;
  _DeliveryNavigationBar({Key key, this.index, this.onIndexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).bottomAppBarColor,
                width: 2,
              ),
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  child: IconButton(
                    icon: Icon(
                      Icons.home,
                      color: index == 0
                          ? DeliveryColors.green
                          : DeliveryColors.lightGrey,
                    ),
                    onPressed: () => onIndexSelected(0),
                  ),
                ),
                Material(
                  child: IconButton(
                    icon: Icon(
                      Icons.store,
                      color: index == 1
                          ? DeliveryColors.green
                          : DeliveryColors.lightGrey,
                    ),
                    onPressed: () => onIndexSelected(1),
                  ),
                ),
                Material(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: DeliveryColors.purple,
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_basket,
                        color: index == 2
                            ? DeliveryColors.green
                            : DeliveryColors.white,
                      ),
                      onPressed: () => onIndexSelected(2),
                    ),
                  ),
                ),
                Material(
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: index == 3
                          ? DeliveryColors.green
                          : DeliveryColors.lightGrey,
                    ),
                    onPressed: () => onIndexSelected(3),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () => onIndexSelected(4),
                    child: Obx(
                      () {
                        final user = controller.user.value;
                        return user.image == null
                            ? const SizedBox.shrink()
                            : CircleAvatar(
                                radius: 12.5,
                                backgroundImage: AssetImage(user.image),
                                backgroundColor: Colors.black,
                              );
                      },
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

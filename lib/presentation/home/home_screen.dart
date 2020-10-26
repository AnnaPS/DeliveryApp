import 'package:deliveryApp/presentation/home/products/products_screen.dart';
import 'package:deliveryApp/presentation/profile/profile_screen.dart';
import 'package:deliveryApp/presentation/theme.dart';
import 'package:flutter/material.dart';

import 'cart/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndext = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: _currentIndext,
              children: [
                ProductScreen(),
                Text(''),
                CartScreen(
                  callback: () {
                    setState(() {
                      _currentIndext = 0;
                    });
                  },
                ),
                Text(''),
                ProfileScreen()
              ],
            ),
          ),
          _DeliveryNavigationBar(
            index: _currentIndext,
            onIndexSelected: (index) {
              setState(() {
                _currentIndext = index;
              });
            },
          )
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  const _DeliveryNavigationBar({Key key, this.index, this.onIndexSelected})
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
                    child: CircleAvatar(
                      radius: 12.5,
                      backgroundColor: Colors.deepPurple,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

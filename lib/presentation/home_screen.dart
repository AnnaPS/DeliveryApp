import 'package:deliveryApp/presentation/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
          _DeliveryNavigationBar()
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.store,
                ),
                onPressed: () {},
              ),
              CircleAvatar(
                backgroundColor: DeliveryColors.purple,
                child: IconButton(
                  icon: Icon(Icons.shopping_basket),
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border_outlined),
                onPressed: () {},
              ),
              CircleAvatar(
                radius: 12.5,
                backgroundColor: Colors.deepPurple,
                child: Text(
                  'A',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          )),
    );
  }
}

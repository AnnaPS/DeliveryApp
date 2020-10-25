import 'package:deliveryApp/presentation/theme.dart';
import 'package:deliveryApp/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

const logoSize = 45.0;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final withd = MediaQuery.of(context).size.width;
    final moreSize = 50.0;
    final labelColor = Theme.of(context).inputDecorationTheme.labelStyle.color;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  children: [
                    Positioned(
                      bottom: logoSize,
                      left: -moreSize / 2,
                      right: -moreSize / 2,
                      height: withd + moreSize,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: deliveryGradient,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.6, 1.0]),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(constraints.maxHeight)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                        tag: 'deliveryIcon',
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).canvasColor,
                          radius: logoSize,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/img/fast-food.png',
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold, color: labelColor),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    Text(
                      'UserName',
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          hintText: "UserName"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Password',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.security,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: "Password",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(25),
              child: DeliveryButton(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => HomeScreen()));
                },
                text: 'Login',
              )),
        ],
      ),
    );
  }
}

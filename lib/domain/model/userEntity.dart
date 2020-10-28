import 'package:flutter/material.dart';

class User {
  const User(
      {@required this.name, @required this.email, this.image, this.theme});

  final String name;
  final String email;
  final String theme;
  final String image;

  factory User.empty() =>
      User(name: null, email: null, image: null, theme: null);
}

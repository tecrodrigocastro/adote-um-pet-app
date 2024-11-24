import 'package:flutter/cupertino.dart';

class LoginParams extends ChangeNotifier {
  String email;
  String password;

  LoginParams({required this.email, required this.password});

  factory LoginParams.empty() => LoginParams(
        email: '',
        password: '',
      );

  setEmail(String value) {
    email = value;
    notifyListeners();
  }

  setPassword(String value) {
    password = value;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class GetPetsParams extends ChangeNotifier {
  String? type;
  String? gender;
  String? size;

  GetPetsParams({
    this.type,
    this.gender,
    this.size,
  });

  factory GetPetsParams.empty() => GetPetsParams(
        type: '',
        gender: '',
        size: '',
      );

  setType(String value) {
    type = value;
    notifyListeners();
  }

  setGender(String value) {
    gender = value;
    notifyListeners();
  }

  setSize(String value) {
    size = value;
    notifyListeners();
  }
}

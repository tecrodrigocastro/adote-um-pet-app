import 'dart:convert';

class RegisterModel {
  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.zipCode,
    required this.numberHouse,
    required this.complement,
    required this.photoUrl,
  });

  final String name;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String zipCode;
  final String numberHouse;
  final String complement;
  final String photoUrl;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'zip_code': zipCode,
      'number_house': numberHouse,
      'complement': complement,
      'photo_url': photoUrl,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
      zipCode: map['zip_code'] as String,
      numberHouse: map['number_house'],
      complement: map['complement'] as String,
      photoUrl: map['photo_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';
import 'dart:developer';

import 'package:adote_um_pet/src/app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.zipCode,
    required super.address,
    required super.numberHouse,
    required super.complement,
    required super.photoUrl,
    super.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'zip_code': zipCode,
      'address': address,
      'number_house': numberHouse,
      'complement': complement,
      'photo_url': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    try {
      return UserModel(
        id: map['id'] as int,
        name: map['name'] as String,
        email: map['email'] as String,
        password: map['password'] != null ? map['password'] as String : null,
        phone: map['phone'] as String,
        zipCode: map['zip_code'] as String,
        address: map['address'] as String,
        numberHouse: map['number_house'] as int,
        complement: map['complement'] as String,
        photoUrl: map['photo_url'] as String,
      );
    } catch (e, s) {
      log('Error parsing UserModel: $e - stack: $s');
      throw Exception('Error parsing UserModel: $e - stack: $s');
    }
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

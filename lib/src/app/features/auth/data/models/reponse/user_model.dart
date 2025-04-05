import 'dart:convert';

import '../../../domain/entities/user_entity.dart';

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
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "zip_code": zipCode,
      "number_house": numberHouse,
      "complement": complement,
      "photo_url": photoUrl,
      "id": id,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      zipCode: zipCode,
      numberHouse: numberHouse,
      complement: complement,
      address: address,
      name: name,
      phone: phone,
      id: id,
      email: email,
      photoUrl: photoUrl,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      id: map['id'],
      phone: map['phone'],
      name: map['name'],
      address: map['address'],
      complement: map['complement'],
      numberHouse: map['number_house'].toString(),
      zipCode: map['zip_code'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

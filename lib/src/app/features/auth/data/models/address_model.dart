import 'dart:convert';

import '../../domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    super.id,
    super.userId,
    required super.street,
    required super.neighborhood,
    required super.numberHouse,
    super.complement,
    required super.zipCode,
    required super.city,
    required super.state,
    super.createdAt,
    super.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      'street': street,
      'neighborhood': neighborhood,
      'number_house': numberHouse,
      if (complement != null) 'complement': complement,
      'zip_code': zipCode,
      'city': city,
      'state': state,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    };
  }

  AddressEntity toEntity() {
    return AddressEntity(
      id: id,
      userId: userId,
      street: street,
      neighborhood: neighborhood,
      numberHouse: numberHouse,
      complement: complement,
      zipCode: zipCode,
      city: city,
      state: state,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id']?.toInt(),
      userId: map['user_id']?.toInt(),
      street: map['street'] ?? '',
      neighborhood: map['neighborhood'] ?? '',
      numberHouse: (map['number_house'] ?? 0).toInt(),
      complement: map['complement'],
      zipCode: map['zip_code'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
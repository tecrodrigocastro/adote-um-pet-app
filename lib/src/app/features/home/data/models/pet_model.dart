import 'dart:convert';

import '../../domain/entities/pet_entity.dart';

class PetModel extends PetEntity {
  //!Manipular o objeto,
  PetModel({
    required super.id,
    required super.name,
    required super.type,
    required super.userId,
    required super.gender,
    required super.size,
    required super.birthDate,
    required super.breed,
    required super.color,
    required super.address,
    required super.description,
    required super.photos,
  });

  //Gerar toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'userId': userId,
      'gender': gender,
      'size': size,
      'birthDate': birthDate,
      'breed': breed,
      'color': color,
      'address': address,
      'description': description,
      'photos': photos
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      userId: map['userId'],
      gender: map['gender'],
      size: map['size'],
      birthDate: map['birthDate'],
      breed: map['breed'],
      color: map['color'],
      address: map['address'],
      description: map['description'],
      photos: List<String>.from(map['photos']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

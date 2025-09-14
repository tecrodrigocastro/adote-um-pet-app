import 'dart:convert';

import '../../../domain/entities/user_entity.dart';
import '../address_model.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.userType,
    super.phone,
    super.photoUrl,
    super.emailVerifiedAt,
    required super.createdAt,
    required super.updatedAt,
    super.addresses,
    super.organizationName,
    super.cnpj,
    super.responsibleName,
    super.missionStatement,
    super.website,
    super.socialMedia,
    super.verified,
    super.verifiedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'user_type': userType,
      if (phone != null) 'phone': phone,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (emailVerifiedAt != null) 'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      if (addresses != null) 'addresses': addresses!.map((addr) => (addr as AddressModel).toMap()).toList(),
      if (organizationName != null) 'organization_name': organizationName,
      if (cnpj != null) 'cnpj': cnpj,
      if (responsibleName != null) 'responsible_name': responsibleName,
      if (missionStatement != null) 'mission_statement': missionStatement,
      if (website != null) 'website': website,
      if (socialMedia != null) 'social_media': socialMedia,
      if (verified != null) 'verified': verified,
      if (verifiedAt != null) 'verified_at': verifiedAt,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      userType: userType,
      phone: phone,
      photoUrl: photoUrl,
      emailVerifiedAt: emailVerifiedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      addresses: addresses,
      organizationName: organizationName,
      cnpj: cnpj,
      responsibleName: responsibleName,
      missionStatement: missionStatement,
      website: website,
      socialMedia: socialMedia,
      verified: verified,
      verifiedAt: verifiedAt,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    List<AddressModel>? addressList;
    if (map['addresses'] != null) {
      addressList = (map['addresses'] as List).map((addr) => AddressModel.fromMap(addr as Map<String, dynamic>)).toList();
    }

    return UserModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      userType: map['user_type'] ?? 'individual',
      phone: map['phone'],
      photoUrl: map['photo_url'],
      emailVerifiedAt: map['email_verified_at'],
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      addresses: addressList,
      organizationName: map['organization_name'],
      cnpj: map['cnpj'],
      responsibleName: map['responsible_name'],
      missionStatement: map['mission_statement'],
      website: map['website'],
      socialMedia: map['social_media'] as Map<String, dynamic>?,
      verified: map['verified'] == 0 ? false : true,
      verifiedAt: map['verified_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

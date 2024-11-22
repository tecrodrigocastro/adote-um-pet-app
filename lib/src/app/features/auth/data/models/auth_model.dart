import 'dart:convert';
import 'dart:developer';

import '../../domain/entities/auth_entity.dart';
import 'user_model.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.user,
    required super.accessToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': (user as UserModel).toMap(),
      'access_token': accessToken,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    try {
      return AuthModel(
        user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
        accessToken: map['access_token'] as String,
      );
    } catch (e, s) {
      log('Error parsing AuthModel $e $s');
      throw Exception('Error parsing AuthModel $e $s');
    }
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'user_entity.dart';

class AuthEntity {
  final UserEntity user;
  final String accessToken;
  AuthEntity({
    required this.user,
    required this.accessToken,
  });
}

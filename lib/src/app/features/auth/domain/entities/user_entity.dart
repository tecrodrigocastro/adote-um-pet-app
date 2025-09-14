import 'address_entity.dart';

class UserEntity {
  final int id;
  final String name;
  final String email;
  final String userType;
  final String? phone;
  final String? photoUrl;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final List<AddressEntity>? addresses;
  final String? organizationName;
  final String? cnpj;
  final String? responsibleName;
  final String? missionStatement;
  final String? website;
  final Map<String, dynamic>? socialMedia;
  final bool? verified;
  final String? verifiedAt;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
    this.phone,
    this.photoUrl,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.addresses,
    this.organizationName,
    this.cnpj,
    this.responsibleName,
    this.missionStatement,
    this.website,
    this.socialMedia,
    this.verified,
    this.verifiedAt,
  });

  factory UserEntity.empty() => UserEntity(
        id: 0,
        name: '',
        email: '',
        userType: 'individual',
        createdAt: '',
        updatedAt: '',
      );

  bool get isIndividual => userType == 'individual';
  bool get isOrganization => userType == 'organization';

  String get displayName => organizationName ?? name;

  String get address {
    if (addresses != null && addresses!.isNotEmpty) {
      final addr = addresses!.first;
      return '${addr.street}, ${addr.neighborhood}, ${addr.city} - ${addr.state}';
    }
    return '';
  }
}

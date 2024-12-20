class UserEntity {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String zipCode;
  final String address;
  final int numberHouse;
  final String complement;
  final String? photoUrl;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.zipCode,
    required this.address,
    required this.numberHouse,
    required this.complement,
    this.photoUrl,
  });
}

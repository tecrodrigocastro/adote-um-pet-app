class AddressEntity {
  final int? id;
  final int? userId;
  final String street;
  final String neighborhood;
  final int numberHouse;
  final String? complement;
  final String zipCode;
  final String city;
  final String state;
  final String? createdAt;
  final String? updatedAt;

  AddressEntity({
    this.id,
    this.userId,
    required this.street,
    required this.neighborhood,
    required this.numberHouse,
    this.complement,
    required this.zipCode,
    required this.city,
    required this.state,
    this.createdAt,
    this.updatedAt,
  });

  factory AddressEntity.empty() => AddressEntity(
        street: '',
        neighborhood: '',
        numberHouse: 0,
        zipCode: '',
        city: '',
        state: '',
      );
}
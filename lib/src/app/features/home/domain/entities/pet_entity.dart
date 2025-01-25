class PetEntity {
  final int id;
  final String name;
  final String type;
  final int userId;
  final String gender;
  final String size;
  final String birthDate;
  final String breed;
  final String color;
  final String address;
  final String description;
  final List<String> photos;

  PetEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.userId,
    required this.gender,
    required this.size,
    required this.birthDate,
    required this.breed,
    required this.color,
    required this.address,
    required this.description,
    required this.photos,
  });
}

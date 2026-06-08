enum PetType {
  cachorro,
  gato,
  ave,
  coelho;

  String get label => switch (this) {
        PetType.cachorro => 'Cachorro',
        PetType.gato => 'Gato',
        PetType.ave => 'Ave',
        PetType.coelho => 'Coelho',
      };
}

enum PetGender {
  macho,
  femea;

  String get label => switch (this) {
        PetGender.macho => 'Macho',
        PetGender.femea => 'Fêmea',
      };
}

enum PetSize {
  pequeno,
  medio,
  grande,
  enorme;

  String get label => switch (this) {
        PetSize.pequeno => 'Pequeno',
        PetSize.medio => 'Médio',
        PetSize.grande => 'Grande',
        PetSize.enorme => 'Enorme',
      };
}

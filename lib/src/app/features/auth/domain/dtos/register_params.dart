import '../../../../../core/enums/user_type_enum.dart';
import '../../data/models/request/register_model.dart';

class RegisterParams {
  String name;
  String email;
  String password;
  String confirmPassword;
  UserType userType;
  String? phone;
  String? photoUrl;

  // Campos de endereço
  String? street;
  String? neighborhood;
  String? numberHouse;
  String? complement;
  String? zipCode;
  String? city;
  String? state;

  // Campos específicos para organizações
  String? organizationName;
  String? cnpj;
  String? responsibleName;
  String? missionStatement;
  String? website;
  String? facebook;
  String? instagram;
  String? twitter;

  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.userType,
    this.phone,
    this.photoUrl,
    this.street,
    this.neighborhood,
    this.numberHouse,
    this.complement,
    this.zipCode,
    this.city,
    this.state,
    this.organizationName,
    this.cnpj,
    this.responsibleName,
    this.missionStatement,
    this.website,
    this.facebook,
    this.instagram,
    this.twitter,
  });

  factory RegisterParams.empty() => RegisterParams(
        name: '',
        email: '',
        password: '',
        confirmPassword: '',
        userType: UserType.individual,
      );

  bool get isIndividual => userType == UserType.individual;
  bool get isOrganization => userType == UserType.organization;

  static RegisterParams fromMap(Map<String, dynamic> map) {
    return RegisterParams(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
      userType: map['userType'],
      phone: map['phone'],
      photoUrl: map['photoUrl'],
      street: map['street'],
      neighborhood: map['neighborhood'],
      numberHouse: map['numberHouse'],
      complement: map['complement'],
      zipCode: map['zipCode'],
      city: map['city'],
      state: map['state'],
      organizationName: map['organizationName'],
      cnpj: map['cnpj'],
      responsibleName: map['responsibleName'],
      missionStatement: map['missionStatement'],
      website: map['website'],
      facebook: map['facebook'],
      instagram: map['instagram'],
      twitter: map['twitter'],
    );
  }

  RegisterModel toModel() {
    return RegisterModel(
      name: name,
      email: email,
      password: password,
      userType: userType,
      phone: phone,
      photoUrl: photoUrl,
      street: street,
      neighborhood: neighborhood,
      numberHouse: numberHouse,
      complement: complement,
      zipCode: zipCode,
      city: city,
      state: state,
      organizationName: organizationName,
      cnpj: cnpj,
      responsibleName: responsibleName,
      missionStatement: missionStatement,
      website: website,
      facebook: facebook,
      instagram: instagram,
      twitter: twitter,
    );
  }
}

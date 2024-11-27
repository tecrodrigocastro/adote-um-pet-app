import 'package:lucid_validation/lucid_validation.dart';

import '../../../../../core/extensions/lucid_validator_extensions.dart';
import '../dtos/register_params.dart';

class RegisterParamsValidator extends LucidValidator<RegisterParams> {
  RegisterParamsValidator() {
    ruleFor((user) => user.name, key: 'name', label: 'nome')
        .notEmpty()
        .minLength(3);

    ruleFor((user) => user.email, key: 'email', label: 'e-mail')
        .notEmpty()
        .validEmail();

    ruleFor((user) => user.password, key: 'password', label: 'senha')
        .customValidPassword();

    ruleFor((user) => user.confirmPassword,
            key: 'confirmPassword', label: 'confirmar senha')
        .customValidPassword()
        .equalTo((user) => user.password, message: 'senhas não conferem');

    ruleFor((user) => user.phone, key: 'phone', label: 'telefone')
        .notEmpty()
        .minLength(11);

    ruleFor((user) => user.zipCode, key: 'zipCode', label: 'CEP')
        .notEmpty()
        .minLength(8);

    ruleFor((user) => user.address, key: 'address', label: 'endereço')
        .notEmpty()
        .minLength(3);

    ruleFor((user) => user.numberHouse.toString(),
            key: 'number', label: 'número')
        .notEmpty()
        .minLength(1);

    ruleFor((user) => user.complement, key: 'complement', label: 'complemento')
        .notEmpty()
        .minLength(3);
  }
}

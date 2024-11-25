import 'package:lucid_validation/lucid_validation.dart';

import '../dtos/login_params.dart';

class LoginParamsValidator extends LucidValidator<LoginParams> {
  LoginParamsValidator() {
    ruleFor((user) => user.email, key: 'email', label: 'e-mail')
        .notEmpty()
        .validEmail();

    ruleFor((user) => user.password, key: 'password', label: 'senha') //
        .notEmpty()
        .minLength(8)
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveNumber()
        .mustHaveSpecialCharacter();
  }
}
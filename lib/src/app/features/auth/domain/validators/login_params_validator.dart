import 'package:lucid_validation/lucid_validation.dart';

import '../dtos/login_params.dart';

class LoginParamsValidator extends LucidValidator<LoginParams> {
  LoginParamsValidator() {
    ruleFor((user) => user.email, key: 'email')
        .notEmpty()
        .validEmail();

    ruleFor((user) => user.password, key: 'password') //
        .notEmpty()
        .minLength(8, message: 'Must be at least 8 characters long')
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveNumber()
        .mustHaveSpecialCharacter();
  }
}
import 'package:lucid_validation/lucid_validation.dart';

import '../../../../../core/extensions/lucid_validator_extensions.dart';
import '../dtos/login_params.dart';

class LoginParamsValidator extends LucidValidator<LoginParams> {
  LoginParamsValidator() {
    ruleFor((user) => user.email, key: 'email', label: 'e-mail')
        .notEmpty()
        .validEmail();

    ruleFor((user) => user.password, key: 'password', label: 'senha') //
        .customValidPassword();
  }
}

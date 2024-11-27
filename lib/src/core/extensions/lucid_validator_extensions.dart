import 'package:lucid_validation/lucid_validation.dart';
import 'package:result_dart/result_dart.dart';

import '../errors/errors.dart';

extension LucidValidatorExtensions<T extends Object> on LucidValidator<T> {
  Result<T, BaseException> validateResult(T object) {
    final result = validate(object);
    if (result.isValid) {
      return Success(object);
    }

    return Failure(
      CredentialsValidationException(message: result.exceptions.first.message),
    );
  }
}

extension CustomValidPasswordValidator on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> customValidPassword() {
    return notEmpty()
        .minLength(8)
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveNumber()
        .mustHaveSpecialCharacter();
  }
}

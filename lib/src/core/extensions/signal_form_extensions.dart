import 'package:signal_form/signal_form.dart';

extension CustomPasswordValidator on Field<String> {
  Field<String> customValidPassword() {
    return required(message: 'A senha não pode estar vazia')
        .minLength(8, message: 'Mínimo 8 caracteres', exposed: true)
        .mustHaveLowercase(message: 'Uma letra minúscula', exposed: true)
        .mustHaveUppercase(message: 'Uma letra maiúscula', exposed: true)
        .mustHaveNumber(message: 'Um número', exposed: true)
        .mustHaveSpecialChar(message: 'Um caractere especial', exposed: true);
  }

  Field<String> customConfirmPassword() {
    return required(message: 'Confirme a senha').equals(
      (valueOf) => valueOf<String>('password'),
      message: 'As senhas não coincidem',
    );
  }

  Field<String> customValidEmail() {
    return required(message: 'O e-mail não pode estar vazio')
        .email(message: 'O e-mail informado é inválido');
  }

  Field<String> customValidPhone() {
    return required(message: 'O telefone não pode estar vazio')
        .validPhoneBR(message: 'Número de telefone inválido')
        .mask('(##) #####-####');
  }

  Field<String> customValidCEP() {
    return required(message: 'O CEP não pode estar vazio')
        .validCEP(message: 'CEP inválido')
        .mask('#####-###');
  }

  Field<String> customValidCNPJ() {
    return required(message: 'O CNPJ não pode estar vazio')
        .validCNPJ(message: 'CNPJ inválido')
        .mask('##.###.###/####-##');
  }
}

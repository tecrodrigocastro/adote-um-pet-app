import 'package:signal_form/signal_form.dart';

import '../../../../../core/enums/pet_enums.dart';

class DonateViewmodel {
  late final form = formCtrl(() => (
        name: Field<String>('name')
            .required(message: 'O nome do pet não pode estar vazio'),
        type: Field<PetType>('type')
            .isNotNull(message: 'Selecione o tipo do pet')
            .transformToJson((v) => v?.name),
        gender: Field<PetGender>('gender')
            .isNotNull(message: 'Selecione o sexo do pet')
            .transformToJson((v) => v?.name),
        size: Field<PetSize>('size')
            .isNotNull(message: 'Selecione o porte do pet')
            .transformToJson((v) => v?.name),
        birthDate: Field<DateTime>('birthDate')
            .required(message: 'Informe a data de nascimento')
            .inPast(message: 'A data deve ser no passado'),
        vaccinated: Field<bool>('vaccinated', false),
        castrated: Field<bool>('castrated', false),
        description: Field<String>('description')
            .required(message: 'Descreva o pet')
            .minLength(20, message: 'Use pelo menos 20 caracteres'),
      ));

  void onSubmit() => form.submit((ctrl) async {
        // TODO: implementar use case de cadastro de pet
      });
}

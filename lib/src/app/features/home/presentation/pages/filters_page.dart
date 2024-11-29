import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/show_snack_bar.dart';
import '../../domain/dtos/get_pets_params.dart';
import '../bloc/home_bloc.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  final homeBloc =
      GetIt.I.get<HomeBloc>(); //! Controller que funciona por eventos
  final petsParams = GetPetsParams.empty();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Bem-vindo(a),',
                          style: theme.textTheme.headlineSmall,
                        ),
                        TextSpan(
                          text: 'Mariana!',
                          style: theme.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Encontre o seu amigo peludo.',
                    style: theme.textTheme.labelSmall!.copyWith(fontSize: 16),
                  ),
                  const Gap(24),
                  ChoosePetTypeRow(
                    onChanged: petsParams.setType,
                    label: 'Qual pet você gostaria de doar?',
                  ),
                  const Gap(24),
                  ChoosePetGenderRow(
                    onChanged: petsParams.setGender,
                    label: 'Qual o sexo?',
                  ),
                  const Gap(24),
                  ChoosePetDonationTypeRow(
                    onChanged: (petDonationType) {},
                    label: 'Qual o tipo da doação?',
                  ),
                  const Gap(24),
                  ChoosePetSizeRow(
                    onChanged: (petSize) {},
                    label: 'E o tamanho?',
                  ),
                  const Gap(24),
                  const AgeSlider(),
                  const Gap(48),
                  BlocConsumer<HomeBloc, HomeState>(
                    listener: (context, state) {
                      //! Reação
                      if (state is GetPetsSuccess) {
                        print('${state.data.data.toString()}');
                      }
                      if (state is GetPetsFailure) {
                        showMessageSnackBar(
                          context,
                          state.message,
                          icon: Icons.error,
                          iconColor: AppColors.whiteColor,
                          color: AppColors.primaryColor,
                        );
                      }
                    },
                    builder: (context, state) {
                      return PrimaryButtonDs(
                        width: double.maxFinite,
                        title: 'Adote o seu pet',
                        onPressed: () {
                          homeBloc.add(GetPetsEvent(
                              getPetsParams: petsParams)); //! Adição de evento
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

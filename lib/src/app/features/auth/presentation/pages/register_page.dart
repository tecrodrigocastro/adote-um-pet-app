import 'package:adote_um_pet/src/routes.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  MaskedTextController numberController =
      MaskedTextController(mask: '(00) 00000-0000');
  MaskedTextController cepController = MaskedTextController(mask: '00000-000');
  TextEditingController addressController = TextEditingController();
  TextEditingController numberHouseController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(17),
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cadastro',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(29),
              TextInputDs(
                label: 'nome',
                controller: nameController,
                width: size.width,
              ),
              const Gap(25),
              TextInputDs(
                label: 'e-mail',
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                width: size.width,
              ),
              const Gap(25),
              TextInputDs(
                width: size.width,
                label: 'senha',
                controller: passwordController,
                isPassword: true,
              ),
              const Gap(25),
              TextInputDs(
                width: size.width,
                label: 'confirmar senha',
                controller: confirmPasswordController,
                isPassword: true,
              ),
              const Gap(25),
              TextInputDs(
                label: 'telefone',
                controller: numberController,
                textInputType: TextInputType.number,
                width: size.width,
              ),
              const Gap(25),
              TextInputDs(
                label: 'cep',
                controller: cepController,
                textInputType: TextInputType.number,
                width: size.width,
              ),
              const Gap(25),
              TextInputDs(
                label: 'Endereço',
                controller: addressController,
                textInputType: TextInputType.number,
                width: size.width,
              ),
              const Gap(25),
              Row(
                children: [
                  TextInputDs(
                    label: 'Número',
                    controller: numberHouseController,
                    textInputType: TextInputType.number,
                    width: size.width * 0.3,
                  ),
                  const Gap(10),
                  Flexible(
                    child: TextInputDs(
                      label: 'Complemento',
                      controller: complementController,
                      textInputType: TextInputType.number,
                      width: size.width * 0.59,
                    ),
                  ),
                ],
              ),
              const Gap(40),
              Align(
                alignment: Alignment.center,
                child: PrimaryButtonDs(
                  title: 'Cadastrar',
                  onPressed: () {
                    router.go('/auth/welcome');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

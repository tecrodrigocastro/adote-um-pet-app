import 'dart:developer';
import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/features/users/presentation/bloc/user_bloc.dart';
import '../../../../../core/utils/show_snack_bar.dart';
import '../../../../../routes.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  File? _imageFile;
  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      // Handle any errors here
      print('Erro ao selecionar imagem: $e');
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeria'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Câmera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final userBloc = context.read<UserBloc>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _showImageSourceActionSheet(context);
                },
                child: SizedBox(
                  width: size.width * 0.55,
                  height: size.width * 0.55,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffEFEFF1),
                    backgroundImage:
                        _imageFile != null ? FileImage(_imageFile!) : null,
                    child: _imageFile == null
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AppIcons.uploadIcon,
                                width: 55,
                                height: 55,
                              ),
                            ],
                          )
                        : null,
                  ),
                ),
              ),
              const Gap(40),
              Text(
                'Olá Mariana,',
                style: theme.textTheme.displaySmall,
              ),
              Text(
                'Seja bem-vinda!',
                style: theme.textTheme.displaySmall,
              ),
              Gap(size.height * 0.3),
              BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is UpdatePhotoSuccess) {
                    showMessageSnackBar(
                      context,
                      'Foto atualizada com sucesso!',
                      icon: Icons.check,
                      iconColor: AppColors.secondaryColor,
                    );
                    router.go('/choose');
                  }

                  if (state is UpdatePhotoError) {
                    showMessageSnackBar(
                      context,
                      state.error.message,
                      icon: Icons.error,
                      iconColor: AppColors.primaryColor,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is UpdatePhotoLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  return PrimaryButtonDs(
                    title: 'Começar',
                    onPressed: () async {
                      if (_imageFile != null) {
                        log(_imageFile!.lengthSync().toString());
                        userBloc.add(
                          UpdatePhotoUserEvent(image: _imageFile!),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes.dart';

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
              PrimaryButtonDs(
                title: 'Começar',
                onPressed: () {
                  router.go(AppRoutes.choosePage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

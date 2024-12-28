import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      debugPrint('Erro ao selecionar imagem: $e');
      return null;
    }
  }

  Future<void> showImageSourceSheet(
    BuildContext context, {
    required Function(File) onImageSelected,
  }) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeria'),
                onTap: () async {
                  Navigator.pop(context);
                  final file = await pickImage(ImageSource.gallery);
                  if (file != null) {
                    onImageSelected(file);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Câmera'),
                onTap: () async {
                  Navigator.pop(context);
                  final file = await pickImage(ImageSource.camera);
                  if (file != null) {
                    onImageSelected(file);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

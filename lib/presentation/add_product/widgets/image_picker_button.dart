import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerButton extends StatefulWidget {
  final Function(File pickedImage) onImagePicked;
  const ImagePickerButton({
    required this.onImagePicked,
    super.key,
  });

  @override
  State<ImagePickerButton> createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends State<ImagePickerButton> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });

        widget.onImagePicked(_selectedImage!);
      }
    } catch (e) {
      debugPrint('Error al seleccionar imagen: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _pickImage,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              child: Center(
                child: Text(_selectedImage == null ? 'Seleccionar imagen' : 'Cambiar imagen'),
              ),
            ),
          ),
        ),
        if (_selectedImage != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

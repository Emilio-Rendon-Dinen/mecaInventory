import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerButton extends StatefulWidget {
  final Function(
    File pickedImage,
    Uint8List bytes,
  ) onImagePicked;

  const ImagePickerButton({
    required this.onImagePicked,
    super.key,
  });

  @override
  State<ImagePickerButton> createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends State<ImagePickerButton> {
  File? _selectedImage;
  Uint8List? _imageBytes;

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
        final File imageFile = File(pickedFile.path);
        // Convertir a Uint8List para la base de datos
        final Uint8List bytes = await imageFile.readAsBytes();

        setState(() {
          _selectedImage = imageFile;
          _imageBytes = bytes;
        });

        widget.onImagePicked(imageFile, bytes);
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
                child: Text(
                  _selectedImage == null ? 'Seleccionar imagen' : 'Cambiar imagen',
                ),
              ),
            ),
          ),
        ),
        if (_selectedImage != null || _imageBytes != null)
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
                child: _selectedImage != null
                    ? Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      )
                    : Image.memory(
                        _imageBytes!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
      ],
    );
  }
}

import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerButton extends StatefulWidget {
  final Function(Uint8List bytes) onImagePicked;

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

  // Muestra las opciones (galería o cámara)
  void _showOptionsDialog() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Seleccionar de galería'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Tomar una foto'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      // Pide el permiso correspondiente

      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        final sdkInt = androidInfo.version.sdkInt;

        PermissionStatus status;
        if (sdkInt >= 33) {
          status = await Permission.photos.request(); // Android 13+
        } else {
          status = await Permission.storage.request(); // Android <13
        }

        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Permiso denegado.')),
          );
          return;
        }
      }

      // iOS: no pedimos permiso manual, image_picker lo hace
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
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

        widget.onImagePicked(bytes);
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
        _selectedImage == null
            ? InkWell(
                onTap: _showOptionsDialog,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color.fromARGB(123, 148, 147, 147),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_a_photo_outlined),
                        Text('Agrega una foto al producto'),
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
        if (_selectedImage != null || _imageBytes != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: _showOptionsDialog,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _selectedImage != null
                    ? Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.8,
                      )
                    : Image.memory(
                        _imageBytes!,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.8,
                      ),
              ),
            ),
          ),
      ],
    );
  }
}

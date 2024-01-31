import 'dart:io';
import 'package:flutter/material.dart';
import 'package:seruapp/view/components/form.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seruapp/view/components/full_image_view.dart';

class FormScreenSecond extends StatefulWidget {
  const FormScreenSecond({super.key});

  @override
  State<FormScreenSecond> createState() => _FormScreenSecondState();
}

class _FormScreenSecondState extends State<FormScreenSecond> {
  final _formKeys = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        debugPrint('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKeys,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const FormLabel(labels: 'Upload Photo ID'),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_imageFile != null) ...[
                            ListTile(
                              leading: const Icon(Icons.remove_red_eye),
                              title: const Text('Preview'),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FullPicture(image: _imageFile!.path)));
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.delete_forever),
                              title: const Text('Remove'),
                              onTap: () {
                                setState(() => _imageFile = null);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Camera'),
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Gallery'),
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          _imageFile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : const Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 50,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}
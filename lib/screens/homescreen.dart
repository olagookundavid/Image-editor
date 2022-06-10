import 'package:flutter/material.dart';
import 'package:image_editor/screens/eddit_image_screen.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () async {
            XFile? file =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (file != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => EditImageScreen(
                        selectedImage: file.path,
                      )),
                ),
              );
            }
          },
          icon: const Icon(Icons.upload_file),
        ),
      ),
    );
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_editor/models/text_info.dart';
import 'package:image_editor/wigdets/default_buttons.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import '../screens/eddit_image_screen.dart';
import '../utils/permissions.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  List<TextInfo> texts = [];
  int currentIndex = 0;
  ScreenshotController screenshotController = ScreenshotController();

  setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Selected For styling',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  increaseFontSize() {
    setState(() {
      texts[currentIndex].fontsize += 1.5;
    });
  }

  decreaseFontSize() {
    setState(() {
      texts[currentIndex].fontsize -= 1.5;
    });
  }

  alignCenter() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  alignLeft() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  alignRight() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  makeBold() {
    setState(() {
      if (texts[currentIndex].fontWeight == FontWeight.bold) {
        texts[currentIndex].fontWeight = FontWeight.normal;
      } else {
        texts[currentIndex].fontWeight = FontWeight.bold;
      }
    });
  }

  makeItalize() {
    setState(() {
      if (texts[currentIndex].fontStyle == FontStyle.italic) {
        texts[currentIndex].fontStyle = FontStyle.normal;
      } else {
        texts[currentIndex].fontStyle = FontStyle.italic;
      }
    });
  }

  newLine() {
    setState(() {
      if (texts[currentIndex].text.contains('\n')) {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll('\n', ' ');
      } else {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll(' ', '\n');
      }
    });
  }

  removeText(BuildContext context) {
    setState(() {
      texts.removeAt(currentIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Selected For styling',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  saveToGallery(BuildContext context) {
    if (texts.isNotEmpty) {
      screenshotController.capture().then((Uint8List? image) {
        saveImage(image!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Image Saved',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      }).catchError((err) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Could not Save Image',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      });
    }
  }

  saveImage(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'Screenshot_$time';
    await requestPermission(Permission.storage);
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  addNewText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
            text: controller.text,
            left: 0,
            top: 0,
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontsize: 20,
            textAlign: TextAlign.left),
      );
      Navigator.pop(context);
    });
  }

  addNewDialog(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add New Text'),
        content: TextField(
          controller: controller,
          maxLines: 5,
          decoration: const InputDecoration(
              suffixIcon: Icon(Icons.edit),
              filled: true,
              hintText: 'your text here'),
        ),
        actions: [
          DefaultButton(
            child: const Text('Add Text'),
            color: Colors.red,
            textcolor: Colors.white,
            onpressed: () {
              if (controller.text.isEmpty) {
                return;
              } else {
                addNewText(context);
                controller.clear();
              }
            },
          ),
          const SizedBox(
            width: double.infinity,
          ),
          DefaultButton(
            child: const Text(
              'Back',
              style: TextStyle(color: Colors.black),
            ),
            color: Colors.white,
            textcolor: Colors.black,
            onpressed: () {
              Navigator.pop(context);
              controller.clear();
            },
          ),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import '../wigdets/appbarbutton.dart';
import '../wigdets/edit_imageviewmodel.dart';
import '../wigdets/image_text.dart';
import 'package:screenshot/screenshot.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({Key? key, required this.selectedImage})
      : super(key: key);
  final String selectedImage;

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: SafeArea(
        child: Screenshot(
          controller: screenshotController,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              children: [
                _selectedImage,
                for (int i = 0; i < texts.length; i++)
                  Positioned(
                    left: texts[i].left,
                    top: texts[i].top,
                    child: GestureDetector(
                      onLongPress: () {
                        currentIndex = i;
                        removeText(context);
                      },
                      onTap: () {
                        setCurrentIndex(context, i);
                      },
                      child: Draggable(
                        child: ImageText(
                          textInfo: texts[i],
                        ),
                        feedback: ImageText(
                          textInfo: texts[i],
                        ),
                        onDragEnd: (drag) {
                          final renderBox =
                              context.findRenderObject() as RenderBox;
                          Offset off = renderBox.globalToLocal(drag.offset);
                          setState(() {
                            texts[i].top = off.dy - 96;
                            texts[i].left = off.dx;
                          });
                        },
                      ),
                    ),
                  ),
                creatorText.text.isNotEmpty
                    ? Positioned(
                        left: 0,
                        bottom: 0,
                        child: Text(
                          creatorText.text,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _addtext,
    );
  }

  Widget get _selectedImage => Center(
        child: Image.file(
          File(widget.selectedImage),
        ),
      );

  Widget get _addtext => FloatingActionButton(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'add text',
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      );

  AppBar get _appbar => AppBar(
        backgroundColor: Colors.grey[300],
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              AppBarIconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icons.restore_page_outlined,
                tooltip: 'Choose another Image',
              ),
              AppBarIconButton(
                onPressed: () => saveToGallery(context),
                icon: Icons.save,
                tooltip: 'Save Image',
              ),
              AppBarIconButton(
                onPressed: increaseFontSize,
                icon: Icons.add,
                tooltip: 'Increase Font size',
              ),
              AppBarIconButton(
                onPressed: decreaseFontSize,
                icon: Icons.remove,
                tooltip: 'Decrease Font Size',
              ),
              AppBarIconButton(
                onPressed: alignLeft,
                icon: Icons.format_align_left,
                tooltip: 'Align Left',
              ),
              AppBarIconButton(
                onPressed: alignCenter,
                icon: Icons.format_align_center,
                tooltip: 'Align Center',
              ),
              AppBarIconButton(
                onPressed: alignRight,
                icon: Icons.format_align_right,
                tooltip: 'Align Right',
              ),
              AppBarIconButton(
                onPressed: makeBold,
                icon: Icons.format_bold,
                tooltip: 'Make Text Bold',
              ),
              AppBarIconButton(
                onPressed: makeItalize,
                icon: Icons.format_italic,
                tooltip: 'Italize Text',
              ),
              AppBarIconButton(
                onPressed: newLine,
                icon: Icons.space_bar,
                tooltip: 'Cast Text to New Lines',
              ),
              Tooltip(
                message: 'orange',
                child: GestureDetector(
                  onTap: () {
                    changeTextColor(Colors.orange);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'red',
                child: GestureDetector(
                  onTap: () {
                    changeTextColor(Colors.red);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'black',
                child: GestureDetector(
                  onTap: () {
                    changeTextColor(Colors.black);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'blue',
                child: GestureDetector(
                  onTap: () {
                    changeTextColor(Colors.blue);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'yellow',
                child: GestureDetector(
                  onTap: () {
                    changeTextColor(Colors.yellow);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'green',
                child: GestureDetector(
                  onTap: () {
                    changeTextColor(Colors.green);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'white',
                child: GestureDetector(
                  onTap: () {
                    changeTextColor(Colors.white);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'pink',
                child: GestureDetector(
                  onTap: () {
                    changeTextColor(Colors.pink);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        ),
      );
}

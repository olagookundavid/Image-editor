import 'package:flutter/material.dart';
import 'screens/base_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Editor',
      theme: ThemeData.light(),
      home: const BaseScreen(),
    );
  }
}


//https://blog.logrocket.com/using-sharedpreferences-in-flutter-to-store-data-locally/ 
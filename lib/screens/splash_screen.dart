import 'dart:async';
import 'package:flutter/material.dart';
import 'homescreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
      ),
    );
    return Scaffold(
        body: Container(
            color: Colors.blue[200],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Spacer(),
                  Text(
                    'Image Editor',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    """
* This is a very basic image editing app.

* Add texts to your app and save.

* The top bar is scrollable.

* Long-Press on texts to delete them.

* Try out the features.
""",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 3,
                        wordSpacing: 3),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            )));
  }
}

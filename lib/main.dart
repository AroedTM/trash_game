import 'package:flutter/material.dart';
import 'buttons.dart';
import 'Easy.dart';
import 'Medium.dart';
import 'Hard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void changePageEasy(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MyJeuEasy(title: "Jeu Easy")));
  }

  void changePageMedium(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MyJeuMedium(title: "Jeu Medium")));
  }

  void changePageHard(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MyJeuHard(title: "Jeu Hard")));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("image/Bg.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("image/Bg.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Button("EASY", "image/EasyIcon.png", changePageEasy),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Button("MEDIUM", "image/MediumIcon.png", changePageMedium),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Button("HARD", "image/HardIcon.png", changePageHard),
            ],
          ),
        ),
      ]),
    );
  }
}

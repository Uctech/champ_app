import 'package:champ_app/util/hex_color.dart';
import 'package:champ_app/widget/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  ThemeData buildTheme() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      primaryColor: HexColor("4142d2"),
      hintColor: HexColor("a2a2a2"),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
            color: HexColor("a2a2a2"),
            fontSize: 14.0
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Champ App',
      theme: buildTheme(),
      home: Home(),
    );
  }
}

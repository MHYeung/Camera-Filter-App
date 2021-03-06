import 'package:flutter/material.dart';

class CustomTheme extends ChangeNotifier {
  bool _value = false;

  bool get value => _value;

  ThemeData _current = lightTheme;

  ThemeData get current => _current;

  toggleTheme(bool isDark) {
    _current = isDark ? darkTheme : lightTheme;
    _value = isDark ? true : false;
    return notifyListeners();
  }

  static ThemeData lightTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        primary: Colors.brown[700],
        textStyle: TextStyle(color: Colors.black),
      )),
      buttonColor: Colors.brown[700],
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(196, 245, 240, 1),
        centerTitle: true,
      ),
      accentColor: Colors.brown[700],
      snackBarTheme:
          SnackBarThemeData(backgroundColor: Colors.black,),
      primaryColor: Color.fromRGBO(196, 226, 245, 1.0),
      scaffoldBackgroundColor: Color.fromRGBO(196, 201, 245, 1),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black, fontSize: 20),
        bodyText2: TextStyle(color: Colors.black, fontSize: 20),
        button: TextStyle(color: Colors.black),
        headline1: TextStyle(fontWeight: FontWeight.bold),
        caption: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ).apply(displayColor: Colors.black, bodyColor: Colors.black));

  static ThemeData darkTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        primary: Colors.brown[700],
        textStyle: TextStyle(color: Colors.white),
      )),
      buttonColor: Colors.brown[700],
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(4, 39, 86, 1),
        centerTitle: true,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.white54,
      ),
      primaryColor: Color(0xff1f655d),
      accentColor: Color(0xff40bf7a),
      scaffoldBackgroundColor: Color.fromRGBO(2, 16, 35, 1),
      textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white, fontSize: 20),
          bodyText2: TextStyle(color: Colors.white, fontSize: 20),
          button: TextStyle(color: Colors.white),
          headline1: TextStyle(fontWeight: FontWeight.bold),
          caption: TextStyle(
            fontWeight: FontWeight.normal,
          )).apply(bodyColor: Colors.white, displayColor: Colors.white));
}

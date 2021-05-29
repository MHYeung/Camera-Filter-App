

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pages/camera_page.dart';
import 'Pages/home_page.dart';
import 'Pages/setting_page.dart';

class CustomRouter{
  static Route<dynamic> generateRoute (RouteSettings settings){
    switch(settings.name){
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());
      case '/camera':
        return MaterialPageRoute(builder: (_) => CameraPage());
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ERROR'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}
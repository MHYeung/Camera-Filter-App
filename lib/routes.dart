import 'dart:io';

import 'package:camera_filter/Model/screen_arguments.dart';

import 'Pages/camera_filter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pages/camera_page.dart';
import 'Pages/setting_page.dart';

class CustomRouter{
  static Route<dynamic> generateRoute (RouteSettings settings){
    final dynamic args = settings.arguments;
    ScreenArguments arguments = args;
    switch(settings.name){
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());
      case '/camera':
        return MaterialPageRoute(builder: (_) => CameraPage());
      case '/filter':
        return MaterialPageRoute(builder: (_) => FilterPage(image: arguments.file,filterName: arguments.filterName));
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
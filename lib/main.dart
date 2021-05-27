import 'package:camera_filter/routes.dart';
import 'package:camera_filter/theme_selection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_) => CustomTheme()),
        ],
      child: Base(),
    ));
}

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRouter.generateRoute,
      theme: Provider.of<CustomTheme>(context).current,
      initialRoute: '/home',
    );
  }
}

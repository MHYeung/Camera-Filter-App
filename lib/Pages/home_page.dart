import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_selection.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/settings'), icon: Icon(Icons.settings))
        ],
      ),
      body: Center(
          child: ElevatedButton(child: Text('Camera'), onPressed: () => Navigator.pushNamed(context, '/camera'),))
    );
  }
}

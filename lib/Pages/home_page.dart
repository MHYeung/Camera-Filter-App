import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_selection.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {},
              child: Text(
                'Press Me',
                style: TextStyle(
                    color:
                        Provider.of<CustomTheme>(context, listen: false).value
                            ? Colors.white
                            : Colors.black),
              )),
          Switch(
            onChanged: (bool value) =>
                Provider.of<CustomTheme>(context, listen: false)
                    .toggleTheme(value),
            value: Provider.of<CustomTheme>(context, listen: false).value,
          ),
        ],
      )),
    );
  }
}

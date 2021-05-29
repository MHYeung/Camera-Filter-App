import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_selection.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => Navigator.popAndPushNamed(context, '/home'),),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              settingRow('DarkMode', true, context),
              settingRow('Option 2', false, context),
              settingRow('Option 3', false, context),
            ],
          ),
        ),
      ),
    );
  }
  Widget settingRow(String title, bool isSwitch, BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          isSwitch? Switch(
            onChanged: (bool value) =>
                Provider.of<CustomTheme>(context, listen: false)
                    .toggleTheme(value),
            value: Provider.of<CustomTheme>(context, listen: false).value,
          ) : ElevatedButton(onPressed: (){}, child: Text('N'))
        ],
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages.dart';
import 'widgets.dart';

const String TITLE = 'Where To Go';
final List<Option> options = <Option>[
  ToggleOption(
    title: 'ToggleOptionName1',
    description: 'ToggleOptionDescription1',
    onTap: (enabled) {

    }
  ),
  ChooseOption(
    title: 'ChooseOptionName1',
    description: 'ChooseOptionDescription1',
    onTap: () {

    }
  )
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext _) {
    return Builder(
      builder: (context) => MaterialApp(
        title: TITLE,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        routes: <String, WidgetBuilder>{
          '/settings': (context) => SettingsPage(),
          '/login': (context) => LoginPage()
        },
        home: LoginPage(),
      )
    );
  }
}

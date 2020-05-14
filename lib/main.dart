import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

const String TITLE = 'Where To Go';

void main() {
  runApp(MyApp());
}

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
          '/settings': (BuildContext context) => SettingsPage(),
          '/login': (BuildContext context) => LoginPage()
        },
        home: LoginPage(),
      )
    );
  }
}

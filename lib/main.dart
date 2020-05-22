import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:where_to_go/ui/android.dart';

const String TITLE = 'Where To Go';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: LoginPage(),
    );
  }
}

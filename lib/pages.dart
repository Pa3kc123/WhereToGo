import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:where_to_go/controllers.dart';

import 'entities.dart';
import 'widgets.dart';

import 'main.dart' show TITLE;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    StatefulWidget nameTextField;
    StatefulWidget passTextField;
    Widget loginButton;
    Widget registerButton;

    if (Platform.isIOS || Platform.isMacOS) {
      nameTextField = CupertinoTextField(
        autocorrect: false,
        placeholder: 'Email/Username',
        onChanged: (String value) => name = value,
      );
      passTextField = CupertinoTextField(
        autocorrect: false,
        obscureText: true,
        placeholder: 'Password',
        maxLength: 30,
        onChanged: (String value) => pass = value,
      );
      loginButton = CupertinoButton(
        child: const Text(
          'Login'
        ),
        onPressed: () {
        }
      );
      registerButton = CupertinoButton(
        child: const Text(
          'Register'
        ),
        onPressed: () {

        },
      );
    } else {
      nameTextField = TextField(
        autocorrect: false,
        decoration: const InputDecoration(
          hintText: 'Email'
        ),
        onChanged: (String value) => name = value,
      );
      passTextField = TextField(
        autocorrect: false,
        obscureText: true,
        maxLength: 30,
        decoration: const InputDecoration(
          hintText: 'Password'
        ),
        onChanged: (String value) => pass = value,
      );
      loginButton = MaterialButton(
        child: const Text(
          'Login'
        ),
        onPressed: () {}
      );
      registerButton = MaterialButton(
        child: const Text(
          'Register'
        ),
        onPressed: () async {
          EmployeeController.create('pa3kc123@gmail.com', name, utf8.fuse(base64).encode(pass));
        }
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          TITLE,
          style: const TextStyle(
            color: Colors.white
          )
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => {
              Navigator.pushNamed(context, '/settings')
            }
          )
        ]
      ),
      body: Column(
        children: [
          nameTextField,
          passTextField,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              registerButton,
              loginButton,
            ]
          )
        ]
      )
    );
  }
}

class HomePage extends StatelessWidget {
  final Employee employee;

  const HomePage({this.employee, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page'
        )
      ),
      body: Column(
        children: [
          Text(
            'Name = ${employee.name}'
          ),
          // Text(
          //   'Token = ${employee.token}'
          // )
        ]
      )
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings'
        )
      ),
      body: ListView.separated(
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return ToggleOption(
              title: 'Toggle option title',
              description: 'Toggle option desc',
              onTap: (enabled) {

              }
            );
          } else {
            return ChooseOption(
              title: 'Choose option title',
              description: 'Choose option desc',
              onTap: () {

              }
            );
          }
        },
        separatorBuilder: (context, index) => Divider()
      )
    );
  }
}

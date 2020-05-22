import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:where_to_go/controllers.dart';

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

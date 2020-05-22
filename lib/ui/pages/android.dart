import 'package:flutter/material.dart' hide TextField, MaterialButton;
import 'package:where_to_go/ui/widgets/android.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AndroidTextField _userTextField;
  AndroidTextField _passTextField;
  AndroidButton _loginButton;
  AndroidButton _registerButton;

  String _userTextFieldValue = '';
  String _passTextFieldValue = '';

  @override
  void initState() {
    super.initState();

    _userTextField = AndroidTextField(
      hintText: 'Username/Email',
      onChanged: (value) => _userTextFieldValue = value
    );
    _passTextField = AndroidTextField(
      hintText: 'Password',
      maxLength: 30,
      obscureText: true,
      onChanged: (value) => _passTextFieldValue = value
    );
    _loginButton = AndroidButton(
      btnText: 'Login',
      onPressed: () {
        //TODO: LOGIN
      }
    );
    _registerButton = AndroidButton(
      btnText: 'Register',
      onPressed: () {
        Navigator.push(
          super.context,
          MaterialPageRoute(
            builder: (_) => RegisterPage()
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page'
        )
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _userTextField,
            spacer,
            _passTextField,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _registerButton,
                spacer,
                _loginButton
              ]
            )
          ]
        )
      )
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AndroidTextField _mailTextField;
  AndroidTextField _userTextField;
  AndroidTextField _passTextField;
  AndroidButton _registerButton;

  String _mailTextFieldValue = '';
  String _userTextFieldValue = '';
  String _passTextFieldValue = '';

  @override
  void initState() {
    super.initState();

    _mailTextField = AndroidTextField(
      hintText: 'Email',
      onChanged: (value) => _mailTextFieldValue = value
    );
    _userTextField = AndroidTextField(
      hintText: 'Username',
      onChanged: (value) => _userTextFieldValue = value
    );
    _passTextField = AndroidTextField(
      obscureText: true,
      hintText: 'Password',
      onChanged: (value) => _passTextFieldValue = value
    );
    _registerButton = AndroidButton(
      btnText: 'Register',
      onPressed: () {
        //TODO: Registration
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register page'
        )
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _mailTextField,
            spacer,
            _userTextField,
            spacer,
            _passTextField,
            _registerButton
          ]
        )
      )
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page'
        )
      ),
      body: Container()
    );
  }
}

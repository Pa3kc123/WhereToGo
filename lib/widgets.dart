import 'package:flutter/material.dart';

import 'main.dart' show TITLE;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  String paswd = '';

  @override
  Widget build(BuildContext context) {
    TextField nameTextField = TextField(
      autocorrect: false,
      decoration: const InputDecoration(
        hintText: 'Email/Username'
      ),
      onChanged: (String value) => name = value,
    );
    TextField paswdTextField = TextField(
      autocorrect: false,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password'
      ),
      onChanged: (String value) => paswd = value,
    );

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
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              nameTextField,
              paswdTextField,
              MaterialButton(
                onPressed: () => {
                  print('name = $name'),
                  print('paswd = $paswd'),
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Mohol by si prestat pisat hluposti???'
                      ),
                    )
                  )
                },
                color: Theme.of(context).primaryColor,
                child: const Text(
                  'Buton'
                )
              )
            ]
          );
        }
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
        itemCount: 90,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    'Description'
                  )
                ]
              )
            )
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 2.0,
            color: HSLColor.fromAHSL(1.0, (index * 4) % 359.0, 1.0, 0.5).toColor()
          );
        }
      )
    );
  }
}

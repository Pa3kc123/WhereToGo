import 'package:flutter/material.dart';

class AndroidTextField extends TextField {
  AndroidTextField({
    @required void Function(String) onChanged,
    String hintText,
    int maxLength,
    bool obscureText = false
  }) : super(
    autocorrect: false,
    maxLength: maxLength,
    obscureText: obscureText,
    onChanged: onChanged,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      hintText: hintText
    )
  );
}

class AndroidButton extends MaterialButton {
  AndroidButton({
    @required void Function() onPressed,
    @required String btnText
  }) : super(
    child: Text(btnText),
    onPressed: onPressed
  );
}

class AndroidSpacer extends SizedBox {
  const AndroidSpacer({
    double height = 7.5,
    double width = 5.0
  }) : super(
    height: height,
    width: width
  );
}

const spacer = AndroidSpacer();

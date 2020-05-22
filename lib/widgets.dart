import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum OptionType {
  TOGGLE,
  CHOOSE
}

class ToggleOption extends Option {
  bool _enabled = false;

  ToggleOption({
    String title,
    String description,
    void Function(bool) onTap,
    Key key
  }) : super(
    title: title,
    description: description,
    onTap: onTap,
    type: OptionType.TOGGLE,
    key: key
  );
}

class ChooseOption extends Option {
  ChooseOption({
    String title,
    String description,
    void Function() onTap,
    Key key
  }) : super(
    title: title,
    description: description,
    onTap: onTap,
    type: OptionType.CHOOSE,
    key: key
  );
}

abstract class Option extends StatefulWidget {
  final String title;
  final String description;
  final Function onTap;
  final OptionType type;

  Option({
    this.title,
    this.description,
    this.onTap,
    this.type,
    Key key
  }) : super(key: key);

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (super.widget.type) {
          case OptionType.TOGGLE: break;
          case OptionType.CHOOSE: break;
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Option Name',
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Option Description'
            )
          ]
        )
      )
    );
  }
}

class Separator extends StatelessWidget {
  final Color color;

  Separator({
    this.color = const Color(0xFF666666)
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.0,
      color: color
    );
  }
}

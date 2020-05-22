import 'package:flutter/widgets.dart';

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

import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Text(arg),
      ),
    );
  }
}

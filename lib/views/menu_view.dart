import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  final menuText;

  const MenuView({Key key, this.menuText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text(menuText),
          ),
          body: Center(child: Text("ini adalah menu $menuText")),
        ),
      ),
    );
  }
}
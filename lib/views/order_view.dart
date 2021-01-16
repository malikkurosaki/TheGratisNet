import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  final Map lsOrder;

  const OrderView({Key key, this.lsOrder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("lanjutan order"),
        ),
        body: ListView(
          children: [
            Text(lsOrder.toString())
          ],
        ),
      ),
    );
  }
}
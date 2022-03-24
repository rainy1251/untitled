import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDemo extends StatefulWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListDemoState();
  }
}

class _ListDemoState extends State<ListDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("list"),
        centerTitle: true,
      ),
    );
  }
}

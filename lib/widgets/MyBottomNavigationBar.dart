import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/ListViewDemo.dart';
import 'package:untitled/widgets/LoginPage.dart';
import 'package:untitled/widgets/SecondPage.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({Key? key}) : super(key: key);
  List<Widget> widgets = [
    SecondPage(),
    LoginPage(),
    ListViewDemo(),
    LoginPage()
  ];

  @override
  _myBottomNavigationState createState() => _myBottomNavigationState();
}

class _myBottomNavigationState extends State<MyBottomNavigationBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _index = 2;
                  });
                },
                icon: Icon(Icons.map_rounded)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _index = 3;
                  });
                },
                icon: Icon(Icons.home)),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
      //     BottomNavigationBarItem(icon: Icon(Icons.add), label: "我的"),
      //     BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: "首页"),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "我的"),
      //   ],
      //   onTap: (v) {
      //     setState(() {
      //       _index = v;

      //     });
      //   },
      // ),
      body: widget.widgets[_index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("object");
        },
        child: Icon(Icons.map_rounded),
      ),
    );
  }
}

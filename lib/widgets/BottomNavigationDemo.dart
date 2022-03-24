import 'package:flutter/material.dart';
import 'package:untitled/widgets/LoginPage.dart';
import 'package:untitled/widgets/SecondPage.dart';

class BottomNavigationDemo extends StatefulWidget {
  BottomNavigationDemo({Key? key}) : super(key: key);
  List<Widget> widgets = [SecondPage(), LoginPage(), SecondPage(), LoginPage()];

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("底部选项卡"),
      //   centerTitle: true,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("dianwol");
        },
        child: Icon(Icons.share),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                },
                icon: Icon(Icons.home)),
            SizedBox(),
            IconButton(
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                },
                icon: Icon(Icons.add)),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
      //       BottomNavigationBarItem(icon: Icon(Icons.add), label: "我的"),
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
      //       BottomNavigationBarItem(icon: Icon(Icons.add), label: "我的"),
      //     ],
      //     currentIndex: _index,
      //     onTap: (v) {
      //       setState(() {
      //         _index = v;
      //       });
      //     }),
      body: widget.widgets[_index],
    );
  }
}

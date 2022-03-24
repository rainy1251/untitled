import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<int> list = [];
  late ScrollController _scrollController;
  bool show = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    //show = false;
    _scrollController.addListener(() {
      if (_scrollController.offset >= 200 && show == false) {
        setState(() {
          show = true;
        });
      } else if (_scrollController.offset < 200 && show == true) {
        setState(() {
          show = false;
        });
      }
    });

    for (int i = 0; i < 100; i++) {
      list.add(i);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("list页面"),
          centerTitle: true,
        ),
        floatingActionButton: show
            ? FloatingActionButton(
                onPressed: () {
                  _scrollController.animateTo(0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                child: Icon(Icons.add),
              )
            : null,
        body: Scrollbar(
            // child: RefreshIndicator(
            //     onRefresh: _refresh,
            //     child: ListView(
            //         // reverse: true,
            //         // shrinkWrap: true,
            //         itemExtent: 30,
            //         children: list.map((e) => Text(e.toString())).toList())),
            child: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              if (index == 3) {
                return Icon(Icons.add);
              }

              return Text(list[index].toString());
            },
            itemCount: list.length,
            itemExtent: 20,
            controller: _scrollController,
          ),
        )));
  }
}

Future _refresh() async {
  await Future.delayed(Duration(seconds: 3), () {
    print("object");
  });
}

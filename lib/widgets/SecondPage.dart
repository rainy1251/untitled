import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);
  List<Widget> widgets = [FlutterView(), AndroidView(), IosView()];

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  List tabs = ["Flutter", "Android", "Ios"];
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("这是第二页"),
          centerTitle: true,
          // leading: IconButton(
          //     onPressed: () {
          //       print("点我了");
          //     },
          //     icon: Icon(Icons.home)),
          actions: [
            IconButton(
                onPressed: () {
                  print("add");
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  print("send");
                },
                icon: Icon(Icons.send))
          ],
          elevation: 0.0,
          bottom: TabBar(
              controller: _tabController,
              tabs: tabs
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList()),
        ),
        drawer: MyDrawer(),
        body: TabBarView(
          children: widget.widgets,
          controller: _tabController,
        ));
  }
}

class FlutterView extends StatelessWidget {
  const FlutterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Flutter"),
    );
  }
}

class AndroidView extends StatelessWidget {
  const AndroidView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Android"),
    );
  }
}

class IosView extends StatelessWidget {
  const IosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Ios"),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 62),
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.expand(width: double.infinity, height: 60),
                  child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text("昵称")),
                ),
              )
            ],
          )),
    );
  }
}

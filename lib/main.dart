import 'package:flutter/material.dart';
import 'package:untitled/widgets/BottomNavigationDemo.dart';
import 'package:untitled/widgets/LayoutWidget.dart';
import 'package:untitled/widgets/LoginPage.dart';
import 'package:untitled/widgets/MyBottomNavigationBar.dart';
import 'package:untitled/widgets/SecondPage.dart';
import 'package:untitled/widgets/demo_1.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
      ),
      routes: {
        "/": (context) => LoginPage(),
        "layout": (context) => LayoutWidget(),
        "second": (context) => SecondPage(),
        "navigation": (context) => BottomNavigationDemo(),
        "myNavigation": (context) => MyBottomNavigationBar(),
      },
      initialRoute: "myNavigation",
      onGenerateRoute: (RouteSettings s) {
        print(s);
        switch (s.name) {
          case "menu":
            return MaterialPageRoute(
                builder: (context) {
                  return MenuPage();
                },
                settings: s);
            break;
          default:
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Flutter"),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: const InputWidget(),
    );
  }
}

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$count"),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text("点击"),
        )
      ],
    );
  }
}

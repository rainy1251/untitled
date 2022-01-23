import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("menu",
              arguments: {"haha", "xixi"}).then((value) => print(value));

          // Navigator.of(context)
          //     .push(MaterialPageRoute(
          //       builder: (context) {
          //         return const MenuPage("c菜单111");
          //       },
          //       settings:
          //           const RouteSettings(name: "menu", arguments: 12345646),
          //       maintainState: false,
          //     ))
          //     .then((value) => print(value));
        },
        child: const Text("跳转"),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Object? arguments2 = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments2.toString()),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop({"name": "levi"});
        },
        child: Text("返回"),
      ),
    );
  }
}

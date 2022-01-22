import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: const Text(
        "这是一个文本",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.green,
          fontSize: 16,
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {}, child: const Text("升降按钮")),
        TextButton(onPressed: () {}, child: const Text("扁平按钮")),
        BackButton(
          onPressed: () {},
          color: Colors.red,
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text("button"),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.add, color: Colors.blue)),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: Icon(Icons.add, color: Colors.red),
        )
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.add),
        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        Container(
          width: double.infinity,
          height: 100,
          child: Image.network(
              "https://iconfont.alicdn.com/t/1a94da21-5958-4f89-9959-8071807a8db3.png",
              fit: BoxFit.fill),
        ),
        Image.asset("images/pangxie.png"),
        CupertinoButton(
            child: Text("data"), color: Colors.blue, onPressed: () {})
      ],
    );
  }
}

class CheckWidget extends StatefulWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  _CheckWidgetState createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
  bool _checkValue = false;
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Checkbox(
            value: _checkValue,
            onChanged: (v) {
              setState(() {
                _checkValue = v!;
              });
            }),
        Switch(
            value: _switchValue,
            onChanged: (v) {
              setState(() {
                _switchValue = v;
              });
            })
      ],
    );
  }
}

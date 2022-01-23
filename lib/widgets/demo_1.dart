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

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 16,
        ),
        LinearProgressIndicator(
            value: .5, valueColor: AlwaysStoppedAnimation(Colors.green)),
        SizedBox(height: 16),
        CircularProgressIndicator(),
        SizedBox(height: 16),
        CupertinoActivityIndicator()
      ],
    );
  }
}

class ClickWidget extends StatelessWidget {
  const ClickWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("onTap");
      },
      onDoubleTap: () {
        print("onDouble");
      },
      onLongPress: () {
        print("onLongTap");
      },
      child: const Text("点击"),
    );
  }
}

class InputWidget extends StatefulWidget {
  const InputWidget({Key? key}) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final GlobalKey _keyState = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final FocusNode _userFocus = FocusNode();
  final FocusNode _pwdFocus = FocusNode();
  late final FocusScopeNode _scopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _pwd.dispose();
    _pwdFocus.dispose();
    _userFocus.dispose();
    _scopeNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.always,
        key: _keyState,
        child: Column(
          children: [
            TextFormField(
              focusNode: _userFocus,
              controller: _controller,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.add),
                labelText: "用户名",
                hintText: ("请输入用户名"),
              ),
              validator: (v) {
                if (v == null || v.isEmpty) {
                  print("请输入正确的用户名");
                }
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (v) {},
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _pwd,
              maxLength: 8,
              maxLines: 1,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: "密码",
                  hintText: "请输入密码"),
              obscureText: true,
              textInputAction: TextInputAction.send,
              validator: (v) {
                if (v == null || v.isEmpty || v.length < 5) {
                  return "密码不能为空且大于5";
                }
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  _scopeNode = FocusScope.of(context);
                  _scopeNode.requestFocus(_userFocus);
                  // _scopeNode.unfocus();
                  if ((_keyState.currentState as FormState).validate()) {
                    print("success");
                  } else {
                    print("false");
                  }
                },
                child: Text("提交")),
          ],
        ));
  }
}

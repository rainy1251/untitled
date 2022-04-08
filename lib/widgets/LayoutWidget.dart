import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("布局练习"),
          centerTitle: true,
        ),
        body: Container(
          child: const ConstrainedBoxWidget(),
          // child: Flex(
          //   direction: Axis.vertical,
          //   children: [
          //     Expanded(
          //       child: Container(
          //         width: 100,
          //         height: 100,
          //         color: Colors.red,
          //       ),
          //       flex: 1,
          //     ),
          //     Expanded(
          //       child: Container(
          //         width: 100,
          //         height: 50,
          //         color: Colors.green,
          //       ),
          //       flex: 2,
          //     ),
          //     Expanded(
          //       child: Container(
          //         width: 100,
          //         height: 100,
          //         color: Colors.yellow,
          //       ),
          //       flex: 3,
          //     )
          //   ],
          // )

          // Container(
          //     child: Row(
          //   mainAxisSize: MainAxisSize.max,
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Container(
          //           width: 100,
          //           height: 100,
          //           color: Colors.red,
          //         ),
          //         Container(
          //           width: 100,
          //           height: 50,
          //           color: Colors.green,
          //         ),
          //         Container(
          //           width: 100,
          //           height: 100,
          //           color: Colors.yellow,
          //         )
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Container(
          //           width: 100,
          //           height: 80,
          //           color: Colors.yellow,
          //         ),
          //         Container(
          //           width: 100,
          //           height: 100,
          //           color: Colors.red,
          //         ),
          //         Container(
          //           width: 100,
          //           height: 100,
          //           color: Colors.green,
          //         )
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Container(
          //           width: 100,
          //           height: 100,
          //           color: Colors.green,
          //         ),
          //         Container(
          //           width: 100,
          //           height: 100,
          //           color: Colors.yellow,
          //         ),
          //         Container(
          //           width: 100,
          //           height: 100,
          //           color: Colors.red,
          //         )
          //       ],
          //     )
          //   ],
          // )),
        ));
  }
}

class WrapWidget extends StatefulWidget {
  const WrapWidget({Key? key}) : super(key: key);

  @override
  _WrapWidgetState createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  final List<int> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 16; i++) {
      _list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 1,
      runSpacing: 1,
      children: _list
          .map(
            (e) => Container(
              child: Text(
                e.toString(),
                textAlign: TextAlign.center,
              ),
              height: 100,
              width: 90,
              color: Colors.blue,
            ),
          )
          .toList(),
    );
  }
}

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        fit: StackFit.loose,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
          Container(
            height: 100,
            width: 50,
            color: Colors.green,
          ),
          Positioned(
              width: 100,
              child: Container(
                color: Colors.yellow,
                height: 50,
                width: 50,
              ))
        ],
      ),
    );
  }
}

class AlignWidget extends StatelessWidget {
  const AlignWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: const EdgeInsetsDirectional.all(10),
      margin: const EdgeInsetsDirectional.only(start: 10),
      padding: EdgeInsetsDirectional.all(20),
      width: 100,
      height: 100,
      color: Colors.green,
      child: const Align(
        alignment: Alignment.topCenter,
        child: FlutterLogo(
          size: 36,
          textColor: Colors.red,
        ),
      ),
    );
  }
}

class ConstrainedBoxWidget extends StatelessWidget {
  const ConstrainedBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 100, minWidth: 0),
          child: Container(
            width: 120,
            height: 80,
            color: Colors.red,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 1,
          child: Container(
            color: Colors.black,
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.all(20),
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 2.0)
                ]),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 100, top: 20, end: 100, bottom: 20),
              child: Text("登录"),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app_ios/src/tab_bar/tab_inherited.dart';

class MyOldWidget extends StatefulWidget {
  const MyOldWidget({Key? key}) : super(key: key);

  @override
  State<MyOldWidget> createState() => _MyOldWidgetState();
}

class _MyOldWidgetState extends State<MyOldWidget> {
  @override
  Widget build(BuildContext context) {
    return TabInheritad(
      color: Colors.red,
      child: Builder(builder: (icontext) {
        return Scaffold(
          appBar: AppBar(backgroundColor: TabInheritad.of(icontext).color),
        );
      }),
    );
  }
}

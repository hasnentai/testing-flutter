import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTabBarView extends StatefulWidget {
  const MyTabBarView({Key? key}) : super(key: key);

  @override
  State<MyTabBarView> createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> {
  final StreamController _controller = StreamController<String>();

  // min in second;
  final int fiveMIN = 300;
  int count = 300;
  String tmieVal = "";
  Color bgColor = Colors.white;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    tmieVal = calculateTimeFromSec();
    detactAppLifeCycle();
  }

  void detactAppLifeCycle() {
    SystemChannels.lifecycle.setMessageHandler((message) async {
      switch (message) {
        case "AppLifecycleState.paused":
          timer.cancel();
          break;
        case "AppLifecycleState.resumed":
          startTimer();
          break;
        default:
          break;
      }
      return null;
    });
  }

  String calculateTimeFromSec() {
    double m = (count % 3600 / 60);
    double s = (count % 3600 % 60);
    if (m < 1) {
      bgColor = Colors.red[200]!;
    }

    return "${m.floor() < 10 ? "0${m.floor()}" : m.floor()}:${s.floor() < 10 ? "0${s.floor()}" : s.floor()}";
  }

  void startTimer() {
    timer = createTimerObject();
  }

  Timer createTimerObject() {
    return Timer.periodic(const Duration(seconds: 1), (timer) {
      count--;

      _controller.sink.add(calculateTimeFromSec());

      if (count <= 0) {
        timer.cancel();
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("Timer Over"),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            timerStreamBuilder(),
            timerStartButton(),
          ],
        ));
  }

  Center timerStartButton() {
    return Center(
      child: SizedBox(
        child: OutlinedButton(
          onPressed: startTimer,
          child: const Text("Start Timer"),
        ),
      ),
    );
  }

  StreamBuilder<dynamic> timerStreamBuilder() {
    return StreamBuilder(
        initialData: tmieVal,
        stream: _controller.stream,
        builder: ((context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: timerBoxDecoraction(snapshot, context),
          );
        }));
  }

  Container timerBoxDecoraction(
      AsyncSnapshot<Object?> snapshot, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(10)),
      child: renderTimer(snapshot, context),
    );
  }

  Padding renderTimer(AsyncSnapshot<Object?> snapshot, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        snapshot.data.toString(),
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

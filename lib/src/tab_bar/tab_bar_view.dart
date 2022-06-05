import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_ios/src/app_state/counter_state.dart';
import 'package:weather_app_ios/src/service/albums_service.dart';
import 'package:weather_app_ios/src/tab_bar/accessInheridtedWidget.dart';
import 'package:weather_app_ios/src/tab_bar/tab_inherited.dart';

class MyTabBarView extends StatefulWidget {
  const MyTabBarView({Key? key}) : super(key: key);

  @override
  State<MyTabBarView> createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AlbumsRepo().getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TabInheritad(
            color: Colors.green,
            child: Builder(builder: (innercontext) {
              return Column(
                children: [
                  Text(
                    context.watch<Counter>().getCount.toString(),
                    style:
                        TextStyle(color: TabInheritad.of(innercontext).color),
                  ),
                  OutlinedButton(
                    onPressed: () => {
                      Navigator.push(
                        innercontext,
                        MaterialPageRoute(
                          builder: ((innercontext) => const MyOldWidget()),
                        ),
                      ),
                    },
                    child: const Text("Decrement"),
                  )
                ],
              );
            }),
          ),
          OutlinedButton(
            onPressed: () => {
              context.read<Counter>().setCountIncrement(),
            },
            child: const Text("Increment"),
          ),
          const SizedBox(height: 20.0),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TabInheritad extends InheritedWidget {
  final Color? color;
  const TabInheritad(
      {Key? key, required Widget child, required Color this.color})
      : super(key: key, child: child);

  static TabInheritad of(BuildContext context) {
    final TabInheritad? result =
        context.dependOnInheritedWidgetOfExactType<TabInheritad>();
    assert(result != null, 'No TabInheritad Found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TabInheritad oldWidget) => color != oldWidget.color;
}

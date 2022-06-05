// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_ios/src/app.dart';
import 'package:weather_app_ios/src/settings/settings_controller.dart';
import 'package:weather_app_ios/src/settings/settings_service.dart';

void main() {
  group('MyWidget', () {
    testWidgets('should display a intial value of text',
        (WidgetTester tester) async {
      // Define a Widget
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(MyApp(settingsController: settingsController));

      var findCounterText = find.text("0");
      expect(findCounterText, findsOneWidget);

      OutlinedButton incrementButton = find
          .widgetWithText(OutlinedButton, "Increment")
          .evaluate()
          .first
          .widget as OutlinedButton;
      incrementButton.onPressed!.call();
      await tester.pumpAndSettle();
      findCounterText = find.text("1");
      expect(findCounterText, findsOneWidget);

      OutlinedButton decrementButton = find
          .widgetWithText(OutlinedButton, "Decrement")
          .evaluate()
          .first
          .widget as OutlinedButton;

      decrementButton.onPressed!.call();
      await tester.pumpAndSettle();
      findCounterText = find.text("0");
      expect(findCounterText, findsOneWidget);

      print(decrementButton);
    });
  });
}

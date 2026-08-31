// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:loopion_ui/app/app.dart';

void main() {
  testWidgets('Home screen shows the LoopIon landing page', (WidgetTester tester) async {
    await tester.pumpWidget(const LoopionApp());
    await tester.pumpAndSettle();

    expect(find.text('LoopIon'), findsWidgets);
  });
}

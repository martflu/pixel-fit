import 'package:flutter_test/flutter_test.dart';

import 'package:pixel_fit/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Test'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';

import 'package:pixel_fit/main.dart';

void main() {
  testWidgets('Test text should be present', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Test'), findsOneWidget);
  });
}

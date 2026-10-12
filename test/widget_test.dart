import 'package:flutter_test/flutter_test.dart';
import 'package:senteboda/main.dart';

void main() {
  testWidgets('Sente Boda app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SenteBodaApp());
    expect(find.text('Sente Boda'), findsOneWidget);
  });
}

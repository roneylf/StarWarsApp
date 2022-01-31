import 'package:flutter_test/flutter_test.dart';

main() {
  group('WebviewPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      // await tester.pumpWidget(buildTestableWidget(WebviewPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}

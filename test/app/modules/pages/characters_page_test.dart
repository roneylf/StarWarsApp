import 'package:flutter_test/flutter_test.dart';

main() {
  group('CharactersPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      // await tester.pumpWidget((CharactersPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}

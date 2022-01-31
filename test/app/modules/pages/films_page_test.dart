import 'package:star_wars/app/modules/pages/films_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('FilmsPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget((FilmsPage(
        title: 'T',
        films: const [],
      )));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}

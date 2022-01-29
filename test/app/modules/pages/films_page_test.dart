import 'package:star_wars/app/modules/pages/films_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

main() {
  group('FilmsPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget((FilmsPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}

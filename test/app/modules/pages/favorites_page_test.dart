import 'package:star_wars/app/modules/pages/favorites_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('FavoritesPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget((FavoritesPage(
        title: 'T',
        favorites: const [],
      )));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}

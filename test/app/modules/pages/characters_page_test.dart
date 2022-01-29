import 'package:star_wars/app/modules/pages/characters_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

main() {
  group('CharactersPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget((CharactersPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}

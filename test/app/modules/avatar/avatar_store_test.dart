import 'package:flutter_test/flutter_test.dart';
import 'package:star_wars/app//modules/avatar/avatar_store.dart';

void main() {
  late AvatarStore store;

  setUpAll(() {
    store = AvatarStore();
  });

  test('increment count', () async {
    expect(store.loading, equals(false));
    store.loading = true;
    expect(store.loading, equals(true));
  });
}

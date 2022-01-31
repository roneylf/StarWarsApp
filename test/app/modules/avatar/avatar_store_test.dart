import 'package:flutter_test/flutter_test.dart';
import 'package:star_wars/app//modules/avatar/avatar_store.dart';
 
void main() {
  late AvatarStore store;

  setUpAll(() {
    store = AvatarStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
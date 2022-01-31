import 'package:mobx/mobx.dart';

part 'avatar_store.g.dart';

class AvatarStore = _AvatarStoreBase with _$AvatarStore;

abstract class _AvatarStoreBase with Store {
  @observable
  bool loading = false;
}

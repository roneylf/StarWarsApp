import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  Pages selectPage = Pages.Films;
}

enum Pages { Films, Characters, Favorites, WebView, Avatar }

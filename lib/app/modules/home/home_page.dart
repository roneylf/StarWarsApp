import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/avatar/avatar_page.dart';
import 'package:star_wars/app/modules/components/navbar.dart';
import 'package:star_wars/app/modules/components/topPanel.dart';
import 'package:star_wars/app/modules/home/home_controller.dart';
import 'package:star_wars/app/modules/home/home_store.dart';
import 'package:star_wars/app/modules/pages/characters_page.dart';
import 'package:star_wars/app/modules/pages/favorites_page.dart';
import 'package:star_wars/app/modules/pages/films_page.dart';
import 'package:star_wars/app/modules/webview/webview_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final home_controller = Modular.get<HomeController>();

  @override
  void initState() {
    home_controller.getAllCharacters();
    home_controller.getAllFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Flex(
      direction: Axis.vertical,
      children: [
        TopPanel(
          store: store,
        ),
        Observer(builder: (_) {
          if (store.selectPage == Pages.WebView ||
              store.selectPage == Pages.Avatar) {
            return Container();
          }
          return NavBar(
            store: store,
          );
        }),
        Expanded(child: Observer(builder: (_) {
          if (store.selectPage == Pages.Characters) {
            return CharactersPage(
              characters: store.characters,
            );
          }
          if (store.selectPage == Pages.Films) {
            return FilmsPage(
              films: store.films,
              title: '',
            );
          }
          if (store.selectPage == Pages.Favorites) {
            return FavoritesPage(
              favorites: store.favorites,
            );
          }
          if (store.selectPage == Pages.WebView) {
            return WebviewPage();
          }
          if (store.selectPage == Pages.Avatar) {
            return AvatarPage();
          }
          return Container();
        }))
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:star_wars/app/modules/home/home_store.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.store}) : super(key: key);

  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: MaterialButton(
          child: Text('Filmes'),
          onPressed: () {
            store.selectPage = Pages.Films;
          },
        ),
      ),
      Expanded(
        child: MaterialButton(
          child: Text('Personagens'),
          onPressed: () {
            store.selectPage = Pages.Characters;
          },
        ),
      ),
      Expanded(
        child: MaterialButton(
          child: Text('Favoritos'),
          onPressed: () {
            store.selectPage = Pages.Favorites;
          },
        ),
      ),
    ]);
  }
}

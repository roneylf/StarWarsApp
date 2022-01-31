import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/components/custom_list_item.dart';
import 'package:star_wars/app/modules/home/home_controller.dart';

import '../models/film.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  FavoritesPage(
      {Key? key, this.title = 'FavoritesPage', required this.favorites})
      : super(key: key);

  final List favorites;
  HomeController controller = Modular.get<HomeController>();

  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.favorites.length,
        itemBuilder: (context, index) {
          return CustomListItem(
            height: 80,
            item: widget.favorites[index],
            onTap: () {
              widget.favorites[index] is Film
                  ? widget.controller.setFavoriteFilms(widget.favorites[index])
                  : widget.controller
                      .setfavoriteCharacters(widget.favorites[index]);
            },
          );
        });
  }
}

import 'package:flutter/material.dart';

import '../models/film.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  const FavoritesPage(
      {Key? key, this.title = 'FavoritesPage', required this.favorites})
      : super(key: key);

  final List favorites;
  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.favorites[index] is Film
                ? widget.favorites[index].title
                : widget.favorites[index].name),
            subtitle: Text(
                widget.favorites[index].favorite ? 'Favorite' : 'Não Favorito'),
          );
        });
  }
}

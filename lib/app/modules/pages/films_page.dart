import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/home/home_controller.dart';

import 'package:star_wars/app/modules/models/film.dart';

class FilmsPage extends StatefulWidget {
  final String title;
  FilmsPage({
    Key? key,
    required this.title,
    required this.films,
  }) : super(key: key);

  final List<Film> films;
  HomeController controller = Modular.get<HomeController>();
  @override
  FilmsPageState createState() => FilmsPageState();
}

class FilmsPageState extends State<FilmsPage> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
          itemBuilder: (BuildContext context, int cont) {
            return GestureDetector(
              onTap: () {
                //print(widget.films[cont].id);
                widget.controller.setFavoriteFilms(widget.films[cont]);
              },
              child: ListTile(
                title: Text(widget.films[cont].title),
                subtitle: Text(
                    widget.films[cont].favorite ? 'Favorito' : 'Não Favorito'),
              ),
            );
          },
          itemCount: widget.films.length);
    });
  }
}

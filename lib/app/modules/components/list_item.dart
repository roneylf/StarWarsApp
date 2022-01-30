import 'package:flutter/material.dart';
import 'package:star_wars/app/modules/models/character.dart';
import 'package:star_wars/app/modules/models/film.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, this.film, this.character}) : super(key: key);

  final Film? film;
  final Character? character;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

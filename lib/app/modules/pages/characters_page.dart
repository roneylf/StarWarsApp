import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/home/home_controller.dart';
import 'package:star_wars/app/modules/models/character.dart';

class CharactersPage extends StatefulWidget {
  final String title;
  CharactersPage(
      {Key? key, this.title = 'CharactersPage', required this.characters})
      : super(key: key);

  final List<Character> characters;
  HomeController controller = Modular.get<HomeController>();

  @override
  CharactersPageState createState() => CharactersPageState();
}

class CharactersPageState extends State<CharactersPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: widget.characters.length,
          itemBuilder: (BuildContext context, int index) {
            return Observer(builder: (_) {
              return GestureDetector(
                onTap: () {
                  widget.controller
                      .setfavoriteCharacters(widget.characters[index]);
                },
                child: ListTile(
                  title: Text(widget.characters[index].name),
                  subtitle: Text(widget.characters[index].favorite
                      ? 'Favorite'
                      : 'Not Favorite'),
                ),
              );
            });
          }),
    );
  }
}

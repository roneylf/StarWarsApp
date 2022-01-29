import 'package:flutter/material.dart';

class CharactersPage extends StatefulWidget {
  final String title;
  const CharactersPage({Key? key, this.title = 'CharactersPage'})
      : super(key: key);
  @override
  CharactersPageState createState() => CharactersPageState();
}

class CharactersPageState extends State<CharactersPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('CharactersPage'),
      ),
    );
  }
}

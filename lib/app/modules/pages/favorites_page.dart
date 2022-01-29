import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  const FavoritesPage({Key? key, this.title = 'FavoritesPage'})
      : super(key: key);
  @override
  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('FavoritesPage'),
      ),
    );
  }
}

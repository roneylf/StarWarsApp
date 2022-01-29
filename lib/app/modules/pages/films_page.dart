import 'package:flutter/material.dart';

class FilmsPage extends StatefulWidget {
  final String title;
  const FilmsPage({Key? key, this.title = 'FilmsPage'}) : super(key: key);
  @override
  FilmsPageState createState() => FilmsPageState();
}

class FilmsPageState extends State<FilmsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('FilmsPage'),
      ),
    );
  }
}

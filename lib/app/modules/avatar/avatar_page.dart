import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget {
  final String title;
  const AvatarPage({Key? key, this.title = 'AvatarPage'}) : super(key: key);
  @override
  AvatarPageState createState() => AvatarPageState();
}
class AvatarPageState extends State<AvatarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
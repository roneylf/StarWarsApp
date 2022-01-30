import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

class AvatarPage extends StatefulWidget {
  final String title;
  const AvatarPage({Key? key, this.title = 'AvatarPage'}) : super(key: key);
  @override
  AvatarPageState createState() => AvatarPageState();
}

class AvatarPageState extends State<AvatarPage> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        FluttermojiCircleAvatar(),
        FluttermojiCustomizer(),
      ],
    );
  }
}

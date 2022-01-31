import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:star_wars/app/modules/avatar/avatar_controller.dart';

class AvatarPage extends StatefulWidget {
  final String title;
  const AvatarPage({Key? key, this.title = 'AvatarPage'}) : super(key: key);
  @override
  AvatarPageState createState() => AvatarPageState();
}

class AvatarPageState extends ModularState<AvatarPage, AvatarController> {
  @override
  void initState() {
    store.setAvatar();
    super.initState();
  }

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

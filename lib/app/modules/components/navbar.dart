// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:star_wars/app/modules/home/home_store.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key, required this.store}) : super(key: key);

  final HomeStore store;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double _getPosition(BoxConstraints size, int pos) {
      return (size.maxWidth / 3) * pos;
    }

    return LayoutBuilder(builder: (context, size) {
      return Stack(children: [
        Observer(builder: (_) {
          return AnimatedPositioned(
            child: Container(
              height: size.maxHeight,
              width: size.maxWidth / 3,
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            duration: const Duration(milliseconds: 400),
            curve: Curves.bounceOut,
            top: 0,
            left: _getPosition(size, widget.store.posAnimatedPosictioned),
            height: size.maxHeight,
            width: size.maxWidth / 3,
            onEnd: () {
              widget.store.finishSelectPage();
            },
          );
        }),
        Row(children: [
          NavBarItem(
              size: size,
              onPressed: () {
                widget.store.setSelectPage(page: Pages.Films, finish: false);
              },
              text: "Filmes"),
          NavBarItem(
              size: size,
              onPressed: () {
                widget.store
                    .setSelectPage(page: Pages.Characters, finish: false);
              },
              text: "Personagens"),
          NavBarItem(
            size: size,
            text: 'Favoritos',
            onPressed: () {
              widget.store.setSelectPage(page: Pages.Favorites, finish: false);
            },
          ),
        ]),
      ]);
    });
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem(
      {Key? key,
      required this.size,
      required this.onPressed,
      required this.text})
      : super(key: key);

  final BoxConstraints size;
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: size.maxWidth / 3,
      height: size.maxHeight,
      child: Text(text),
      onPressed: onPressed,
    );
  }
}

import 'package:flutter/material.dart';

import 'package:star_wars/app/modules/models/film.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.height,
    required this.item,
    this.onTap,
    this.showBorder = true,
  }) : super(key: key);

  final double height;
  final dynamic item;
  final void Function()? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    Color _getBorderColor() {
      //return Colors.transparent;
      if (showBorder) {
        if (item.favorite) {
          if (item is Film) {
            return Colors.red;
          } else {
            return Colors.green;
          }
        } else {
          return Colors.grey;
        }
      } else {
        return Colors.transparent;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 51, 51, 51),
          boxShadow: [
            BoxShadow(
              color: _getBorderColor(),
              blurRadius: 3,
              offset: const Offset(-1, 2),
            ),
          ],
        ),
        child: Flex(
          mainAxisSize: MainAxisSize.max,
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child:
                    Center(child: Text(item is Film ? item.title : item.name))),
            Flexible(
              fit: FlexFit.tight,
              child: IconButton(
                iconSize: height * 0.75,
                onPressed: onTap,
                color: item.favorite ? Colors.yellow : Colors.white10,
                icon: const Icon(
                  Icons.star_border_rounded,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:star_wars/app/modules/models/film.dart';

class CUstomListItem extends StatelessWidget {
  const CUstomListItem({
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
          color: Colors.white10,
          boxShadow: [
            BoxShadow(
              color: _getBorderColor(),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Text(item is Film ? item.title : item.name),
            IconButton(
              onPressed: onTap,
              color: item.favorite ? Colors.yellow : Colors.white10,
              icon: Icon(
                Icons.star_border_rounded,
              ),
            )
          ],
        ),
      ),
    );
  }
}

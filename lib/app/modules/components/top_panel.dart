import 'package:flutter/material.dart';
import 'package:star_wars/app/modules/components/parallelogram_form.dart';
import 'package:star_wars/app/modules/home/home_store.dart';
import 'package:fluttermoji/fluttermoji.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({Key? key, required this.store}) : super(key: key);

  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipPath(
                  clipper: ParallelogramClipper(),
                  child: MaterialButton(
                    color: Colors.green[700],
                    onPressed: () {
                      store.selectPage = Pages.WebView;
                    },
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Site Oficial'),
                    )),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    store.selectPage = Pages.Avatar;
                  },
                  child: FluttermojiCircleAvatar()),
            )
          ],
        ),
      ),
    );
  }
}

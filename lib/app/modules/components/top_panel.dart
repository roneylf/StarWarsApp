import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/avatar/avatar_controller.dart';
import 'package:star_wars/app/modules/components/parallelogram_form.dart';
import 'package:star_wars/app/modules/home/home_store.dart';
import 'package:fluttermoji/fluttermoji.dart';

class TopPanel extends StatefulWidget {
  TopPanel({Key? key, required this.store}) : super(key: key);

  final HomeStore store;

  @override
  State<TopPanel> createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
  final AvatarController _avatarController = Modular.get<AvatarController>();

  @override
  void initState() {
    _avatarController.getAvatar();
    super.initState();
  }

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
                  child: Observer(builder: (_) {
                    return MaterialButton(
                      color: widget.store.selectPage != Pages.WebView
                          ? Colors.redAccent
                          : const Color.fromARGB(36, 255, 255, 255),
                      onPressed: () {
                        if (widget.store.selectPage == Pages.WebView) {
                          widget.store.setSelectPage(page: Pages.Films);
                        } else {
                          widget.store.setSelectPage(page: Pages.WebView);
                        }
                      },
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Site Oficial'),
                      )),
                    );
                  }),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(onTap: () {
                if (widget.store.selectPage == Pages.Avatar) {
                  widget.store.setSelectPage(page: Pages.Films);
                } else {
                  widget.store.setSelectPage(page: Pages.Avatar);
                }
              }, child: Observer(builder: (_) {
                if (_avatarController.avatarStore.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return FluttermojiCircleAvatar(
                  backgroundColor: widget.store.selectPage != Pages.Avatar
                      ? Colors.redAccent
                      : const Color.fromARGB(36, 255, 255, 255),
                );
              })),
            )
          ],
        ),
      ),
    );
  }
}

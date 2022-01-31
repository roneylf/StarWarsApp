import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/avatar/avatar_store.dart';
import 'package:star_wars/app/modules/db/db_controller.dart';

class AvatarController {
  final FluttermojiFunctions _fluttermojiFunctions = FluttermojiFunctions();

  final _db = Modular.get<DbController>();
  final avatarStore = Modular.get<AvatarStore>();

  void setAvatar() {
    final _fluttermojiController = Get.find<FluttermojiController>();

    _fluttermojiController.addListener(() {
      // ignore: unused_local_variable
      _fluttermojiFunctions.encodeMySVGtoString().then((value) {
        _fluttermojiFunctions.decodeFluttermojifromString(value);
        _db.saveAvatar(value);
      });
    });
  }

  Future<void> getAvatar() async {
    avatarStore.loading = true;
    _db.getAvatar().then((value) {
      if (value != null) {
        _fluttermojiFunctions.decodeFluttermojifromString(value as String);
      }
    });
    avatarStore.loading = false;
    return;
  }
}

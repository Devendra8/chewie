import 'dart:developer';

import 'package:flutter/material.dart';

///
/// The new State-Manager for Chewie!
/// Has to be an instance of Singleton to survive
/// over all State-Changes inside chewie
///
class PlayerNotifier extends ChangeNotifier {
  PlayerNotifier._(
    bool hideStuff,
  ) : _hideStuff = hideStuff;

  bool _hideStuff;
  bool _dispose = false;

  bool get hideStuff => _hideStuff;

  set hideStuff(bool value) {
    if (_dispose) {
      log("already disposeeddd");
    }
    _hideStuff = value;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    log("disposeeddd");
    _dispose = true;
    super.dispose();
  }

  // ignore: prefer_constructors_over_static_methods
  static PlayerNotifier init() {
    return PlayerNotifier._(
      true,
    );
  }
}

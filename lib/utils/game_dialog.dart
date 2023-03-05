import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:quickness_game/global.dart';

class GameDialog {
  static Function(Widget widget) showCustomDialog = (Widget widget) {
    showAnimatedDialog(
      barrierColor: const Color.fromARGB(80, 0, 0, 0),
      context: rootContext as BuildContext,
      builder: (BuildContext dialogContext) {
        return widget;
      },
      animationType: DialogTransitionType.slideFromBottom,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
    );
  };

  static Function(String content, Function? callback) openDialogAlert =
      (String content, Function? callback) {
    showCustomDialog(AlertDialog(
      content: Text(content),
    ));

    Timer(const Duration(seconds: 2), () {
      Navigator.of(rootContext as BuildContext).pop();

      if (callback != null) {
        callback();
      }
    });
  };
}

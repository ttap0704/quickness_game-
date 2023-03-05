import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickness_game/utils/game_dialog.dart';

class GameMain extends StatefulWidget {
  const GameMain({Key? key}) : super(key: key);

  @override
  State<GameMain> createState() => _GameMainState();
}

class _GameMainState extends State<GameMain>
    with SingleTickerProviderStateMixin {
  bool _start = false;
  int _level = 1;
  double _position = 0;
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      _controller = AnimationController(
        vsync: this, // the SingleTickerProviderStateMixin
        duration: Duration(seconds: 2),
      );
      Timer(const Duration(microseconds: 500), () {
        GameDialog.openDialogAlert('곧 게임이 시작됩니다.', () {
          setState(() {
            _start = true;
          });

          for (int i = 0; i < 100; i++) {
            setState(() {
              _position = _position + 1;
            });
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handleStop() {
    if (mounted && _start) {
      print('hi');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: handleStop,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Container(
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Positioned(
                    right: 100,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.black12,
                    ),
                  ),
                  AnimatedPositioned(
                    left: _start ? width - 140 : 0,
                    top: 0,
                    duration: Duration(milliseconds: 200),
                    onEnd: () {
                      print('hihi');
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_int_literals

import 'dart:math' as math;

import 'package:exchange/exchange/view/widgets/exchange_automatic_form.dart';
import 'package:exchange/exchange/view/widgets/exchange_form.dart';
import 'package:exchange/exchange/view/widgets/exchange_tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _rotateAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    // perspective = _kMatrix(1.0);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _rotateAnimation =
        Tween<double>(begin: 180.0, end: 0.0).animate(animationController);
    super.initState();
  }

  void _rotateAnimate() {
    animationController.reset();
    _rotateAnimation =
        Tween<double>(begin: 0.0, end: 180.0).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    animationController.forward();
  }

  static Matrix4 _matrix4(double value) => Matrix4(
        1.0,
        0.0,
        0.0,
        0.0,
        0.0,
        1.0,
        0.0,
        0.0,
        0.0,
        0.0,
        1.0,
        value * 0.001,
        0.0,
        0.0,
        0.0,
        1.0,
      );
  final Matrix4 _perpetive = _matrix4(1.0);
  bool isManualMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Cambio Bai')),
        backgroundColor: const Color.fromRGBO(27, 26, 28, 1),
        elevation: 0,
      ),
      backgroundColor: const Color.fromRGBO(27, 26, 28, 1),
      body: ListView(
        children: [
          //Page Header
          const SizedBox(
            height: 7,
          ),
          ExchangeTabs(
            onChanged: (value) {
              isManualMode = value == 0 ? true : false;
              _rotateAnimate();
            },
          ),
          //Form Manual
          Stack(
            children: [
              //Form Automatic
              Transform(
                transform: _perpetive.scaled(1.0, 1.0, 1.0)
                  ..rotateX(0)
                  ..rotateZ(0)
                  ..rotateY(
                    math.pi - _rotateAnimation.value * math.pi / 180,
                  ),
                alignment: FractionalOffset.center,
                child: Visibility(
                    visible: isManualMode ? false : true,
                    child: const ExchangeAutomaticForm(),),
              ),
              Transform(
                transform: _perpetive.scaled(1.0, 1.0, 1.0)
                  ..rotateX(0)
                  ..rotateZ(0)
                  ..rotateY(
                    math.pi - (_rotateAnimation.value) * math.pi / 180,
                  ),
                alignment: FractionalOffset.center,
                child: Visibility(
                  visible: isManualMode ? true : false,
                  child: const ExchangeForm(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

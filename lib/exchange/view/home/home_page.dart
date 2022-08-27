// ignore_for_file: prefer_int_literals

import 'dart:math' as math;

import 'package:exchange/exchange/view/widgets/exchange_automatic_form.dart';
import 'package:exchange/exchange/view/widgets/exchange_form.dart';
import 'package:exchange/exchange/view/widgets/exchange_tabs.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  //! Verify what's current Tab
  bool isManualMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          //?Form Manual
          Stack(
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(1, 1, 1.0) // perspective
                  ..rotateX(0)
                  ..rotateY(
                    math.pi - _rotateAnimation.value * math.pi / 180,
                  ),
                alignment: FractionalOffset.center,
                child: Visibility(
                  visible: isManualMode ? true : false,
                  child: const ExchangeForm(),
                ),
              ),
              //?Form Automatic
              AnimatedOpacity(
                opacity: isManualMode ? 0 : 1,
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(1, 1, 1.0) // perspective
                    ..rotateX(0)
                    ..rotateY(
                      math.pi - _rotateAnimation.value * math.pi / 180,
                    )
                    ..rotateZ(0),
                  alignment: FractionalOffset.center,
                  child: Visibility(
                    visible: isManualMode ? false : true,
                    child: const ExchangeAutomaticForm(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

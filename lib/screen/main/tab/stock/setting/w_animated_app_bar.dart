import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_arrow.dart';

class AnimatedAppBar extends StatefulWidget {
  final ScrollController controller;
  final String title;

  const AnimatedAppBar(this.title, {required this.controller, super.key});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  double scrollPosition = 0;
  final triggerHeight = 100;
  final duration = 250.ms;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        scrollPosition = widget.controller.position.pixels;
      });
    });
    super.initState();
  }

  bool get isScrollOnTop => scrollPosition < triggerHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(left: isScrollOnTop ? 20 : 60),
              height: isScrollOnTop ? 160 : 60,
              child: Row(
                children: [
                  AnimatedDefaultTextStyle(
                      style: TextStyle(fontSize: isScrollOnTop ? 30 : 18),
                      duration: duration,
                      child: widget.title.text.make())
                ],
              ),
            ),
            Tap(
              onTap: () {
                Nav.pop(context);
              },
              child: const Arrow(
                direction: AxisDirection.left,
              ).p(20),
            ),
          ],
        ),
      ),
    );
  }
}

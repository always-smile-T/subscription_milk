import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class FlipCadWidget extends StatefulWidget {
  final FlipCardController controller;
  final Widget front;
  final Widget back;
  const FlipCadWidget({Key? key, required this.controller, required this.front, required this.back}) : super(key: key);

  @override
  State<FlipCadWidget> createState() => _FlipCadWidgetState();
}

class _FlipCadWidgetState extends State<FlipCadWidget>
    with TickerProviderStateMixin{
  late AnimationController controller;
  bool isFont = true;

  @override
  void initState(){
    super.initState();

    controller = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 800));

    widget.controller._state = this;

  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  Future flipCard() async {
    // neu gia tri chua thay doi thi k the thc hien lan tiep theo
    if (controller.isAnimating) return;
    isFont = !isFont;

    if(isFont){
      await controller.reverse();
    }else{
      await controller.forward();
    }
  }
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: controller,
      builder: (context, child){
        final angle = controller.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angle);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: isFrontCard(angle.abs())
              ? widget.front
              : Transform(
            transform: Matrix4.identity()..rotateY(pi),
            alignment: Alignment.center,
            child: widget.back,
          ),
        );
      });

  bool isFrontCard(double angle){
    final degrees90 = pi / 2;
    final degrees270 = 3 * pi /2;
    return angle <= degrees90 || angle >= degrees270;
  }
}
class FlipCardController{
  _FlipCadWidgetState? _state;

  Future flipCard() async => _state?.flipCard();
}

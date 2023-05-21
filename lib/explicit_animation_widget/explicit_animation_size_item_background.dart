import 'package:flutter/material.dart';

import '../resources/dimens.dart';

const kAnimationDurationForBackground = Duration(milliseconds: 1000);

class ExplicitAnimationSizeItemBackground extends StatefulWidget {
  final String sizeItem;

  const ExplicitAnimationSizeItemBackground({
    super.key,
    required this.sizeItem,
  });

  @override
  State<ExplicitAnimationSizeItemBackground> createState() =>
      _ExplicitAnimationSizeItemBackgroundState();
}

class _ExplicitAnimationSizeItemBackgroundState
    extends State<ExplicitAnimationSizeItemBackground>
    with TickerProviderStateMixin {
  ///State
  bool isAnimationComplete = false;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    ///1
    _controller = AnimationController(
        duration: kAnimationDurationForBackground, vsync: this);

    ///2
    _colorAnimation = ColorTween(begin: Colors.grey[500], end: Color.fromRGBO(0, 0, 255, 1))
        .animate(_controller.view);

    _controller.addStatusListener((status) {
      isAnimationComplete = (status == AnimationStatus.completed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, _) => GestureDetector(
        onTap: (){
          if(isAnimationComplete)
          {
            _controller.reverse();
          }else{
            _controller.forward();
          }
        },
        child: Container(
          margin: const EdgeInsets.all(MARGIN_MEDIUM),
          width: 50,
          // height: 50,
          decoration: BoxDecoration(
            color: _colorAnimation.value,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM),
              child: Text(
                widget.sizeItem,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


const kAnimationDurationForFavourite = Duration(milliseconds: 1000);

class ExplicitAnimationFavouriteIconButton extends StatefulWidget {
  const ExplicitAnimationFavouriteIconButton({
    super.key,
  });

  @override
  State<ExplicitAnimationFavouriteIconButton> createState() => _ExplicitAnimationFavouriteIconButtonState();
}

class _ExplicitAnimationFavouriteIconButtonState
    extends State<ExplicitAnimationFavouriteIconButton>
    with TickerProviderStateMixin{

  ///State
  bool isAnimationComplete = false;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _360DegreeRotateAnimation;
  @override
  void initState() {
    super.initState();

    ///1
    _controller = AnimationController(
        duration: kAnimationDurationForFavourite,
        vsync: this);

    ///2
    _colorAnimation = ColorTween(begin: Colors.grey[500], end:  Colors.red)
        .animate(_controller.view);

    _360DegreeRotateAnimation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(
        parent: _controller.view,
        curve: Curves.linear,
      ),
    );
    _controller.addStatusListener((status) {
      isAnimationComplete = (status == AnimationStatus.completed);
    });
  }
  @override
  Widget build(BuildContext context) {

    ///3, 4, 5
    return AnimatedBuilder(
      animation: _controller.view,
      builder:(context,_)=>
          IconButton(
            iconSize: 32,
            onPressed:(){
              if(isAnimationComplete)
              {
                _controller.reverse();
              }else{
                _controller.forward();
              }
              // _controller.repeat();

            },
            icon:RotationTransition(
              turns: _360DegreeRotateAnimation,
              child: Icon(Icons.favorite,
                  size: 32,
                  color: _colorAnimation.value),
            ),),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

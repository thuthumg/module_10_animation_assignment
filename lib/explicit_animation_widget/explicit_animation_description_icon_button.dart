import 'package:flutter/material.dart';

import '../resources/dimens.dart';


const kAnimationDurationForDescription = Duration(milliseconds: 500);

class ExplicitAnimationDescriptionIconButton extends StatefulWidget {

  ExplicitAnimationDescriptionIconButton({
    super.key
  });

  @override
  State<ExplicitAnimationDescriptionIconButton> createState() => _ExplicitAnimationDescriptionIconButtonState();
}

class _ExplicitAnimationDescriptionIconButtonState
    extends State<ExplicitAnimationDescriptionIconButton>
    with TickerProviderStateMixin{

  ///State
  bool isAnimationComplete = false;

  late AnimationController _controller;

  late Animation<double> _180DegreeRotateAnimation;
  @override
  void initState() {
    super.initState();

    ///1
    _controller = AnimationController(
        duration: kAnimationDurationForDescription,
        vsync: this);

    ///2
    _180DegreeRotateAnimation = Tween<double>(begin: 0, end: 0.5).animate(
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Descriptions",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: TEXT_REGULAR_3X,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: (){
                          if(isAnimationComplete)
                          {
                            _controller.reverse();
                          }else{
                            _controller.forward();
                          }
                        },
                        icon: RotationTransition(
                            turns: _180DegreeRotateAnimation,
                            child: Icon(Icons.keyboard_arrow_up)))
                  ],
                ),
              ),
              AnimatedSize(
                duration: kAnimationDurationForDescription,
                child: Container(
                  height: isAnimationComplete ? 0.0 : null,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                        child: Text(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem lpsum is that it has a more-or-less normal.",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: TEXT_REGULAR_3X,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )

    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

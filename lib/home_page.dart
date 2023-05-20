import 'package:flutter/material.dart';
import 'package:module_10_animation_assignment/resources/strings.dart';

import 'resources/dimens.dart';
const kAnimationDuration = const Duration(milliseconds: 500);
const kAnimationDurationForScreenFadeIn = const Duration(milliseconds: 1000);

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChangeBackgroundColor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: kAnimationDurationForScreenFadeIn,
        color: (isChangeBackgroundColor) ? Colors.black : Colors.white,

        child: SingleChildScrollView(
          child: AnimatedContainer(
            duration: kAnimationDuration,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
                child: Column(
                  children: [
                    TweenAnimationBuilder(
                        duration: kAnimationDurationForScreenFadeIn,
                        tween: Tween<double>(begin: 0, end:  1),
                        builder: (context, double _value, child) => Opacity(
                          opacity: _value,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: _value * 25,
                              left: 10,
                            ),
                            child: child,
                          ),),
                        child: ProfileSection(isChangeBackgroundColor: isChangeBackgroundColor)),
                    TweenAnimationBuilder(
                        duration: kAnimationDurationForScreenFadeIn,
                        tween: Tween<double>(begin: 0, end: 1),
                        builder: (context ,double _value,child)=> Opacity(
                            opacity: _value,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left:_value*10
                          ),
                          child: child,
                        ),),
                        child: TrendingForYouSection(isChangeBackgroundColor: isChangeBackgroundColor)),
                    TweenAnimationBuilder(
                        duration: kAnimationDurationForScreenFadeIn,
                        tween: Tween<double>(begin: 0,end: 1),
                        builder: (context,double _value,child)=> Opacity(
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: _value * 10
                              ),
                              child: child,
                            ),
                            opacity: _value),
                        child: RecomendedSection(isChangeBackgroundColor: isChangeBackgroundColor)),
                    Image.asset("assets/images/bottom_menu_photo.png")

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RecomendedSection extends StatelessWidget {

  final bool isChangeBackgroundColor;

  const RecomendedSection({
    super.key,
    required this.isChangeBackgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                        color: (isChangeBackgroundColor) ? Colors.white : Colors.black,
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(
                        size: 10,
                        Icons.fiber_manual_record,
                        color: Colors.blue,
                      ),
                      Icon(
                        size: 10,
                        Icons.fiber_manual_record,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ],
              ),
              Image.asset("assets/images/recommended_photo.png")
            ],
          ),
        ),
      ],
    );
  }
}

class TrendingForYouSection extends StatelessWidget {

  final bool isChangeBackgroundColor;

  const TrendingForYouSection({
    super.key,
    required this.isChangeBackgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
          child: Column(
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TRENDING_FOR_YOU_TXT,
                    style: TextStyle(
                        color: (isChangeBackgroundColor) ? Colors.white :  Colors.black,
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(
                        size: 10,
                        Icons.fiber_manual_record,
                        color: Colors.blue,
                      ),
                      Icon(
                        size: 10,
                        Icons.fiber_manual_record,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ],
              ),
              Image.asset("assets/images/trending_photo.png")
            ],
          ),
        ),


      ],
    );
  }
}

class ProfileSection extends StatelessWidget {

  bool isChangeBackgroundColor;


  ProfileSection({
    super.key,
    required this.isChangeBackgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  // set the border stroke color here
                  width: 2.0,
                  // set the width of the border stroke here
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/pic_profile.jpg"),
                ),
              ),
            ),
            SizedBox(
              width: MARGIN_MEDIUM_2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Howdy",
                  style: TextStyle(
                      color: (isChangeBackgroundColor) ? Colors.white : Color.fromRGBO(85, 85, 85, 1),
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Cristina Yota",
                  style: TextStyle(
                      color: (isChangeBackgroundColor) ? Colors.white : Colors.black,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ],
        ),
        Stack(
          children: [
            GestureDetector(
              onTap: (){
                setState(){
                  isChangeBackgroundColor = !isChangeBackgroundColor;
                }

              },
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  size: 32,
                  Icons.notifications_none,
                  color: Colors.black38,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Icon(
                size: 10,
                Icons.fiber_manual_record,
                color: Colors.red,
              ),
            )
          ],
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_10_animation_assignment/explicit_animation_widget/explicit_animation_description_icon_button.dart';
import 'package:module_10_animation_assignment/explicit_animation_widget/explicit_animation_favourite_icon_button.dart';
import 'package:module_10_animation_assignment/explicit_animation_widget/explicit_animation_size_item_background.dart';


import 'resources/dimens.dart';


const kAnimationDuration = const Duration(milliseconds: 500);
const kAnimationDurationForScreenFadeIn = const Duration(milliseconds: 1000);
const kAnimationDurationForFavourite = Duration(milliseconds: 1000);

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late ScrollController scrollController;
  bool isDescriptionShown = true;
  List<String> sizeList = ["S", "M", "L", "XL", "XXL"];
  final double expandedHight = 150.0;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() => setState(() {}));
  }

  double get top {
    double res = expandedHight;
    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      if (offset < (res - kToolbarHeight)) {
        res -= offset;
      } else {
        res = kToolbarHeight;
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(

              title: Text(''),
              background: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/sample_photo2.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                   top: MARGIN_XLARGE,
                    left: MARGIN_LARGE,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,),
                    ),
                  ),
                  Positioned(
                    top: MARGIN_XLARGE,
                    right: MARGIN_LARGE,
                    child: Row(
                      children: [
                        ExplicitAnimationFavouriteIconButton(),
                        SizedBox(width: MARGIN_MEDIUM,),
                        Icon(Icons.share,color: Colors.white,)
                      ],
                    ),
                  )
                ],
              ),

            ),
          ),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "OUTFIT IDEAS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: TEXT_REGULAR_3X,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Center(
                        child: Text(
                          "Modern Blue Jacket",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: TEXT_HEADING_1X,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Center(
                        child: Text(
                          "\$19,39",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 255, 1),
                              fontSize: TEXT_REGULAR_3X,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_LARGE,
                      ),
                     ExplicitAnimationDescriptionIconButton(),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Size your size",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: TEXT_REGULAR_3X,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Size Guide",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 255, 1),
                                  fontSize: TEXT_REGULAR_2X,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                        child: Container(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: sizeList.length,
                            // Number of items in the list
                            itemBuilder: (BuildContext context, int index) {
                              return ExplicitAnimationSizeItemBackground(sizeItem: sizeList.elementAt(index));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_10_animation_assignment/resources/colors.dart';

import 'resources/dimens.dart';

class DetailPage extends StatefulWidget {
  
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  List<String> sizeList = ["S","M","L","XL","XXL"];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 300,
                    color: Colors.blue,
                  ),),
              Positioned(
                top: 250,
                right: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: MARGIN_LARGE),
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
                        SizedBox(height: MARGIN_MEDIUM_2,),
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
                        SizedBox(height: MARGIN_MEDIUM_2,),
                        Center(
                          child: Text(
                            "19,39",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: TEXT_REGULAR_3X,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: MARGIN_LARGE,),
                        Padding(
                          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2,
                          right: MARGIN_MEDIUM_2),
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
                              Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey,)
                            ],
                          ),
                        ),
                        SizedBox(height: MARGIN_MEDIUM_2,),
                        Padding(
                          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2,
                              right: MARGIN_MEDIUM_2),
                          child: Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem lpsum is that it has a more-or-less normal.",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: TEXT_REGULAR_3X,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: MARGIN_MEDIUM_2,),
                        Padding(
                          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2,
                              right: MARGIN_MEDIUM_2),
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
                                    color: Colors.blue,
                                    fontSize: TEXT_REGULAR_2X,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MARGIN_MEDIUM_2,),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: sizeList.length, // Number of items in the list
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.all(MARGIN_MEDIUM),
                                width: 50,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(MARGIN_MEDIUM),
                                  child: Text(
                                    sizeList.elementAt(index),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: TEXT_REGULAR_2X,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /*CustomScrollView(
       slivers: [
         SliverAppBar(
           pinned: true,
           expandedHeight: 250.0,
           flexibleSpace: FlexibleSpaceBar(
             background: Container(color: Colors.blue,),
             // title: Text(''),
             // centerTitle: true,
           ),
         ),
         // SliverToBoxAdapter(
         //   child: Container(
         //     color: Colors.tealAccent,
         //     alignment: Alignment.center,
         //     height: 200,
         //     child: const Text('This is Container'),
         //   ),
         // ),
         SliverList(delegate: SliverChildListDelegate([
           Container(
            // padding:EdgeInsets.only(top: -20),
             height: MediaQuery.of(context).size.height,
               decoration: BoxDecoration(
                 color: Colors.blueGrey,
                 borderRadius: BorderRadius.circular(110),
               )
           )
         ],),),
         // SliverGrid(
         //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
         //     maxCrossAxisExtent: 200.0,
         //     mainAxisSpacing: 10.0,
         //     crossAxisSpacing: 10.0,
         //     childAspectRatio: 4.0,
         //   ),
         //   delegate: SliverChildBuilderDelegate(
         //         (BuildContext context, int index) {
         //       return Container(
         //         alignment: Alignment.center,
         //         color: Colors.teal[100 * (index % 9)],
         //         child: Text('Grid Item $index'),
         //       );
         //     },
         //     childCount: 20,
         //   ),
         // ),
         // SliverToBoxAdapter(
         //   child: Container(
         //     color: Colors.amberAccent,
         //     alignment: Alignment.center,
         //     height: 200,
         //     child: const Text('This is Container'),
         //   ),
         // ),
         // SliverToBoxAdapter(
         //   child: SizedBox(
         //     height: 100.0,
         //     child: ListView.builder(
         //       scrollDirection: Axis.horizontal,
         //       itemCount: 10,
         //       itemBuilder: (context, index) {
         //         return SizedBox(
         //           width: 100.0,
         //           child: Card(
         //             color: Colors.cyan[100 * (index % 9)],
         //             child: Text('Item $index'),
         //           ),
         //         );
         //       },
         //     ),
         //   ),
         // ),
         // SliverFixedExtentList(
         //   itemExtent: 50.0,
         //   delegate: SliverChildBuilderDelegate(
         //         (BuildContext context, int index) {
         //       return Container(
         //         alignment: Alignment.center,
         //         color: Colors.lightBlue[100 * (index % 9)],
         //         child: Text('List Item $index'),
         //       );
         //     },
         //   ),
         // ),
       ],
     ),*/
  }
}

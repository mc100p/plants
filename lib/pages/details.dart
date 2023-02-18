import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:plants/model/plants_model.dart';
import 'package:plants/utils/custom_icons_icons.dart';
import 'package:plants/utils/custom_widgets.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.itemList});

  final Plants itemList;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<String> plantCategory = [
    'Category',
    'Plant',
    'Size',
    'Height',
    'Humidity',
  ];

  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                sliver: SliverAppBar(
                  leading: Container(),
                  leadingWidth: 0,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: circularContainer(
                              const Color(0xFFC4DEAA),
                              const Icon(CustomIcons.left_arrow),
                            ),
                          ),
                          Text(
                            "Details",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.itemList.saved = saved;
                              setState(() {
                                saved = !saved;
                              });
                            },
                            child: circularContainer(
                              const Color(0xFFC4DEAA),
                              saved == true
                                  ? const Icon(CustomIcons.heart_filled)
                                  : const Icon(CustomIcons.heart),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFC4DEAA),
                    ),
                    child: Image.asset(
                      widget.itemList.imgUrl,
                      height: 300,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.itemList.name,
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                CustomIcons.star,
                                size: 20,
                                color: Color(0xFF284C1C),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${widget.itemList.ratings.toString()} '
                                '(${widget.itemList.reviews} reviews)',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        '\$${widget.itemList.cost.toString()}',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Wrap(children: [
                    // Text(
                    //   widget.itemList.description,
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.w400,
                    //       color: Colors.grey[700],
                    //       fontSize: 14.5),
                    // )
                    ExpandableText(
                      widget.itemList.description,
                      expandText: 'Read more',
                      collapseText: 'Read less',
                      maxLines: 4,
                      animation: true,
                      linkColor: Theme.of(context).primaryColor,
                    ),
                  ]),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 35.0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    "Plant Information",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              // SliverPadding(
              //   padding: const EdgeInsets.symmetric(horizontal: 35.0),
              //   sliver: SliverList(
              //       delegate: SliverChildBuilderDelegate(
              //     childCount: widget.itemList..length,
              //     (context, index) {
              //       return Text(widget.itemList.customerReviews[index]);
              //     },
              //   )),
              // ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    // alignment: WrapAlignment.spaceBetween,
                    children: [
                      for (int i = 0;
                          i < widget.itemList.plantInformation.length;
                          i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plantCategory[i],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(height: 5.5),
                              Text(
                                widget.itemList.plantInformation[i],
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      // for (var i in plantCategory)
                      //   for (var x in widget.itemList.plantInformation)
                      //     Column(
                      //       children: [
                      //         Text(i),
                      //         Text(x),
                      //       ],
                      // )
                    ],
                  ),
                ),
              ),
              // SliverPadding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
              //   sliver: SliverToBoxAdapter(
              //     child: Wrap(
              //       alignment: WrapAlignment.spaceBetween,
              //       children: [
              //         for (var i in widget.itemList.plantInformation)
              //           Column(
              //             children: [
              // Text(
              //   i,
              //   style: TextStyle(
              //       color: Theme.of(context).primaryColor,
              //       fontWeight: FontWeight.bold),
              // ),
              //             ],
              //           ),
              //       ],
              //     ),
              //   ),
              // ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 35.0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount: widget.itemList.customerReviews.length,
                  (context, index) {
                    return Text(widget.itemList.customerReviews[index]);
                  },
                )),
              ),
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 100))
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: MaterialButton(
                padding: const EdgeInsets.all(28),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  // Fluttertoast.showToast(msg: 'Item Added to Cart');
                },
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plants/model/plants_model.dart';
import 'package:plants/pages/cart.dart';
import 'package:plants/pages/categoriesList.dart';
import 'package:plants/pages/fav.dart';
import 'package:plants/pages/profile.dart';
import 'package:plants/utils/custom_icons_icons.dart';
import 'package:plants/utils/custom_widgets.dart';
import 'package:plants/utils/magic_string.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: tabController,
            children: const [
              HomeContent(),
              Cart(),
              Favourite(),
              Profile(),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        tabController.animateTo(0);
                        setState(() {
                          currentIndex = tabController.index;
                        });
                      },
                      child: icons(
                        context,
                        currentIndex == 0
                            ? CustomIcons.home_filled
                            : CustomIcons.home,
                        mei(0),
                        iconColor(context, 0),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        tabController.animateTo(1);
                        setState(() {
                          currentIndex = tabController.index;
                        });
                      },
                      child: icons(
                        context,
                        currentIndex == 1
                            ? CustomIcons.shopping_cart_3
                            : CustomIcons.shopping_cart_2,
                        mei(1),
                        iconColor(context, 1),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        tabController.animateTo(2);
                        setState(() {
                          currentIndex = tabController.index;
                        });
                      },
                      child: icons(
                        context,
                        currentIndex == 2
                            ? CustomIcons.heart_filled
                            : CustomIcons.heart,
                        mei(2),
                        iconColor(context, 2),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        tabController.animateTo(3);
                        setState(() {
                          currentIndex = tabController.index;
                        });
                      },
                      child: icons(
                        context,
                        currentIndex == 3
                            ? CustomIcons.person_filled
                            : CustomIcons.person,
                        mei(3),
                        iconColor(context, 3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color iconColor(BuildContext context, index) {
    return currentIndex == index ? Theme.of(context).primaryColor : Colors.grey;
  }

  Color mei(index) {
    return currentIndex == index ? Colors.white : const Color(0xFF385C34);
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Map> items = [];
  String currentTag = 'All';

  int selectedIndex = 0;

  _onSelected(int index) {
    setState(() => selectedIndex = index);
  }

  void setTag(String tag) {
    setState(() {
      currentTag = tag;
    });
  }

  List<Plants> get itemList {
    if (currentTag == "All") return plantsList;
    return plantsList.where((element) => element.tag == currentTag).toList();
  }

  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 35)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Find Your',
                            style: TextStyle(
                                color: Color(0xFF284C1C), fontSize: 14.5),
                          ),
                          SizedBox(height: 7),
                          Text('Favourite Plants',
                              style: TextStyle(
                                  color: Color(0xFF284C1C),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      circularContainer(
                        const Color(0xFFC4DEAA),
                        const Icon(
                          CustomIcons.search,
                          color: Color(0xFF284C1C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categoriesList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setTag(categoriesList[index].tag);
                            _onSelected(index);
                          },
                          child: categoriesWidget(context,
                              categoriesList[index], selectedIndex, index),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: itemList.length,
                  (context, index) {
                    return InkWell(
                      onTap: () => context.pushNamed(RouteNames.detailPage,
                          extra: itemList[index]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 3),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xFFC4DEAA),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(itemList[index].imgUrl),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  itemList[index].name,
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  '\$${itemList[index].cost}',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            circularContainer(
                                              Theme.of(context).primaryColor,
                                              const Icon(
                                                CustomIcons.right,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 20,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          saved = !saved;
                                          itemList[index].saved = saved;
                                        });
                                      },
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: backgroundColor(),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Icon(
                                            itemList[index].saved == true
                                                ? CustomIcons.heart_filled
                                                : CustomIcons.heart,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 100)),
            ],
          ),
        ],
      ),
    );
  }
}

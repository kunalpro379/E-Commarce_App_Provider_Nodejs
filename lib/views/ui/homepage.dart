import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../models/sneaker_model.dart';
import '../../services/helper.dart';
import '../shared/appstyle.dart';
import '../shared/home_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height *
              1.5, // adjust height as needed
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/top_image.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Athletics Shoes",
                        style: appstyleWithHt(
                            25, Colors.white, FontWeight.bold, 1.5),
                      ),
                      Text(
                        "Collection",
                        style: appstyleWithHt(
                            25, Colors.white, FontWeight.w700, 1.2),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.190,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.yellow,
                      indicatorWeight: 2,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: appstyle(16, Colors.white, FontWeight.bold),
                      tabs: const [
                        Tab(text: "Men Shoes"),
                        Tab(text: "Women Shoes"),
                        Tab(text: "Kids Shoes"),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.445,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.410,
                                  child: ListView.builder(
                                    itemCount: 6,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 12,
                                            bottom: 15),
                                        child: Container(
                                          color: Colors.grey,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                        ),
                                      );
                                    },
                                  ))
                            ],
                          ),
                          // Add other TabBarView children here
                          Container(), // Placeholder for Women Shoes
                          Container(), // Placeholder for Kids Shoes
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Latest Shoes",
                                style: appstyle(
                                    20, Colors.black, FontWeight.bold)),
                            Row(
                              children: [
                                Text(
                                  "Show All",
                                  style: appstyle(
                                      19, Colors.black, FontWeight.w500),
                                ),
                                Icon(AntDesign.caretright,
                                    size: 19, color: Colors.black)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      //color: Colors.orange,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 12, bottom: 15),
                            child: Container(
                              color: Colors.grey,
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      //color: Colors.orange,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 12, bottom: 15),
                            child: Container(
                              color: Colors.grey,
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}

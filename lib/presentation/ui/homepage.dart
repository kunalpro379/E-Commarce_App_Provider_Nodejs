import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shopping/presentation/shared/ListViewBuilder.dart';
import 'package:shopping/presentation/shared/product_card.dart';

import '../../models/sneaker_model.dart';
import '../../services/helper.dart';
import '../shared/appstyle.dart';
import '../shared/home_widget.dart';
import '../shared/new_shoes.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;
  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getFemaleSneakers();
  }

  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 251, 245, 230),
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height:
            MediaQuery.of(context).size.height * 1.5, // adjust height as needed
        child: Stack(
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   child: Image.asset('assets/images/back2.jpg'),
            // ),
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   child: Image.asset('assets/images/back2.jpg'),
            // ),
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
                        HomeWidget(male: _male),
                        HomeWidget(male: _female),
                        HomeWidget(male: _kids),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Latest Shoes",
                              style:
                                  appstyle(20, Colors.black, FontWeight.bold)),
                          Row(
                            children: [
                              Text(
                                "Show All",
                                style:
                                    appstyle(19, Colors.black, FontWeight.w500),
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
                      height: 100,
                      //color: Colors.orange,
                      child: FutureBuilder<List<Sneakers>>(
                        future: _male,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            final male = snapshot.data;
                            return ListView.builder(
                              itemCount: male!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final shoe = male[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      // left: 5,
                                      // right: 5,
                                      top: 12,
                                      bottom: 15),
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: NewShoes(
                                            imageUrl: shoe.imageUrl[1]),
                                      )),
                                );
                              },
                            );
                          } else {
                            return Center(child: Text('No data available'));
                          }
                        },
                      )),
                  //   ListView.builder(
                  //   itemCount: 6,
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.only(
                  //           left: 15, right: 15, top: 12, bottom: 15),
                  //       child: NewShoes(
                  //         imageUrl: '',
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

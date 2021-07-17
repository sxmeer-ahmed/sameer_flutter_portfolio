import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/ProjectProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/CustomDrawer.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/ProjectDetailsPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_background/animated_background.dart';

import 'package:glass_kit/glass_kit.dart';

class ProjectPage extends StatefulWidget {
  static const String TAG = "ProjectPage";
  static const String Route = "/projects";

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with TickerProviderStateMixin {
  ScrollController scrollController, listController;

  double scrollOffset = 0;

  @override
  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final uiModel = Provider.of<CursorProvider>(context);
    final proModel = Provider.of<ProjectProvider>(context);

    List<String> images = [
      'assets/images/MilaKya.jpg',
      'assets/images/Portfolio.jpg',
      'assets/images/Calc.jpg',
      'assets/images/ComingSoon.gif'
    ];

    List<String> names = [
      'Mila Kya',
      'Personal Portfolio',
      'Meter Bill Calculator',
      'Coming Sooon'
    ];
    return Container(
        color: Color(0xff293A80),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          endDrawer: CustomDrawer(),
          body: SafeArea(
              child: Stack(children: [
            Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(
                      PageTransition(
                          duration: const Duration(milliseconds: 700),
                          type: PageTransitionType.rippleLeftDown,
                          child: CustomDrawer()),
                    );
                  },
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.arrow_back,
                        size: 50,
                        color: Colors.white,
                      )),
                )),
            Center(
              child: Container(
                  // height: 260,
                  // width: 160,
                  child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 1.2,
                  //aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,

                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  //pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                items: [0, 1, 2, 3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                          onTap: i != 3
                              ? () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProjectDetailsPage(
                                            number: i.toInt(),
                                          )));
                                }
                              : () {},
                          child: Stack(children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        images[i],
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: Utils.getHeight(context) / 2.5),
                                child: Text(
                                  names[i],
                                  style: TextStyle(
                                      fontFamily: "wide",
                                      fontSize: 100.0 *
                                          Utils.getWidth(context) /
                                          1550,
                                      color: Colors.white),
                                )),
                          ]));
                    },
                  );
                }).toList(),
              )),
            ),
          ])),
        ));
  }
}

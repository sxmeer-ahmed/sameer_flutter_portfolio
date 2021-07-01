import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/rendering/mouse_cursor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/CustomDrawer.dart';
import 'package:sameer_flutter_portfolio/UI/Others/DefaultCursor.dart';
import 'package:sameer_flutter_portfolio/UI/Others/HomeScreenCursor.dart';
import 'package:sameer_flutter_portfolio/UI/Others/HoverableButton.dart';
import 'package:sameer_flutter_portfolio/UI/Others/RippleCircularAnimation.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/IntroPage.dart';

import 'package:video_player/video_player.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  static const String TAG = "HomePage";
  static const String Route = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController _controller;
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    //html.window.location.reload();

    //Video
    _controller = VideoPlayerController.asset("assets/images/coffee3.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
    /*final loader = document.getElementsByClassName('loader');
    if (loader.isNotEmpty) {
      loader.first.remove();
    }*/
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final uiModel = Provider.of<CursorProvider>(context);

    return Scaffold(
      key: globalKey,
      endDrawer: CustomDrawer(),
      backgroundColor: Colors.black,
      body: MouseRegion(
        cursor: SystemMouseCursors.none,
        onHover: (event) {
          uiModel.setPointerPosition(event.position);
        },
        child: Container(
          color: Color.fromARGB(255, 204, 210, 255),
          width: Utils.getWidth(context),
          height: Utils.getHeight(context),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height / 1.50,
                    ),
                    FittedBox(
                      // If your background video doesn't look right, try changing the BoxFit property.
                      // BoxFit.fill created the look I was going for.
                      fit: BoxFit.fill,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: VideoPlayer(_controller),
                      ),
                    )
                  ],
                ),
              ),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  left: uiModel.pointerPosition.dx,
                  top: uiModel.pointerPosition.dy,
                  child: Container(
                    width: 4,
                    height: 4,
                    color: Colors.black,
                  )),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                left: Utils.getCursorMainScreenWithRangeW(
                    uiModel.pointerPosition.dx, context),
                top: Utils.getCursorMainScreenWithRangeH(
                    uiModel.pointerPosition.dy, context),
                child: DefaultCursor(),
              ),
              /*Positioned(
                  left: screenWidth * 0,
                  top: screenHeight * 0.1,
                  child: Text(
                    'HELLO',
                    style: TextStyle(
                        fontFamily: "wide",
                        fontWeight: FontWeight.bold,
                        fontSize:
                            80 * (MediaQuery.of(context).size.width / 1250),
                        color: Colors.black),
                  )),*/
              Positioned(
                  top: screenHeight * 0.385,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 16 * MediaQuery.of(context).size.width / 1250,
                        top: screenHeight * 0.03),
                    child: Text(
                      'Hello, I am',
                      style: TextStyle(
                          fontFamily: "sharpgro",
                          fontSize:
                              20 * (MediaQuery.of(context).size.width / 1250),
                          color: Colors.black),
                    ),
                  )),
              Positioned(
                  top: screenHeight * 0.3,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 14 * MediaQuery.of(context).size.width / 1250),
                      child: Text(
                        '\n\nSAMEER AHMED',
                        style: TextStyle(
                            fontFamily: "wide",
                            fontSize:
                                50 * (MediaQuery.of(context).size.width / 1250),
                            color: Colors.black),
                      ))),
              Positioned(
                top: screenHeight * 0.47,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16 * MediaQuery.of(context).size.width / 1250),
                  child: Text(
                    '\n\nAndroid,iOS and Web',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontFamily: "sharpgro",
                        fontSize:
                            20 * (MediaQuery.of(context).size.width / 1250),
                        color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.47,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 261 * MediaQuery.of(context).size.width / 1250),
                  child: Text(
                    '\n\nFlutter Developer',
                    style: TextStyle(
                        // decoration: TextDecoration.lineThrough,
                        fontFamily: "sharpgro",
                        fontSize:
                            20 * (MediaQuery.of(context).size.width / 1250),
                        color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.47,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16 * MediaQuery.of(context).size.width / 1250),
                  child: Text(
                    '\n\n\nfrom New Delhi, India',
                    style: TextStyle(
                        // decoration: TextDecoration.lineThrough,
                        fontFamily: "sharpgro",
                        fontSize:
                            20 * (MediaQuery.of(context).size.width / 1250),
                        color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.27,
                right: screenWidth * 0.01,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16 * MediaQuery.of(context).size.width / 1250),
                  child: Text(
                    'S\n\nA\n\nM\n\nE\n\nE\n\nR',
                    style: TextStyle(
                        fontFamily: "wide",
                        fontSize:
                            20 * (MediaQuery.of(context).size.width / 1250),
                        color: Colors.black),
                  ),
                ),
              ),

              /*Image(
                      image: AssetImage(
                        'assets/images/bg1.gif',
                      ),
                      //height: MediaQuery.of(context).size.height / 1.5,
                    ),*/

              /* Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      EdgeInsets.all(Utils.isMobileView(context) ? 10 : 18.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(
                        'assets/images/bg2.gif',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),*/

              Positioned(
                  right: -120 + (Utils.isMobileView(context) ? 10 : 15.0),
                  top: -120 + (Utils.isMobileView(context) ? 10 : 15.0),
                  child: RippleAnimation()),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      EdgeInsets.all(Utils.isMobileView(context) ? 10 : 18.0),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    mouseCursor: SystemMouseCursors.none,
                    onTap: () {},
                    onHover: (val) {
                      uiModel.setIsLogoHovering(val);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        height: uiModel.isLogoHovering ? 60 : 50,
                        duration: const Duration(milliseconds: 200),
                        child: Text(
                          "SAMEEER AHMED",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "wide",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding:
                      EdgeInsets.all(Utils.isMobileView(context) ? 10 : 15.0),
                  child: HoverableButton(
                    width: 70,
                    height: 70,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            duration: const Duration(milliseconds: 700),
                            type: PageTransitionType.rippleRightDown,
                            child: CustomDrawer()),
                      );
                    },
                    /*() {
                      globalKey.currentState.openEndDrawer();
                    },*/
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.menu,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Utils.isMobileView(context)
                    ? Alignment.bottomCenter
                    : Alignment.bottomLeft,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HoverableButton(
                            height: 40,
                            width: 60,
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.black,
                              size: 25,
                            ),
                            onPressed: () {
                              Utils.launchURL(PersonalData.twitterURL);
                            }),
                        HoverableButton(
                            height: 40,
                            width: 60,
                            child: Icon(
                              FontAwesomeIcons.github,
                              color: Colors.black,
                              size: 25,
                            ),
                            onPressed: () {
                              Utils.launchURL(PersonalData.githubURL);
                            }),
                        HoverableButton(
                            height: 40,
                            width: 60,
                            child: Icon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.black,
                              size: 25,
                            ),
                            onPressed: () {
                              Utils.launchURL(PersonalData.linkedinURL);
                            }),
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Utils.isMobileView(context)
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "© Sameer Ahmed, ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                            Text(
                              "Build with ❤ and ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                            HoverableButton(
                              height: 30,
                              width: 70,
                              onPressed: () {
                                Utils.launchURL(PersonalData.flutterURL);
                              },
                              child: Text(
                                "Flutter",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                            )
                          ],
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

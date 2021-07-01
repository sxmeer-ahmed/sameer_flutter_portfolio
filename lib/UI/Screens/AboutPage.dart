import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/DefaultCursor.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:video_player/video_player.dart';
import 'package:flip_card/flip_card.dart';

class AboutPage extends StatefulWidget {
  static const String TAG = "AboutPage";
  static const String Route = "/about";

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  VideoPlayerController _controller;
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    //html.window.location.reload();

    //Video
    _controller = VideoPlayerController.asset("assets/images/school.mp4")
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
    final uiModel = Provider.of<CursorProvider>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: MouseRegion(
          cursor: SystemMouseCursors.none,
          onHover: (event) {
            uiModel.setPointerPosition(event.position);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: Utils.getHeight(context),
            width: Utils.getWidth(context),
            child: Stack(
              children: [
                Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              // color: Colors.black,
                              child: Column(children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              // color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  vertical: Utils.isMobileView(context)
                                      ? Utils.getHeight(context) / 2
                                      : uiModel.pointerPosition.dy / 10),
                              child: SingleChildScrollView(
                                padding: EdgeInsets.only(top: 50),
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: AnimatedContainer(
                                  color: Colors.black,
                                  duration: const Duration(milliseconds: 200),
                                  margin: EdgeInsets.only(
                                      left: Utils.isMobileView(context)
                                          ? 10
                                          : uiModel.pointerPosition.dx / 4),
                                  child: GlowText(
                                    "ABBOUT   AABOUT   ABOUUT",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(127, 255, 0, 1),
                                        fontFamily: "wide",
                                        fontSize: Utils.isMobileView(context)
                                            ? 60
                                            : 150,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                color: Colors.black,
                                child: Padding(
                                  padding: !Utils.isMobileView(context)
                                      ? EdgeInsets.only(
                                          bottom: 100, left: 100, right: 100)
                                      : EdgeInsets.only(
                                          bottom: 20, left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontFamily: "wide",
                                                fontSize:
                                                    Utils.isMobileView(context)
                                                        ? 25
                                                        : 60,
                                                color: Colors.white,
                                                letterSpacing: 2,
                                                wordSpacing: 5),
                                            children: [
                                              TextSpan(
                                                text: "Hi there, my name is "
                                                    .toUpperCase(),
                                              ),
                                              TextSpan(
                                                  text: "Sameer Ahmed.\n\n"
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        127, 255, 0, 1),
                                                  )),
                                              TextSpan(
                                                  text:
                                                      "I’m a Flutter & Android Developer based in New Delhi, India.\n\n"
                                                          .toUpperCase()),
                                              TextSpan(
                                                  text:
                                                      "I love engineering and everything related to it admires me. Want to be a part of some awesome developers which are changing world with there knowledge and skills :)\n\n"
                                                          .toUpperCase()),
                                              TextSpan(
                                                  text:
                                                      "I most of the time being on my laptop explore things, mostly technical. and always creating something by enjoying every part of it.\n\n"
                                                          .toUpperCase()),
                                              TextSpan(
                                                  text:
                                                      "You can connect with me on "
                                                          .toUpperCase(),
                                                  children: [
                                                    TextSpan(
                                                        text: "Instagram"
                                                            .toUpperCase(),
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = () {
                                                                Utils.launchURL(
                                                                    PersonalData
                                                                        .instaURL);
                                                              },
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline)),
                                                    TextSpan(
                                                        text: " & "
                                                            .toUpperCase()),
                                                    TextSpan(
                                                        text: "Twitter."
                                                            .toUpperCase(),
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = () {
                                                                Utils.launchURL(
                                                                    PersonalData
                                                                        .twitterURL);
                                                              },
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline))
                                                  ]),
                                            ]),
                                      )
                                    ],
                                  ),
                                )),
                          ])),
                          Container(
                              height: 50,
                              width: Utils.getWidth(context),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Color.fromARGB(255, 216, 33, 109)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              )),
                          Container(
                              width: Utils.getWidth(context),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0,
                                    color: Color.fromARGB(255, 216, 33, 109)),
                                color: Color.fromARGB(255, 216, 33, 109),
                              ),
                              child: Center(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 38.0,
                                        top: Utils.isMobileView(context)
                                            ? 50.0
                                            : 30.0),
                                    child: Text(
                                      "Education".toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 70, fontFamily: "wide"),
                                    )),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0,
                                    color: Color.fromARGB(255, 216, 33, 109)),
                                color: Color.fromARGB(255, 216, 33, 109),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 5,
                                            bottom: 10.0,
                                            top: Utils.isMobileView(context)
                                                ? 50.0
                                                : 20.0),
                                        child: Text(
                                          "DELHI TECHNOLOGICAL \nUNIVERSITY (FORMERLY AS DCE)"
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 40, fontFamily: "wide"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 365,
                                            bottom: 10.0,
                                            top: Utils.isMobileView(context)
                                                ? 50.0
                                                : 0.0),
                                        child: Text(
                                          "  B.TECH IN COMPUTER SCIENCE \n  Aug 2019-2023 | New Delhi, India                                             ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "sharpgro"),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                              "                                                                                                                                                                                       PERCENTAGE : 82.4% (93.7% in PCM)"),
                                          Container(
                                            width:
                                                Utils.getWidth(context) / 1.5,
                                            height: 2,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 5,
                                            bottom: 15.0,
                                            top: Utils.isMobileView(context)
                                                ? 50.0
                                                : 20.0),
                                        child: Text(
                                          "RPVV LINK ROAD                      "
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 40, fontFamily: "wide"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 365,
                                            bottom: 15.0,
                                            top: Utils.isMobileView(context)
                                                ? 50.0
                                                : 0.0),
                                        child: Text(
                                          "INTERMEDIATE/+2                                  \nMar 2017-2019 | New Delhi, India                                             ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "sharpgro"),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                              "                                                                                                                                                                                                                                     CGPA : 9.4"),
                                          Container(
                                            width:
                                                Utils.getWidth(context) / 1.5,
                                            height: 2,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 5,
                                            bottom: 10.0,
                                            top: Utils.isMobileView(context)
                                                ? 50.0
                                                : 20.0),
                                        child: Text(
                                          "RAMJAS SR. SEC. SCH00L NO. 4"
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 40, fontFamily: "wide"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 365,
                                            bottom: 35.0,
                                            top: Utils.isMobileView(context)
                                                ? 50.0
                                                : 0.0),
                                        child: Text(
                                          "MATRICULATION                                              \nMar 2012-2017 | New Delhi, India                                             ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "sharpgro"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      height: Utils.getHeight(context) / 2.1,
                                      width: Utils.getWidth(context) / 3,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/images/cycle.gif"))),
                                ],
                              )),
                          Container(
                              height: 50,
                              width: Utils.getWidth(context),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 216, 33, 109),
                                    Colors.black,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.all(
                                !Utils.isMobileView(context) ? 100.0 : 10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 38.0,
                                      top: Utils.isMobileView(context)
                                          ? 50.0
                                          : 0.0),
                                  child: FlipCard(
                                    direction:
                                        FlipDirection.HORIZONTAL, // default
                                    front: Text(
                                      "SKILLS".toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 50, fontFamily: "long"),
                                    ),
                                    back: Padding(
                                      padding: EdgeInsets.all(
                                          !Utils.isMobileView(context)
                                              ? 100.0
                                              : 10.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(
                                                Utils.isMobileView(context)
                                                    ? 10
                                                    : 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Android",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: "wide",
                                                        fontSize:
                                                            Utils.isMobileView(
                                                                    context)
                                                                ? 15
                                                                : 25),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Flutter",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: "wide",
                                                        fontSize:
                                                            Utils.isMobileView(
                                                                    context)
                                                                ? 15
                                                                : 25),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Firebase",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: "wide",
                                                        fontSize:
                                                            Utils.isMobileView(
                                                                    context)
                                                                ? 15
                                                                : 25),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text("Strong"),
                                              Container(
                                                width: Utils.getWidth(context) /
                                                    1.2,
                                                height: 2,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: Utils.isMobileView(context)
                                                ? EdgeInsets.all(10)
                                                : const EdgeInsets.only(
                                                    top: 50.0,
                                                    left: 50,
                                                    right: 50),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Dart",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: "wide",
                                                        fontSize:
                                                            Utils.isMobileView(
                                                                    context)
                                                                ? 15
                                                                : 25),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "C",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: "wide",
                                                        fontSize:
                                                            Utils.isMobileView(
                                                                    context)
                                                                ? 15
                                                                : 25),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "C++",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: "wide",
                                                        fontSize:
                                                            Utils.isMobileView(
                                                                    context)
                                                                ? 15
                                                                : 25),
                                                  ),
                                                ),
                                              ],
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
                          Padding(
                            padding: EdgeInsets.all(
                                !Utils.isMobileView(context) ? 100.0 : 10.0),
                            child: OutlinedButton(
                              onPressed: () {
                                Utils.launchURL(PersonalData.resumeURL);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  "My Resume",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Utils.isMobileView(context)
                                          ? 15
                                          : 25),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(
                            Utils.isMobileView(context) ? 10 : 18.0),
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          mouseCursor: SystemMouseCursors.none,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          onHover: (val) {
                            uiModel.setIsLogoHovering(val);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedContainer(
                              height: uiModel.isLogoHovering ? 60 : 50,
                              duration: const Duration(milliseconds: 200),
                              child: Image.asset(
                                "images/logo.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: uiModel.pointerPosition.dx -
                      (uiModel.isHoveringLinks ? 150 : 100),
                  top: uiModel.pointerPosition.dy -
                      (uiModel.isHoveringLinks ? 150 : 100),
                  child: IgnorePointer(
                      child: DefaultCursor(
                    color: Colors.white,
                  )),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  left: uiModel.pointerPosition.dx,
                  top: uiModel.pointerPosition.dy,
                  child: IgnorePointer(
                      child: Container(
                    color: Colors.white,
                    width: 3,
                    height: 3,
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}

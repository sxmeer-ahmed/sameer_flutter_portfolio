import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/DataModels/ProjectModel.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/DefaultCursor.dart';
import 'package:sameer_flutter_portfolio/UI/Others/HoverableButton.dart';
import 'package:flip_panel/flip_panel.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/CreativePage.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/ProjectsPage.dart';
import 'package:video_player/video_player.dart';

class PresentationPage extends StatefulWidget {
  static const String TAG = "PresentationPage";
  static const String Route = "/design";
  final int number;

  PresentationPage({@required this.number});

  @override
  _PresentationPageState createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  //List<String> tech=[]
  List<List<String>> images = [
    [
      'assets/images/meme.jpg',
      'assets/images/mk.jpg',
      'assets/images/techquest.jpg',
      'assets/images/fresher.jpg',
      'assets/images/codechef.jpg',
      'assets/images/binod.jpg',
      'assets/images/norisk.jpg'
    ],
    [
      'assets/images/mklogo.jpg',
      'assets/images/ssm.jpg',
      'assets/images/poster.jpg',
    ],
    ['assets/images/flutter.jpg']
  ];

  List<List<String>> title = [
    [
      'PANZOID MULTISTYLE INTRO ',
      'MILA KYA? RELEASE VIDEO',
      'TECHQUEST\'20 PROMO',
      'D_CODER DTU FRESHERS INTRO',
      'CODECHEF DTU MEET INVITATION',
      'TECHQUEST HACKIT EVENT PROMO',
      'NO RISK FESTIVAL GREETING'
    ],
    [
      'MILA KYA? LOGO DESIGN',
      'SENIORS SE MULAQUAAT LOGO DESIGN',
      'MILA KYA? POSTER',
    ],
    ['D_CODER DTU FLUTTER ROADMAP']
  ];

  List<List<String>> Links = [
    [
      'https://youtu.be/4jLwZcDX3KA',
      'https://www.linkedin.com/feed/update/urn:li:activity:6789633902634946560/',
      'https://www.instagram.com/p/CD3t3bFpklm/',
      'https://www.instagram.com/p/CIdpTb5JrHZ/',
      'https://www.instagram.com/p/CLFBtsEJQ9_/',
      'https://www.instagram.com/p/CEGe-p1JRb6/',
      'https://www.facebook.com/116268710173813/videos/202697284864288'
    ],
    [
      'MILA KYA? LOGO DESIGN',
      'SSM LOGO DESIGN',
      'https://www.instagram.com/p/CNzJSBipZzE/',
    ],
    [
      'https://cardio-coder.medium.com/roadmap-to-become-a-flutter-developer-dtu-d-coder-a613097a65f6'
    ]
  ];

  List<List<String>> taglines = [
    [
      'The Panzoid Multistyle intro featuring my signature name SXMEER. I made it using simple windows editor for merge and sync and Panzoid for design. I made it when I was in 10th standard.',
      'The Release video of Mila Kya? Which is one of my app, I have used AfterEffects and Element 3D plugin for this video.',
      'The Promo video of TechQuest\'20 which is an Annual Fest of D_CODER DTU (The Technological Society of Delhi Technological University). I referred to Shutterstock for video assets.',
      'The Freshers\'20 Introduction video of D_CODER DTU (The Technological Society of Delhi Technological University). I referred Shutterstock for video assets.',
      'The First Meet Invitation video of CODECHEF DTU Chapter.',
      'The Promo video of HackIT which is an Event of TechQuest\'20.',
      'The Festival Greeting Video for No Risk Enterprises.'
    ],
    [
      'The Logo Design of Mila Kya?.I have tried adding initials of words using the torch object.Torch is basically used for searching in dark places.I have used Adobe Illustrator for logo design.',
      'The Logo Design of Seniors Se Mulaquaat.I have tried adding initials of the words where M represents the handshake between senior and junior and the change in the color of the heads basically represents the exchange of experience and knowledge. I have used Adobe Illustrator for the design.',
      'The Release Poster of Mila Kya?.'
    ],
    [
      'Created a Flutter roadmap with the D_CODER team using multiple blogs and experiences. Also, as I\'m learning and updating it too.'
    ]
  ];

  /* VideoPlayerController _controller;
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
  }*/
  @override
  Widget build(BuildContext context) {
    final uiModel = Provider.of<CursorProvider>(context);
    return MouseRegion(
        cursor: SystemMouseCursors.none,
        onHover: (event) {
          uiModel.setPointerPosition(event.position);
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: Color.fromARGB(255, 187, 235, 251),
            height: Utils.getHeight(context),
            width: Utils.getWidth(context),
            child: Stack(children: [
              Stack(children: [
                Center(
                    child:
                        Image(image: AssetImage('assets/images/chacha.gif'))),
                SingleChildScrollView(
                    child: Column(
                  children: [
                    Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: images[widget.number].length,
                        itemBuilder: (context, index) {
                          return Container(
                              color: Colors.transparent,
                              padding: EdgeInsetsDirectional.only(
                                  top: index == 0 ? 60 : 20, bottom: 20),
                              child: GestureDetector(
                                  onTap: () {
                                    Utils.launchURL(
                                        Links[widget.number][index]);
                                  },
                                  child: GlassContainer.clearGlass(
                                      blur: 10,
                                      elevation: 20,
                                      //frostedOpacity: 0.9,
                                      borderRadius: BorderRadius.circular(20),
                                      width: Utils.getWidth(context) / 1.1,
                                      height: Utils.getHeight(context) / 3.6,
                                      borderColor:
                                          Color.fromARGB(255, 220, 210, 227),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Stack(
                                            children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                      width: Utils.getWidth(
                                                          context),
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .only(
                                                                  top: 10,
                                                                  start: 10),
                                                      child: Material(
                                                          type: MaterialType
                                                              .transparency,
                                                          child: Text(
                                                            title[widget.number]
                                                                [index],
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'sharpgro',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: Utils
                                                                      .isMobileView(
                                                                          context)
                                                                  ? 30
                                                                  : 50 *
                                                                      Utils.getWidth(
                                                                          context) /
                                                                      1550,
                                                            ),
                                                          )))),
                                              Align(
                                                  alignment: Alignment
                                                      .bottomLeft,
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .only(
                                                                  top: 80,
                                                                  start: 10,
                                                                  end: 400),
                                                      child: Material(
                                                          type: MaterialType
                                                              .transparency,
                                                          child: Text(
                                                            taglines[widget
                                                                .number][index],
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'sharpgro',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: Utils
                                                                        .isMobileView(
                                                                            context)
                                                                    ? 20
                                                                    : (widget.number ==
                                                                                1 &&
                                                                            index ==
                                                                                1)
                                                                        ? 20 *
                                                                            Utils.getWidth(
                                                                                context) /
                                                                            1550
                                                                        : 25 *
                                                                            Utils.getWidth(context) /
                                                                            1550),
                                                          )))),
                                              Align(
                                                  alignment: Alignment
                                                      .centerRight,
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .only(
                                                                  start: 60,
                                                                  top: 30,
                                                                  end: 20),
                                                      child: ClipRRect(

                                                          //border: Border.all(color: Colors.white),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          25)),
                                                          child: Image(
                                                            image: AssetImage(
                                                                images[widget
                                                                        .number]
                                                                    [index]),
                                                            width: 400 *
                                                                Utils.getWidth(
                                                                    context) /
                                                                1550,
                                                            height: 150 *
                                                                Utils.getHeight(
                                                                    context) /
                                                                750,
                                                            fit: BoxFit.contain,
                                                          )))),
                                            ],
                                          )
                                        ],
                                      ))));
                        },
                      ),
                    ),
                  ],
                )),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, bottom: 10),
                    child: HoverableButton(
                      height: 70,
                      width: 70,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          PageTransition(
                              duration: const Duration(milliseconds: 700),
                              type: PageTransitionType.rippleRightDown,
                              child: CreativePage()),
                        );
                      },
                      /*() {
                    Navigator.pop(context);
                  },*/
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, bottom: 8),
                        child: Icon(
                          Icons.close,
                          size: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: uiModel.pointerPosition.dx -
                      (uiModel.isHoveringLinks ? 150 : 100),
                  top: uiModel.pointerPosition.dy -
                      (uiModel.isHoveringLinks ? 150 : 100),
                  child: IgnorePointer(
                      child: DefaultCursor(
                    color: Colors.black,
                  )),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  left: uiModel.pointerPosition.dx,
                  top: uiModel.pointerPosition.dy,
                  child: IgnorePointer(
                      child: Container(
                    color: Colors.black,
                    width: 3,
                    height: 3,
                  )),
                ),
              ]),
            ])));
  }
}

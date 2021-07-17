import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/CustomDrawer.dart';
import 'package:sameer_flutter_portfolio/UI/Others/HoverableButton.dart';
import 'package:video_player/video_player.dart';

class ContactPage extends StatefulWidget {
  static const String TAG = "ContactPage";
  static const String Route = "/contact";

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  VideoPlayerController _controller;
  VideoPlayerController _controller1;
  VideoPlayerController _controller2;
  VideoPlayerController _controller3;
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    //html.window.location.reload();

    //Video
    _controller = VideoPlayerController.asset("assets/images/gmail.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });

    _controller1 = VideoPlayerController.asset("assets/images/youtube.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller1.play();
        _controller1.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });

    _controller2 = VideoPlayerController.asset("assets/images/fb.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller2.play();
        _controller2.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });

    _controller3 = VideoPlayerController.asset("assets/images/instagram.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller3.play();
        _controller3.setLooping(true);
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
      backgroundColor: Color.fromARGB(255, 12, 12, 12),
      key: globalKey,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "CONTACT ME",
                          style: TextStyle(
                              fontFamily: 'wide',
                              fontSize: 120,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, bottom: 20, top: 100),
                        child: Row(
                          children: [
                            FittedBox(
                              // If your background video doesn't look right, try changing the BoxFit property.
                              // BoxFit.fill created the look I was going for.
                              fit: BoxFit.fill,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.width / 11.7,
                              ),
                            ),
                            GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  Utils.launchURL(PersonalData.email);
                                },
                                child: IgnorePointer(
                                    child: FittedBox(
                                  // If your background video doesn't look right, try changing the BoxFit property.
                                  // BoxFit.fill created the look I was going for.
                                  fit: BoxFit.fill,
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: VideoPlayer(_controller),
                                  ),
                                ))),
                            GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  Utils.launchURL(PersonalData.youtube);
                                },
                                child: IgnorePointer(
                                    child: FittedBox(
                                  // If your background video doesn't look right, try changing the BoxFit property.
                                  // BoxFit.fill created the look I was going for.
                                  fit: BoxFit.fill,
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: VideoPlayer(_controller1),
                                  ),
                                ))),
                            GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  Utils.launchURL(PersonalData.facebookURL);
                                },
                                child: IgnorePointer(
                                    child: FittedBox(
                                  // If your background video doesn't look right, try changing the BoxFit property.
                                  // BoxFit.fill created the look I was going for.
                                  fit: BoxFit.fill,
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: VideoPlayer(_controller2),
                                  ),
                                ))),
                            GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  Utils.launchURL(PersonalData.instaURL);
                                },
                                child: IgnorePointer(
                                    child: FittedBox(
                                  // If your background video doesn't look right, try changing the BoxFit property.
                                  // BoxFit.fill created the look I was going for.
                                  fit: BoxFit.fill,
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: VideoPlayer(_controller3),
                                  ),
                                ))),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 120.0),
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: HoverableButton(
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      FontAwesomeIcons.twitter,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Utils.launchURL(PersonalData.twitterURL);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: HoverableButton(
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      FontAwesomeIcons.github,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Utils.launchURL(PersonalData.githubURL);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: HoverableButton(
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      FontAwesomeIcons.linkedinIn,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Utils.launchURL(PersonalData.linkedinURL);
                                    }),
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
          ),
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
            ),
          ),
        ],
      ),
    );
  }
}

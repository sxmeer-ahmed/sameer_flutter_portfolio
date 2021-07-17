import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/CustomDrawer.dart';
import 'package:sameer_flutter_portfolio/UI/Others/DefaultCursor.dart';
import 'package:sameer_flutter_portfolio/UI/Others/HoverableButton.dart';
import 'package:flip_card/flip_card.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/PresentationPage.dart';

import 'package:video_player/video_player.dart';
import 'package:glass_kit/glass_kit.dart';

class CreativePage extends StatefulWidget {
  static const String TAG = "CreativePage";
  static const String Route = "/creative";

  @override
  _CreativePageState createState() => _CreativePageState();
}

class _CreativePageState extends State<CreativePage> {
  final globalKey = GlobalKey<ScaffoldState>();
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();

    //html.window.location.reload();

    //Video
    _controller = VideoPlayerController.asset("assets/images/creative.mp4")
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
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (event) {
        uiModel.setPointerPosition(event.position);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: Color.fromARGB(255, 220, 210, 227),
        height: Utils.getHeight(context),
        width: Utils.getWidth(context),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: FittedBox(
                  // If your background video doesn't look right, try changing the BoxFit property.
                  // BoxFit.fill created the look I was going for.

                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: VideoPlayer(_controller),
                  ),
                )),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: uiModel.pointerPosition.dx -
                  (uiModel.isHoveringLinks ? 150 : 100),
              top: uiModel.pointerPosition.dy -
                  (uiModel.isHoveringLinks ? 150 : 100),
              child: DefaultCursor(),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              left: uiModel.pointerPosition.dx,
              top: uiModel.pointerPosition.dy,
              child: Container(
                color: Colors.black,
                width: 3,
                height: 3,
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
                        color: Colors.black,
                      )),
                )),
            Center(
                child: FlipCard(
                    direction: FlipDirection.HORIZONTAL, // default
                    back: GlassContainer.frostedGlass(
                      blur: 100,
                      elevation: 20,
                      frostedOpacity: 0.9,
                      borderRadius: BorderRadius.circular(20),
                      width: Utils.getWidth(context) / 1.5,
                      height: Utils.getHeight(context) / 1.2,
                      borderColor: Color.fromARGB(255, 220, 210, 227),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MouseRegion(
                              onExit: (_) {
                                uiModel.setCurrentHoverItem(0);
                              },
                              onEnter: (_) {
                                uiModel.setCurrentHoverItem(1);
                              },
                              cursor: SystemMouseCursors.none,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PresentationPage(
                                                number: 0,
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 80 * Utils.getHeight(context) / 1050,
                                      left:
                                          30 * Utils.getHeight(context) / 1250),
                                  child: Material(
                                      type: MaterialType.transparency,
                                      child: Text(
                                        "Videos".toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "wide",
                                            color: uiModel.currentHoverItem == 1
                                                ? Colors.white
                                                : Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                Utils.isMobileView(context)
                                                    ? 40
                                                    : Utils.getHeight(context) /
                                                        10),
                                      )),
                                ),
                              )),
                          MouseRegion(
                              onExit: (_) {
                                uiModel.setCurrentHoverItem(0);
                              },
                              onEnter: (_) {
                                uiModel.setCurrentHoverItem(1);
                              },
                              cursor: SystemMouseCursors.none,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PresentationPage(
                                                  number: 1,
                                                )));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 100 *
                                            Utils.getHeight(context) /
                                            700,
                                        left: 30 *
                                            Utils.getHeight(context) /
                                            1250),
                                    child: Material(
                                        type: MaterialType.transparency,
                                        child: Text(
                                          "Logo and\nPoster".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "wide",
                                              color:
                                                  uiModel.currentHoverItem == 1
                                                      ? Colors.white
                                                      : Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Utils.isMobileView(
                                                      context)
                                                  ? 40
                                                  : Utils.getHeight(context) /
                                                      10),
                                        )),
                                  ))),
                          MouseRegion(
                              onExit: (_) {
                                uiModel.setCurrentHoverItem(0);
                              },
                              onEnter: (_) {
                                uiModel.setCurrentHoverItem(1);
                              },
                              cursor: SystemMouseCursors.none,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PresentationPage(
                                                  number: 2,
                                                )));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 100 *
                                            Utils.getHeight(context) /
                                            600,
                                        left: 30 *
                                            Utils.getHeight(context) /
                                            1250),
                                    child: Material(
                                        type: MaterialType.transparency,
                                        child: Text(
                                          "Others".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "wide",
                                              color:
                                                  uiModel.currentHoverItem == 1
                                                      ? Colors.white
                                                      : Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Utils.isMobileView(
                                                      context)
                                                  ? 40
                                                  : Utils.getHeight(context) /
                                                      10),
                                        )),
                                  ))),
                        ],
                      ),
                    ),
                    front: GlassContainer.frostedGlass(
                      blur: 100,
                      elevation: 20,
                      frostedOpacity: 0.9,
                      borderRadius: BorderRadius.circular(20),
                      width: Utils.getWidth(context) / 1.5,
                      height: Utils.getHeight(context) / 1.2,
                      borderColor: Color.fromARGB(255, 220, 210, 227),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 80 * Utils.getHeight(context) / 600,
                                left: 30 * Utils.getHeight(context) / 1250),
                            child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  "I'm not much into creative, but here are \na few :"
                                      .toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "wide",
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Utils.isMobileView(context)
                                          ? 40
                                          : Utils.getWidth(context) / 20),
                                )),
                          ),
                          MouseRegion(
                              onExit: (_) {
                                uiModel.setCurrentHoverItem(0);
                              },
                              onEnter: (_) {
                                uiModel.setCurrentHoverItem(1);
                              },
                              cursor: SystemMouseCursors.none,
                              child: Padding(
                                padding: EdgeInsets.all(
                                    50.0 * Utils.getHeight(context) / 1250),
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 50,
                                  color: uiModel.currentHoverItem == 1
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              )),
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}

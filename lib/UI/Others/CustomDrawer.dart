import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/DefaultCursor.dart';
import 'package:sameer_flutter_portfolio/UI/Others/HoverableButton.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/AboutPage.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/CreativePage.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/ContactPage.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/HomePage.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/ProjectsPage.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
        color: Color(0xffFEC33F),
        height: Utils.getHeight(context),
        width: Utils.getWidth(context),
        child: Stack(
          children: [
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
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: HoverableButton(
                  height: 70,
                  width: 70,
                  onPressed: () {
                    //Navigator.pop(context);
                    //Navigator.pop(context);

                    Navigator.of(context).pushReplacement(PageTransition(
                        duration: const Duration(milliseconds: 700),
                        type: PageTransitionType.rippleRightDown,
                        child: HomePage()));
                  },
                  /*() {
                    Navigator.pop(context);
                  },*/
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Center(
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
                        Navigator.pushNamed(context, AboutPage.Route);
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 200),
                        child: Text("About".toUpperCase()),
                        style: TextStyle(
                            fontFamily: "wide",
                            color: uiModel.currentHoverItem == 1
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: Utils.isMobileView(context)
                                ? 50
                                : Utils.getHeight(context) /
                                    (uiModel.currentHoverItem == 1 ? 7 : 8)),
                      ),
                    ),
                  ),
                  MouseRegion(
                    onExit: (_) {
                      uiModel.setCurrentHoverItem(0);
                    },
                    onEnter: (_) {
                      uiModel.setCurrentHoverItem(2);
                    },
                    cursor: SystemMouseCursors.none,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ProjectPage.Route);
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 200),
                        child: Text("Projects".toUpperCase()),
                        style: TextStyle(
                            fontFamily: "wide",
                            color: uiModel.currentHoverItem == 2
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: Utils.isMobileView(context)
                                ? 50
                                : Utils.getHeight(context) /
                                    (uiModel.currentHoverItem == 2 ? 7 : 8)),
                      ),
                    ),
                  ),
                  MouseRegion(
                    onExit: (_) {
                      uiModel.setCurrentHoverItem(0);
                    },
                    onEnter: (_) {
                      uiModel.setCurrentHoverItem(3);
                    },
                    cursor: SystemMouseCursors.none,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CreativePage.Route);
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 200),
                        child: Text("Creative".toUpperCase()),
                        style: TextStyle(
                            fontFamily: "wide",
                            color: uiModel.currentHoverItem == 3
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: Utils.isMobileView(context)
                                ? 50
                                : Utils.getHeight(context) /
                                    (uiModel.currentHoverItem == 3 ? 7 : 8)),
                      ),
                    ),
                  ),
                  MouseRegion(
                    onExit: (_) {
                      uiModel.setCurrentHoverItem(0);
                    },
                    onEnter: (_) {
                      uiModel.setCurrentHoverItem(4);
                    },
                    cursor: SystemMouseCursors.none,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ContactPage.Route);
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 200),
                        child: Text("Contact".toUpperCase()),
                        style: TextStyle(
                            fontFamily: "wide",
                            color: uiModel.currentHoverItem == 4
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: Utils.isMobileView(context)
                                ? 50
                                : Utils.getHeight(context) /
                                    (uiModel.currentHoverItem == 4 ? 7 : 8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                              color: Colors.black,
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
                              FontAwesomeIcons.githubAlt,
                              color: Colors.black,
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
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              Utils.launchURL(PersonalData.linkedinURL);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: HoverableButton(
                            height: 40,
                            width: 40,
                            child: Icon(
                              FontAwesomeIcons.codepen,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              Utils.launchURL(PersonalData.codepenURL);
                            }),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/CustomDrawer.dart';
import 'package:sameer_flutter_portfolio/UI/Others/HoverableButton.dart';
import 'package:flip_card/flip_card.dart';

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

    return Scaffold(
      key: globalKey,
      endDrawer: CustomDrawer(),
      backgroundColor: Color.fromARGB(255, 220, 210, 227),
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 0, color: Color.fromARGB(255, 220, 210, 227)),
                ),
              ),
              FittedBox(
                // If your background video doesn't look right, try changing the BoxFit property.
                // BoxFit.fill created the look I was going for.
                fit: BoxFit.none,

                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: VideoPlayer(_controller),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(Utils.isMobileView(context) ? 10 : 18.0),
              child: InkWell(
                hoverColor: Colors.transparent,
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
                    child: Text('sameer'),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: HoverableButton(
                width: 70,
                height: 70,
                onPressed: () {
                  globalKey.currentState.openEndDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 80, left: 30),
                          child: Text(
                            "Videos".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "wide",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: Utils.isMobileView(context)
                                    ? 40
                                    : Utils.getHeight(context) / 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100, left: 30),
                          child: Text(
                            "Logo and Poster".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "wide",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: Utils.isMobileView(context)
                                    ? 40
                                    : Utils.getHeight(context) / 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100, left: 30),
                          child: Text(
                            "Others".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "wide",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: Utils.isMobileView(context)
                                    ? 40
                                    : Utils.getHeight(context) / 10),
                          ),
                        ),
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
                          padding: const EdgeInsets.only(top: 80, left: 30),
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
                                    : Utils.getHeight(context) / 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 50,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ))),
        ],
      ),
    );
  }
}

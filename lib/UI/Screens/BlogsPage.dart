import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/CustomDrawer.dart';
import 'package:sameer_flutter_portfolio/UI/Others/HoverableButton.dart';

class BlogsPage extends StatelessWidget {
  static const String Route = "/blogs";

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();

    final uiModel = Provider.of<CursorProvider>(context);

    return Scaffold(
      key: globalKey,
      endDrawer: CustomDrawer(),
      backgroundColor: Color(0xff262626),
      body: Stack(
        children: [
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
                    child: Image.asset(
                      "images/logo.png",
                    ),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "I don't do blogging very much but here are some on Dev.to",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Utils.isMobileView(context)
                            ? 40
                            : Utils.getHeight(context) / 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white,
                    iconSize: 50,
                    onPressed: () {
                      Utils.launchURL(PersonalData.devtoURL);
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Awesome design coming soon.."),
            ),
          ),
        ],
      ),
    );
  }
}

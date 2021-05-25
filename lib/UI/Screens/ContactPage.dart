import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/HoverableButton.dart';

class ContactPage extends StatefulWidget {
  static const String Route = "/contact";

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Widget _iframeWidget;
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    final IFrameElement _iframeElement = IFrameElement();
    _iframeElement.height = '500';
    _iframeElement.width = '500';
    _iframeElement.src = 'https://form.typeform.com/to/Lmd3Ng1B';
    _iframeElement.style.border = 'none';

    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    final uiModel = Provider.of<CursorProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xff262626),
      key: globalKey,
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
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Contact Me",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "Don't be a Stranger, just say hello :)",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Please fill the small contact form below",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          elevation: 20,
                          color: Color(0xff262626),
                          child: SizedBox(
                            height: 500,
                            width: Utils.isMobileView(context)
                                ? Utils.getWidth(context)
                                : Utils.getWidth(context) / 1.5,
                            child: _iframeWidget,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 12, right: 12),
                        child: Text(
                          "You can also email me",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 48.0),
                        child: GestureDetector(
                            child: Text("sahdeepsingh98@gmail.com",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                            onTap: () {
                              Utils.launchEmail(PersonalData.email);
                            }),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
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
                                      FontAwesomeIcons.facebook,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Utils.launchURL(PersonalData.facebookURL);
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
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: HoverableButton(
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      FontAwesomeIcons.instagram,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Utils.launchURL(PersonalData.instaURL);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

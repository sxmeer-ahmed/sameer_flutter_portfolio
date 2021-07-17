import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sameer_flutter_portfolio/CORE/DataModels/ProjectModel.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/HoverableButton.dart';
import 'package:flip_panel/flip_panel.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/ProjectsPage.dart';

class ProjectDetailsPage extends StatefulWidget {
  static const String TAG = "ProjectPage";
  static const String Route = "/projectdetail";
  final int number;

  ProjectDetailsPage({@required this.number});

  @override
  _ProjectDetailsPageState createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage>
    with TickerProviderStateMixin {
  List<String> images = [
    'assets/images/MilaKya.jpg',
    'assets/images/Portfolio.jpg',
    'assets/images/Calc.jpg',
    'assets/images/ComingSoon.gif'
  ];

  List<String> names = [
    'Mila Kya?',
    'Personal Portfolio',
    'Meter Bill Calculator',
    'Coming Sooon '
  ];

  List<String> taglines = [
    'The Lost & Found App of DTU',
    'Meeshu : The Perosnal Portfolio of me',
    'Simple Calculator with SQLite Database '
  ];
  List<String> desc = [
    'Lost or Found is an Android app for reporting lost, stolen, or found items. You can also see the lost or found items added by others.\nFor now, this app is limited to items Lost and Found in Delhi Technological University.\n\n\nAs soon as you lose or find something, all you have to do is update details about the lost or found item in this app.\nOr before buying any used items if you want to make sure they are not stolen/theft, just search for that item in this app. This will help you to find if anyone has already reported the same item as lost.\n\n\nIt is also possible to\n1. Contact the reporter if you have any clue on the reported item.\n2. Send messages through chat and maintain privacy.\n3. Report things that were lost, stolen, or found.\n4. Search for found items added by others and contact them.\n5. View images of lost or found items photo.\n6. It also has a map of DTU with updated markups for newly built buildings.\n\nThis app is totally free and you can report as many items as you want. Or search as many times as you want.\n\nReduce your sin by making an attempt to return back the items or valuable things you found to its true owner.\nAfter all we all have a good heart : )',
    'Complete portfolio website made with Flutter includes amazing animation and effects. In this I have implemented some custom cursor with a trick in flutter.',
    'Meter Bill Calculator is simple app which is completely made in Hindi. The idea behind this app is that most of the old people give house on rent but don\'t know about the calculation and not so high tech to use the app.So, this app will basically help them.\n\n\nFeatures :\n\n1. Text-to-Speech (TTS): Whenever the user calculates his result automatically the result will be spoken in Hindi and the user can verify by listening.\n\n2. SQL Database: To store the previous readings and the reason for SQL is that sometimes people don\'t have access to the internet even then this app will work.',
  ];

  List<List<String>> techstack = [
    ['Android', 'Flutter', 'Firebase', 'Google Maps API'],
    ['Website', 'Flutter', 'Firebase', ''],
    ['Android', 'Flutter', 'SQLite', 'Text-to-Speech (TTS)']
  ];

  List<String> links = [
    'https://github.com/debugger13524/lost_found_app',
    'https://github.com/sxmeer-ahmed/sameer_flutter_portfolio',
    'https://github.com/sxmeer-ahmed/Electricity-Bill-Calculator-For-Landlord'
  ];
  //List<String> tech=[]

  @override
  Widget build(BuildContext context) {
    final toleranceFactor = 0.033;
    final widthFactor = 0.125;
    final heightFactor = 0.5;

    final random = Random();

    return Container(
        color: Color(0xff595B83),
        child: AnimatedBackground(
            vsync: this,
            behaviour: RandomParticleBehaviour(
              options:
                  ParticleOptions(baseColor: Colors.white, particleCount: 20),
              paint: Paint(),
            ),
            // Color(0xff09203f),
            /*decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff09203f), Color(0xff537895)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),*/
            child: Scaffold(
                backgroundColor: Colors.transparent,
                endDrawer: ProjectPage(),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      0,
                                      1,
                                      2,
                                      3,
                                      4,
                                      5,
                                      6,
                                      7,
                                    ]
                                        .map((count) => FlipPanel.stream(
                                              itemStream: Stream.fromFuture(
                                                  Future.delayed(
                                                      Duration(
                                                          milliseconds: random
                                                                  .nextInt(20) *
                                                              100),
                                                      () => 1)),
                                              itemBuilder: (_, value) => value <=
                                                      0
                                                  ? Container(
                                                      color: Colors.transparent,
                                                      width: widthFactor *
                                                          Utils.getWidth(
                                                              context) /
                                                          1.1,
                                                      height: heightFactor *
                                                          Utils.getWidth(
                                                              context) /
                                                          3,
                                                    )
                                                  : ClipRect(
                                                      child: Align(
                                                          alignment: Alignment(
                                                              -1.0 +
                                                                  count *
                                                                      2 *
                                                                      0.125 +
                                                                  count *
                                                                      toleranceFactor,
                                                              -1.0),
                                                          widthFactor:
                                                              widthFactor,
                                                          heightFactor:
                                                              heightFactor,
                                                          child: Image.asset(
                                                            images[
                                                                widget.number],
                                                            fit: BoxFit.cover,
                                                            gaplessPlayback:
                                                                true,
                                                            width: Utils.getWidth(
                                                                    context) /
                                                                1.1,
                                                            height:
                                                                Utils.getWidth(
                                                                        context) /
                                                                    3,
                                                          ))),
                                              initValue: 0,
                                              spacing: 0.0,
                                              direction: FlipDirection.up,
                                            ))
                                        .toList(),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      0,
                                      1,
                                      2,
                                      3,
                                      4,
                                      5,
                                      6,
                                      7,
                                    ]
                                        .map((count) => FlipPanel.stream(
                                              itemStream: Stream.fromFuture(
                                                  Future.delayed(
                                                      Duration(
                                                          milliseconds: random
                                                                  .nextInt(20) *
                                                              100),
                                                      () => 1)),
                                              itemBuilder: (_, value) => value <=
                                                      0
                                                  ? Container(
                                                      color: Colors.transparent,
                                                      width: widthFactor *
                                                          Utils.getWidth(
                                                              context) /
                                                          1.1,
                                                      height: heightFactor *
                                                          Utils.getWidth(
                                                              context) /
                                                          3,
                                                    )
                                                  : ClipRect(
                                                      child: Align(
                                                          alignment: Alignment(
                                                              -1.0 +
                                                                  count *
                                                                      2 *
                                                                      0.125 +
                                                                  count *
                                                                      toleranceFactor,
                                                              1.0),
                                                          widthFactor:
                                                              widthFactor,
                                                          heightFactor:
                                                              heightFactor,
                                                          child: Image.asset(
                                                            images[
                                                                widget.number],
                                                            fit: BoxFit.cover,
                                                            gaplessPlayback:
                                                                true,
                                                            width: Utils.getWidth(
                                                                    context) /
                                                                1.1,
                                                            height:
                                                                Utils.getWidth(
                                                                        context) /
                                                                    3,
                                                          ))),
                                              initValue: 0,
                                              spacing: 0.0,
                                              direction: FlipDirection.down,
                                            ))
                                        .toList(),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Utils.isMobileView(context)
                                  ? SizedBox()
                                  : Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 4,
                                          itemBuilder: (context, index) {
                                            return Center(
                                                child: Padding(
                                              padding: EdgeInsets.all(
                                                  index == 0 ? 30 : 12.0),
                                              child: Text(
                                                techstack[widget.number][index],
                                                style: TextStyle(
                                                    fontSize:
                                                        index == 0 ? 30 : 20),
                                              ),
                                            ));
                                          }),
                                    ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: "title_tag",
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SingleChildScrollView(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                Text(
                                                  names[widget.number],
                                                  style: TextStyle(
                                                      fontSize:
                                                          Utils.isMobileView(
                                                                  context)
                                                              ? 30
                                                              : 40),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        taglines[widget.number],
                                        style: TextStyle(
                                            fontSize:
                                                Utils.isMobileView(context)
                                                    ? 20
                                                    : 30),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          !Utils.isMobileView(context)
                              ? SizedBox()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return Center(
                                        child: Padding(
                                      padding: EdgeInsets.all(
                                          index == 0 ? 30 : 12.0),
                                      child: Text(
                                        techstack[widget.number][index],
                                        style: TextStyle(
                                            fontSize: index == 0 ? 30 : 20),
                                      ),
                                    ));
                                  }),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Container(
                              width: Utils.getWidth(context) / 1.2,
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                Utils.isMobileView(context) ? 30 : 60.0),
                            child: Text(
                              desc[widget.number],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: Utils.isMobileView(context)
                                      ? 16
                                      : (widget.number == 1)
                                          ? 40
                                          : 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Container(
                              width: Utils.getWidth(context) / 1.2,
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: getLinks(),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: HoverableButton(
                            height: 40,
                            width: 100,
                            child: Text(
                              "X",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    )
                  ],
                ))));
  }

  List<Widget> getLinks() {
    List<Widget> temp = [];
    if (true) {
      temp.add(
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
                Utils.launchURL(links[widget.number]);
              }),
        ),
      );
    }

    if (widget.number == 0) {
      temp.add(
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: HoverableButton(
              height: 40,
              width: 40,
              child: Icon(
                FontAwesomeIcons.googlePlay,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Utils.launchURL(
                    'https://play.google.com/store/apps/details?id=com.dtu.milakya');
              }),
        ),
      );
    }

    if (widget.number == 1) {
      temp.add(
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: HoverableButton(
              height: 40,
              width: 40,
              child: Icon(
                FontAwesomeIcons.internetExplorer,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Utils.launchURL('https://sameer-ahmed-portfolio.web.app/');
              }),
        ),
      );
    }

    return temp;
  }
}

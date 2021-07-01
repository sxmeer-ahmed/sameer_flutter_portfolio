import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Data/SiteData.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/ProjectProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Others/CustomDrawer.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/ProjectDetailsPage.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:glass_kit/glass_kit.dart';

class ProjectPage extends StatefulWidget {
  static const String TAG = "ProjectPage";
  static const String Route = "/projects";

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  ScrollController scrollController, listController;

  double scrollOffset = 0;

  @override
  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final uiModel = Provider.of<CursorProvider>(context);
    final proModel = Provider.of<ProjectProvider>(context);
    return Scaffold(
      endDrawer: CustomDrawer(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Container(
              // height: 260,
              // width: 160,
              child: CarouselSlider(
            options: CarouselOptions(height: 400.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
          )),
        ),
      ),
    );
  }
}

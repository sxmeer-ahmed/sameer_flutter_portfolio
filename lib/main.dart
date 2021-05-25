import 'package:flutter/material.dart';
import 'package:sameer_flutter_portfolio/webgl_animation.dart';
import 'package:provider/provider.dart';
import 'package:sameer_flutter_portfolio/CORE/Helpers/RouteConfiguration.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/ProjectProvider.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/HomePage.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/PageNotFound.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  WGLAnimation.instance.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CursorProvider>(create: (_) => CursorProvider()),
        ChangeNotifierProvider<ProjectProvider>(
            create: (_) => ProjectProvider()),
      ],
      child: MaterialApp(
        title: 'Sameer Ahmed',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'sharpgro',
            scaffoldBackgroundColor: Color(0xff2c2a2a),
            brightness: Brightness.dark),
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
        initialRoute: HomePage.Route,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
              builder: (_) => PageNotFound(),
              settings: RouteSettings(name: PageNotFound.Route));
        },
      ),
    );
  }
}

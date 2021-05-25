import 'package:flutter/material.dart';
import 'package:sameer_flutter_portfolio/CORE/DataModels/ProjectModel.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/PageNotFound.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/ProjectDetailsPage.dart';

class PersonalData {
  static const List<Project> allProjects = [
    Project(
      id: 1,
      title: 'Liquid Swipe Flutter',
      slug: 'liquid-swipe-flutter',
      scrollLength: 1000.0,
      banner: "images/liquidswipe.png",
      shortDescription:
          "Liquid swipe is the revealing clipper to bring off amazing liquid like swipe to stacked Container",
      longDescription:
          """Liquid Swipe provides great animation without much boilerplate code. The implementation is simple and easy to use with a list of Containers and can be applied to almost any widget within them. \n\nLiquid Swipe package would be quite useful for anyone who wants to add some kind of out-of-the-box animation to their app.\n\nAn animation like this is otherwise quite complex and time-consuming to design but this package makes it simple to implement within a matter of minutes. \n\n More over the development includes usage of Custom Clippers and Provider as state management.""",
      githubLink: "https://github.com/iamSahdeep/liquid_swipe_flutter",
      playstoreLink: "",
      yearAndTech: ["2019", "Flutter", "Dart"],
      preview: "",
    ),
    Project(
      id: 2,
      title: 'Personal Portfolio',
      slug: 'personal-portfolio',
      scrollLength: 900.0,
      banner: "images/personal_portfolio_banner.png",
      shortDescription:
          "My Personal Portfolio website that you are currently using.",
      longDescription:
          """Complete portfolio website made with Flutter includes amazing animation and effects. In this I have created some custom cursor with a trick in flutter, more details can be found in one of the blogs.\n\n Its responsive for mobile view as well, and loaded with some cool features, which can be experienced during its usage. Its still in development and some of the UI are just simple pages. \n\nIts open sourced so you can easily make changes and use it as your portfolio. Don't forgot to give credit. :)""",
      githubLink: "https://github.com/iamSahdeep/sameer_flutter_portfolio",
      playstoreLink: "",
      yearAndTech: ["2019", "Flutter", "Dart", "dartToJs"],
      preview: "",
    ),
    Project(
      id: 3,
      title: 'MineSweeper Flutter',
      slug: 'mineSweeper-flutter',
      scrollLength: 1000.0,
      banner: "images/mine_banner.png",
      shortDescription:
          "Minesweeper, a free classic minesweeper game but with new classy look and amazing themes.",
      longDescription:
          """Under Development - Might be unstable and lacks some basic features for now.\n\nMinesweeper - Clean & Smooth, a free and offline classic minesweeper game but with new classy look and amazing themes.\n\nThis Game is completely free and does not contain any type of ad. So everything is premium here :) \n\nYou can choose your favorite colors and begin your smoothest and most elegant journey through endless amount of Minesweeper puzzle.""",
      githubLink: "https://github.com/iamSahdeep/minesweeper_flutter",
      playstoreLink: "",
      yearAndTech: ["2019", "Flutter", "Dart", "Android"],
      preview: "",
    ),
    Project(
      id: 4,
      title: 'Bop Music Player',
      slug: 'a-music-player',
      scrollLength: 700.0,
      banner: "images/bop_banner.png",
      shortDescription:
          "An Android Music Player using default MediaPlayer and MediaScanner",
      longDescription:
          """A lightweight, powerful, fast and open source Music Player with elegant and stylish UI design, in just 5MB. This audio player supports almost all types audio or music formats. Easily play music by genres , albums , artists , songs.\n\nMusic player was designed to bring better experience to user when they listen to music. It scans all music automatically and group them by title, artist, album, genre. Easy to find the song you want with search option. Supports audio equalizer to improves music sound, you can customize with own style.""",
      githubLink: "https://github.com/iamSahdeep/bop",
      playstoreLink: "",
      yearAndTech: ["2019", "Android", "Java", "Services"],
      preview: "",
    ),
    Project(
      id: 5,
      title: 'Flutter Visualizers',
      slug: 'flutter-visualizers',
      scrollLength: 500.0,
      banner: "images/visualizers_banner.png",
      shortDescription:
          "A Flutter plugin to Visualize the audio being played (only android).",
      longDescription:
          """A Flutter based Audio Visualizer made using native android and platform channels for connects. In this I have used the Androids Visualizer class to get wave data from the audio with is currently being played through MediaPlayer.\n\n. Then that wave data is used to from wave forms, for which we need to use Custom Painter or Custom Clipper in flutter which renders that waveforms according to data provided. I have discontinued this plugin due to lack of development :(""",
      githubLink: "https://github.com/iamSahdeep/FlutterVisualizers",
      playstoreLink: "",
      yearAndTech: ["2019", "Flutter", "Dart", "Android", "Java"],
      preview: "",
    ),
    Project(
      id: 6,
      title: 'Fu Uber',
      slug: 'flutter-fuber',
      scrollLength: 1000.0,
      banner: "images/fuber_banner.png",
      shortDescription:
          "A Flutter based taxi booking app (dummy) using provider, similar to apps like Ola/Uber",
      longDescription:
          """This is the clone to the App based Taxi booking Services like Uber using Flutter and Provider as a state management in it. Its unstable and i am not maintaining it. You can find some useful methods inside it, some of them are used as answers on stackoverflow by me, mostly related to maps in flutter.\n\nYou can also learn about maintaining the Complex UI on single screen and animations and there visibility using Provider as a State manager. \n\nEvery data provided like cabs, cost etc are dummy but configured to easily apply the Api's with minor changes to it.""",
      githubLink: "https://github.com/iamSahdeep/fu_uber",
      playstoreLink: "",
      yearAndTech: ["2019", "Flutter", "Dart", "Map SDK"],
      preview: "",
    ),
  ];

  static Widget getProjectPage(String slug) {
    for (Project article in allProjects) {
      if (article.slug == slug) {
        return ProjectDetailsPage(project: article);
      }
    }
    return PageNotFound();
  }

  static const twitterURL = "https://twitter.com/iamSahdeep";
  static const facebookURL = "https://fb.com/iamSahdeep";
  static const githubURL = "https://github.com/iamSahdeep";
  static const linkedinURL = "https://linkedin.com/in/iamSahdeep";
  static const codepenURL = "https://codepen.io/iamSahdeep";
  static const email = "sahdeepsingh98@gmail.com";
  static const flutterURL = "https://flutter.dev";
  static const devtoURL = "https://dev.to/iamSahdeep";
  static const instaURL = "https://instagram.com/iamSahdeep";
  static const resumeURL =
      "https://docs.google.com/document/d/1AukhsobWRKjO2fIp71LV0jT5BgOZhhW0b_x7K70EBUU/edit#";
}

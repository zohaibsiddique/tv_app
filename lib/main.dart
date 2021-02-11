import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tv_app/screens/home_sc.dart';
import 'package:tv_app/screens/video_player_sc.dart';
import 'package:tv_app/util/Util.dart';
import 'package:tv_app/util/const.dart';
import 'package:tv_app/util/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String route = "/myapp";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: {
        MyApp.route: (context) => MyApp(),
        VideoPlayerSC.route: (context) => VideoPlayerSC(),
        // OtpScreen.route: (context) => OtpScreen(),
        // RegistrationInfoSC.route: (context) => RegistrationInfoSC(),
        HomeSC.route: (context) => HomeSC(),
        // MapSCOR.route: (context) => MapSCOR(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int col = 2;
  double opacityLevel = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
                opacity: opacityLevel,
                duration: Duration(seconds: 3),
                child: Image.asset(
                  'assets/images/logo.png',
                )),
            Text(
              Const.APP_NAME,
              style: Styles.screenTitle,
            ),
          ],
        ),
      ),
    );
  }

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    Timer.run(() {
      _changeOpacity();
    });
    Timer(Duration(seconds: 3), () {
      Util.potUntil(context, MyApp.route);
      Util.navigate(context, HomeSC.route);
    });
    super.initState();
  }
}

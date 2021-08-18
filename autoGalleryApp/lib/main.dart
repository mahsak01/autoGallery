
import 'package:autogallery/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'models/ProviderChange.dart';

/*
************************** main of project  **************************
************************** set theme and provider **************************
************************** and call Splash Screen page **************************
 */
void main() {
  // TODO: do something
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderChange()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.transparent),
        ),
        bottomAppBarColor: Colors.black,
        fontFamily: 'persion',
        backgroundColor: Colors.white,
        primaryColor: Colors.black,
        accentColor: Color(0xFFFDAB1C),
        focusColor: Color(0xFFFDAB1C),
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return SplashScreen();
    });
  }
}

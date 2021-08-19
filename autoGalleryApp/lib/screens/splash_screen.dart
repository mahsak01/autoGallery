import 'package:autogallery/models/ProviderChange.dart';
import 'package:autogallery/screens/signIn.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

/*
  ************************** Splash page the first page of app  **************************
 */
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        /*
          ************************** set background of this page  **************************
         */
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/3.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.softLight)),
        ),
        /*
         ************************** set text and button of this page in column **************************
         */
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 15,),
            FadeAnimation(2,Text(
                "به گالری اتومبیل درخشان\n خوش آمدید",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color:  Theme.of(context).backgroundColor,
                    fontSize: 10.w),
              ),
            ),
            Spacer(flex: 1,),
            FadeAnimation(3, FittedBox(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).accentColor,
                    animationDuration: Duration(milliseconds: 700),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40)),
                    ),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "ورود به برنامه",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                        fontSize: 7.w,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: CircleAvatar(
                            backgroundColor:Theme.of(context).backgroundColor,
                            radius: 5.w,
                            child: Icon(
                              Icons.navigate_next_rounded,
                              color: Theme.of(context).accentColor,
                              size: 10.w,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}

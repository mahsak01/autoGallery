import 'package:autogallery/screens/signup.dart';
import 'package:autogallery/screens/splash_screen.dart';
import 'package:autogallery/widgets/Button.dart';
import 'package:autogallery/widgets/TextFiled.dart';
import 'package:autogallery/widgets/passwordTextFiled.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:sizer/sizer.dart';

/*
  ************************** sign in page of app  **************************
 */
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [

            /*
              ************************** set top background of page  **************************
             */
            SafeArea(
              child: SizedBox(
                height: 30.h,
                width: 100.w,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    ClipPath(
                      clipper: WaveClipperTwo(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/2.jpg"),
                              fit: BoxFit.cover,
                              colorFilter: new ColorFilter.mode(
                                  Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.5),
                                  BlendMode.softLight)),
                        ),
                      ),
                    ),

                    /*
                            ************************** icon for go to last page **************************

                           */
                    FadeAnimation(
                      1,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context).backgroundColor,
                              size: 50,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SplashScreen()),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                },
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [

                    /*
                      ************************** set title of page  **************************
                     */
                    FadeAnimation(
                      2,
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          "ورود",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Theme.of(context).accentColor, fontSize: 15.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    /*
                    /*
                        **************************    TextField of this page **************************
                     */
                     */
                    FadeAnimation(2.5, TextFiled(Icons.person, "ایمیل/نام کاربری")),
                    SizedBox(
                      height: 2.h,
                    ),
                    FadeAnimation(3, PasswordTextFiled()),
                    SizedBox(
                      height: 2.h,
                    ),

                    /*
                     ************************** Button of sign in to app  **************************
                     */

                    FadeAnimation(3.5, Button("ورود")),
                    SizedBox(
                      height: 2.h,
                    ),


                    /*
                     ************************** Text of page when don't have account **************************
                     **************************  go to sign up page **************************
                     */

                    FadeAnimation(
                      4,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUp()),
                              );
                            },
                            child: Text(
                              "ثبت نام",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 27,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Text(
                              "حساب کاربری ندارید؟",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 27,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),

            /*
                    ************************** set bottom background of page **************************
                   */
            SafeArea(
              child: SizedBox(
                width: 100.w,
                height: MediaQuery.of(context).size.height / 7,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipPath(
                      clipper: WaveClipperOne(reverse: true),
                      child: Container(
                        width: 100.w,
                        height: MediaQuery.of(context).size.height / 7,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

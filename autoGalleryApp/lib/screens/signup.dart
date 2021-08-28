import 'package:autogallery/screens/signIn.dart';
import 'package:autogallery/screens/splash_screen.dart';
import 'package:autogallery/widgets/Button.dart';
import 'package:autogallery/widgets/TextFiled.dart';
import 'package:autogallery/widgets/passwordTextFiled.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:sizer/sizer.dart';

/*
  ************************** sign up page of app  **************************
 */
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {

    //controllers
    List<TextEditingController> controllers = [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];

    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
          },
          child: ListView(
            shrinkWrap: true,

            scrollDirection: Axis.vertical,
            children: [


              /*
                ************************** set top background of page **************************
               */
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.3,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    ClipPath(
                      clipper: WaveClipperOne(),
                      child:Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/5.jpg"),
                              fit: BoxFit.cover,
                              colorFilter: new ColorFilter.mode(
                                  Theme.of(context).accentColor.withOpacity(0.5),
                                  BlendMode.softLight)),
                        ),
                      ),
                    ),

                    /*
                      ************************** icon for go to last page **************************

                     */

                    FadeAnimation(
                      1, Padding(
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


              /*
                ************************** set title of page  **************************
               */
              FadeAnimation(
                2,
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    "ثبت نام",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 15.w),
                  ),
                ),
              ),
              SizedBox(height: 2.h,),




              /*
              /*
                  **************************    TextField of this page **************************
               */
               */
              FadeAnimation(
                  2.5, TextFiled(Icons.person, "نام",controllers[0])),
              SizedBox(height: 2.h,),

              FadeAnimation(
                  3, TextFiled(Icons.family_restroom, "نام خانوادگی",controllers[1])),
              SizedBox(height: 2.h,),

              FadeAnimation(
                  3.5, TextFiled(Icons.person_pin_outlined, "نام کاربری",controllers[2])),
              SizedBox(height: 2.h,),

              FadeAnimation(
                  4, TextFiled(Icons.email_outlined, "ایمیل",controllers[3])),
              SizedBox(height: 2.h,),

              FadeAnimation(
                  4.5, PasswordTextFiled(controllers[4])),
              SizedBox(height: 2.h,),


              /*
               ************************** Button of sign in to app  **************************
               */
              FadeAnimation(
                  5, Button("ثبت نام")),
              SizedBox(height: 2.h,),

              /*
               ************************** Text of page when you have account **************************
               **************************  go to sign in page **************************
               */
              FadeAnimation(
                5.5, Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      child: Text(
                        "ورود",
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
                        "حساب کاربری دارید؟",
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


              /*
                ************************** set bottom background of page **************************
               */
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipPath(
                    clipper: WaveClipperTwo(reverse: true),
                    child: Container(
                      width: 100.w,
                      height: MediaQuery.of(context).size.height / 7,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

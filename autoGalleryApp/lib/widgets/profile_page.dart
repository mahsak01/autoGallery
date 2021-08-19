import 'package:autogallery/models/ProviderChange.dart';
import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:autogallery/screens/edit_profile.dart';
import 'package:autogallery/screens/splash_screen.dart';
import 'package:autogallery/widgets/informationText.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

/*
**************************profile page widget **************************
 */
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).backgroundColor,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            /*
            ************************** top background image and name and email **************************
             */
            Stack(
              alignment: Alignment.topRight,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        ClipPath(
                            clipper: WaveClipperTwo(),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3.5,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Theme.of(context).buttonColor,
                                    Theme.of(context).accentColor
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Text(
                                  context.watch<ProviderChange>().users.name +
                                      context
                                          .watch<ProviderChange>()
                                          .users
                                          .lastname,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 10.w,
                                  )),
                              Text(context.watch<ProviderChange>().users.email,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 4.w,
                                      fontFamily: 'English'))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0,
                                color: Theme.of(context).backgroundColor,
                                spreadRadius: 5)
                          ],
                        ),
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 7,
                          backgroundColor: Theme.of(context).splashColor,
                          child: context
                                      .watch<ProviderChange>()
                                      .users
                                      .profile ==
                                  null
                              ? Icon(
                                  Icons.person,
                                  color: Theme.of(context).primaryColor,
                                  size: MediaQuery.of(context).size.width / 7,
                                )
                              : ClipOval(
                                  child: Image.file(
                                  context.watch<ProviderChange>().users.profile,
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  height:
                                      MediaQuery.of(context).size.width / 3.5,
                                  fit: BoxFit.cover,
                                )),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                      icon: Icon(
                        MyFlutterApp.edit_alt,
                        color: Theme.of(context).primaryColor,
                        size: 6.5.w,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                            MaterialPageRoute(builder: (context) => EditProfile()),
                        );
                      }),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),

            /*
            ************************** username of user text filed show **************************
             */
            FadeAnimation(
              0.5,
              InformationText(Icons.person, "نام کاربری",
                  context.watch<ProviderChange>().users.username),
            ),

            /*
            ************************** phonenumber of user text filed show **************************
             */
            if (!context.watch<ProviderChange>().users.phoneNumber.isEmpty)
              FadeAnimation(
                0.5,
                InformationText(MyFlutterApp.phone, "شماره تماس",
                    context.watch<ProviderChange>().users.phoneNumber),
              ),

            /*
            ************************** nationalcode of user text filed show **************************
             */
            if (!context.watch<ProviderChange>().users.nationalCode.isEmpty)
              FadeAnimation(
                0.5,
                InformationText(Icons.flag, "کد ملی",
                    context.watch<ProviderChange>().users.nationalCode),
              ),

            /*
            ************************** exit **************************
             */
            FadeAnimation(
              1,
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 40, top: 60),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            color: Theme.of(context).accentColor,
                            size: 7.w,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                "خروج از حساب کاربری",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 6.w,
                                    fontFamily: 'persion'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

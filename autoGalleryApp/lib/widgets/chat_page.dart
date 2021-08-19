import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:autogallery/screens/edit_profile.dart';
import 'package:autogallery/widgets/informationText.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/*
    ************************** ChatPageWidgets **************************
   */
class ChatPageWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child:  NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [


             /*
             ************************** top background  **************************
             */
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Stack(
                  alignment: Alignment.topCenter,

                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height/3.5,
                      child: Container(
                        color:  Theme.of(context).backgroundColor,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 4,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:  Theme.of(context).backgroundColor,
                                  shape: BoxShape.circle,

                                ),
                                child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.width/7,
                                  backgroundColor:  Theme.of(context).splashColor,
                                  child: EditProfileState.image == null
                                      ? Icon(
                                          Icons.person,
                                          color: Theme.of(context).primaryColor,
                                          size: MediaQuery.of(context).size.width/7,
                                        )
                                      : ClipOval(
                                          child: Image.file(
                                          EditProfileState.image,
                                          width: MediaQuery.of(context).size.width/3.5,
                                          height: MediaQuery.of(context).size.width/3.5,
                                          fit: BoxFit.cover,
                                        )),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("ادمین گالری",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 10.w,)),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ChatPage()),
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40,top:40),
                    child: Container(
                      decoration: BoxDecoration(
                        color:  Theme.of(context).backgroundColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0, color:  Theme.of(context).backgroundColor, spreadRadius: 5)
                        ],
                      ),
                      child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width/14,
                          backgroundColor: Theme.of(context).splashColor,
                          child: Icon(
                            Icons.chat,
                            color: Theme.of(context).primaryColor,
                            size: MediaQuery.of(context).size.width/14,
                          )),
                    ),
                  ),
                )
              ],
            ),



            /*
             **************************  Information TextField  **************************
             */
            FadeAnimation(
                0.5, InformationText(Icons.person, "نام کاربری", "admin2022")),
            FadeAnimation(
                1,InformationText(Icons.email_outlined, "ایمیل", "admin2022@gmail.com")),
            FadeAnimation(
               1.5, InformationText( MyFlutterApp.phone, "شماره تماس", "09123456789")),

          ],
        ),
      ),
    );
  }
}

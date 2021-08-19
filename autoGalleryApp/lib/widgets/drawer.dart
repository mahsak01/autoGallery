import 'package:autogallery/models/ProviderChange.dart';
import 'package:autogallery/models/PubilcValue.dart';
import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:autogallery/screens/allcar_page.dart';
import 'package:autogallery/screens/search.dart';
import 'package:autogallery/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';


/*
  ************************** drawer of home page **************************
 */
class DrawerWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(120),bottomRight: Radius.circular(120)),
        child: Theme(
          data: ThemeData(
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: Drawer(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [


                /*
                  ************************** user profile of drawer **************************
                 */
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: CircleAvatar(
                    radius: 15.w,
                    backgroundColor: Colors.grey,
                    child: user.profile==null ? Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                      size: 15.w,
                    ): ClipOval(
                        child: Image.file( user.profile,
                          width: 30.w,
                          height: 30.w,
                          fit: BoxFit.cover,)
                    ),
                  ),
                ),

                /*
                  ************************** user name of drawer **************************
                 */
                Center(
                  child: Text(
                    "مهسا کریمی",
                    style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontSize: 7.w,
                    ),
                  ),
                ),

                /*
                  ************************** user email of drawer **************************
                 */
                Center(
                  child: Text(
                    "mah8069sa@yahoo.com",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 3.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllCarPage()),
                    );
                  },

                  /*
                  ************************** all ads cars page **************************
                 */
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25),

                          child: Icon(Icons.border_all_outlined,
                            size: 7.w,color: Theme.of(context).accentColor),
                        ),
                              SizedBox(
                                width: 25,
                              ),
                        Text(
                          "همه آگهی ها",
                          style: TextStyle(
                              fontSize: 4.w,
                              color: Theme.of(context).backgroundColor
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Search()),
                    );
                  },


                  /*
                  ************************** search page **************************
                 */
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Icon(Icons.search,
                            size: 7.w,color: Theme.of(context).accentColor),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "جستجو",
                          style: TextStyle(
                              fontSize: 4.w,
                              color: Theme.of(context).backgroundColor
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),



                /*
                  ************************** edit profile page **************************
                 */
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25),

                        child: Icon(MyFlutterApp.edit_alt,
                          size: 5.w,color: Theme.of(context).accentColor),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "ویرایش پروفایل",
                        style: TextStyle(
                            fontSize: 4.w,
                            color: Theme.of(context).backgroundColor
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),



                /*
                  ************************** information page **************************
                 */
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Icon(Icons.info_outline,color: Theme.of(context).accentColor,
                          size: 7.w,),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "درباره ما",
                        style: TextStyle(
                            fontSize: 4.w,
                            color: Theme.of(context).backgroundColor
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),



                /*
                  ************************** exit page **************************
                 */
                GestureDetector(
                  onTap: (){
                      Navigator.pop(context);
                      context.watch<ProviderChange>().setSelectedIndex(4);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                  },
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Icon(Icons.exit_to_app,
                            size: 7.w,color: Theme.of(context).accentColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "خروج از حساب کاربری",
                          style: TextStyle(
                              fontSize: 3.w,
                              color: Theme.of(context).backgroundColor
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

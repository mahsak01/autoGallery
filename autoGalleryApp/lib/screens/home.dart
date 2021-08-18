import 'package:autogallery/models/ProviderChange.dart';
import 'package:autogallery/models/PubilcValue.dart';
import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:autogallery/screens/search.dart';
import 'package:autogallery/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

/*
  ************************** app bar & BottomNavigationBar of app **************************
 */


class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,


      /*
        ************************** app bar of app **************************
      */

      appBar: (context.watch<ProviderChange>().selectedIndex==4||context.watch<ProviderChange>().selectedIndex==1||context.watch<ProviderChange>().selectedIndex==2)?AppBar(
        centerTitle: true,
        title: (context.watch<ProviderChange>().selectedIndex==1)?Text("آگهی های پسندیده",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 7.w,)
        ):(context.watch<ProviderChange>().selectedIndex==2)?Text("ثبت آگهی جدید",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 7.w,)
        ):null,
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        leading:  (context.watch<ProviderChange>().selectedIndex==4)?Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: (){
              _scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(
              MyFlutterApp.sort,
              size: 10.w,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ):(context.watch<ProviderChange>().selectedIndex==2)?Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: (){
            },
            icon: Icon(
              Icons.cleaning_services,
              size: 7.w,
              color: Theme.of(context).accentColor,
            ),
          ),
        ):null,
        actions: (context.watch<ProviderChange>().selectedIndex==4)?[
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: IconButton(
            icon: Icon(
              Icons.search,

              size: 10.w,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
          ),
        ),
        ]:null,
      ):null,


      /*
        ************************** drawer of app **************************
       */

      drawer: DrawerWidgets(),



      /*
       ************************** body of pages **************************
      */

      body: widgets[context.watch<ProviderChange>().selectedIndex],

      /*
       ************************** BottomNavigationBar of app **************************
      */

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 13,
          child: ClipRRect(
            borderRadius: BorderRadius.all( Radius.circular(40)  ),
            child: BottomNavigationBar(
              iconSize: MediaQuery.of(context).size.height / 23,
              type: BottomNavigationBarType.shifting,
              selectedFontSize: MediaQuery.of(context).size.height / 90,
              selectedIconTheme: IconThemeData(
                color: Theme.of(context).accentColor,
                size: MediaQuery.of(context).size.height / 19,
              ),
              selectedItemColor: Theme.of(context).accentColor,
              currentIndex: context.watch<ProviderChange>().selectedIndex,
              onTap: context.watch<ProviderChange>().setSelectedIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_rounded,
                  ),
                  label: " ",
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  label: " ",
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_box_outlined,
                  ),
                  label: " ",
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyFlutterApp.commenting_o,

                  ),
                  label: " ",
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyFlutterApp.menu2,
                  ),
                  label: " ",
                  backgroundColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}

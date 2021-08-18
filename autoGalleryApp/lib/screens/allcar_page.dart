import 'package:autogallery/models/PubilcValue.dart';
import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:autogallery/widgets/card_car2.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


/*
  ************************** show all ads car **************************
 */
class AllCarPage extends StatefulWidget {
  @override
  _AllCarPageState createState() => _AllCarPageState();
}

class _AllCarPageState extends State<AllCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /*
      ************************** app bar **************************
       */
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          "همه آگهی ها",
          style: TextStyle(
              color: Theme.of(context).primaryColor, fontSize: 7.w),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).primaryColor,
            size: 10.w,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => FilterPage()),
                // );
              },
              icon: Icon(
                MyFlutterApp.sliders,
                color: Theme.of(context).accentColor,
                size: 30,
              ))
        ],
      ),


      /*
      ************************** show cards car **************************
       */
      body: Container(
        color: Theme.of(context).backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            SafeArea(
              child: Container(
                width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

                color:Theme.of(context).backgroundColor,
                child:  NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowGlow();
                    },
                    child: ListView.builder(
                      itemBuilder: (context,index)=>FadeAnimation(0.5*index,  CardCar2(cars[index])),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: cars.length,

                    )

                ),

              ),
            ),
          ],
        ),

      ),
    );
  }
}

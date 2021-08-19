import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:autogallery/models/Car.dart';
import 'package:autogallery/models/PubilcValue.dart';
import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:autogallery/screens/home.dart';
import 'package:autogallery/widgets/description.dart';
import 'package:autogallery/widgets/information_of_car_t.dart';
import 'package:autogallery/widgets/information_of_car_w.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:sizer/sizer.dart';


/*
  ************************** CarPage **************************
 */
class CarPage extends StatefulWidget {

  // car object
  Car car;




  /*
  ************************** constructor **************************
 */

  CarPage(this.car);

  @override
  _CarPageState createState() => _CarPageState(car);
}

class _CarPageState extends State<CarPage> {
  // car object
  Car car;




  /*
  ************************** constructor **************************
 */

  _CarPageState(this.car);

  //widgets
  List<Widget> widgets=[InfoCarT(),InfoCarW(),Description()];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      /*
  ************************** appbar **************************
 */
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading:GestureDetector(
          onTap: (){
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20,top: 5),
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
              size: 10.w,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20,top: 5),
            child:FavoriteButton(
              isFavorite: car.Favorite,
              valueChanged: (_) {
                setState(() {
                  car.Favorite=!car.Favorite;
                  if(car.Favorite==true)
                    likes.add(car);
                  else
                    likes.remove(car);
                });
              },
              iconSize: 50,
            ),
          )
        ],

      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                child: Carousel(
                  autoScroll: true,
                  activateIndicatorColor: Theme.of(context).accentColor,
                  indicatorBarColor: Colors.transparent,
                  unActivatedIndicatorColor: Theme.of(context).primaryColor,
                  items: car.images.map((url) =>
                      SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: Center(
                        child:  ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          child: PinchZoomImage(
                            image: Image.asset(
                              url,
                              fit: BoxFit.fill,
                            ),
                            zoomedBackgroundColor:
                            Color.fromRGBO(240, 240, 240, 1.0),
                            // hideStatusBarWhileZooming: true,
                          ),
                        ),
                      ),
                    ),
                  )).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 20),

                    child: Row(
                      children: [
                        Text("میلیون",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 7.w,)),
                        Text(car.price,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 6.w,)),
                        Text("  :قیمت",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 7.w,)),
                        Icon(
                          MyFlutterApp.money,
                          color: Theme.of(context).accentColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(car.name,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 7.w,)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: Theme.of(context).primaryColor,
                                size: 33,
                              ),
                              Icon(
                                Icons.circle,
                                color: Color(int.parse(car.color)),
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        Text("خاکستری",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 23,
                                fontFamily: 'persion')),
                        Text("  :رنگ",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 23,
                                fontFamily: 'persion')),
                        Icon(
                          Icons.color_lens_outlined,
                          color:Theme.of(context).accentColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(" هزار کیلومتر",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 23,
                                fontFamily: 'persion')),
                        Text(car.km,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 23,)),
                        Text(" :کارکرد",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color:Theme.of(context).primaryColor,
                                fontSize: 23,
                                fontFamily: 'persion')),
                        Icon(
                          MyFlutterApp.road,
                          color: Theme.of(context).accentColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Text(" روز پیش",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 23,
                                fontFamily: 'persion')),
                        Text("1",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 23,)),
                        Text("  :زمان ثبت",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 23,
                                fontFamily: 'persion')),
                        Icon(
                          Icons.timer_sharp,
                          color: Theme.of(context).accentColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text("سمنان ، شاهرود",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 23,
                                fontFamily: 'persion')),
                        Text("  :آدرس",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 23,
                                fontFamily: 'persion')),
                        Icon(
                          Icons.home_outlined,
                          color: Theme.of(context).accentColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              AnimatedButtonBar(

                radius: 32.0,
                padding: const EdgeInsets.all(5),
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Theme.of(context).accentColor,
                elevation: 5,
                borderWidth: 2,
                innerVerticalPadding: 15,
                children: [
                  ButtonBarEntry(
                    onTap: () {
                      setState(() {
                        index=0;
                      });
                    },
                    child: Text(

                      "مشخصات فنی",
                      style: TextStyle(
                          color:Theme.of(context).backgroundColor,
                        fontSize: 15
                      ),
                    ),
                  ),

                  ButtonBarEntry(
                    onTap: () {
                        setState(() {
                          index=1;
                        });
                    },
                    child: Text(
                      "آپشن های رفاهی",
                      style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                          fontSize: 15

                      ),
                    ),
                  ),
                  ButtonBarEntry(
                      onTap: () {
                        setState(() {
                          index=2;
                        });
                      },
                    child: Text(
                      "توضیحات",
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 15
                      ),
                    ),
                    )
                ],
              ),
              widgets[index]
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:autogallery/models/Car.dart';
import 'package:autogallery/models/PubilcValue.dart';
import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


/*
  ************************** card of ads car **************************
 */
class CardCar2 extends StatefulWidget {
  //car object
  Car car;

  /*
    ************************** constructor **************************
   */
  CardCar2(this.car);
  @override
  _CardCar2State createState() => _CardCar2State(car);
}

class _CardCar2State extends State<CardCar2> {
  //car object
  Car car;

  /*
    ************************** constructor **************************
   */
  _CardCar2State(this.car);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      /*
          ************************** when tap ads **************************
         */
      onTap: (){
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => CarPage()),
        // );
      },
      child: SizedBox(
        height: 23.h,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Theme.of(context).backgroundColor,
          elevation: 4,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(

                    height: 130,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [

                        /*
                        ************************** ads car name **************************
                        */
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(car.name,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor, fontSize: 21)),
                        ),


                        /*
                        ************************** ads car price **************************
                        */
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("میلیون",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor, fontSize: 18)),
                              Text(car.price,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor, fontSize: 18)),

                              Icon(
                                MyFlutterApp.money,
                                color: Theme.of(context).accentColor,
                                size: 18,

                              ),
                            ],
                          ),
                        ),


                        /*
                        ************************** ads car km **************************
                        */
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("هزار کیلومتر",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor, fontSize: 18)),
                              Text(car.km,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor, fontSize: 18)),

                              Icon(
                                  MyFlutterApp.road,
                                  size: 18,
                                  color: Theme.of(context).accentColor
                              ),
                            ],
                          ),

                        ),

                      ],
                    ),
                  ),

                  /*
                     ************************** ads car color **************************
                   */
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color:  Theme.of(context).primaryColor,
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

                ],
              ),


              /*
                  ************************** ads image **************************
               */
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 23.h-20,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage(car.images[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: FavoriteButton(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

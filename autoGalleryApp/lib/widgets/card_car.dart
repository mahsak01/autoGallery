import 'package:autogallery/models/Car.dart';
import 'package:autogallery/models/PubilcValue.dart';
import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

/*
  ************************** card of ads car **************************
 */
class CardCar extends StatefulWidget {
  //car object
  Car car;

  /*
    ************************** constructor **************************
   */
  CardCar(this.car);
  @override
  _CardCarState createState() => _CardCarState(car);
}

class _CardCarState extends State<CardCar> {
  //car object
  Car car;

  /*
    ************************** constructor **************************
   */
  _CardCarState(this.car);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: GestureDetector(

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
          height: 250,
          width: 170,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Color(0xffffffff),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                /*
                  ************************** ads image **************************
                 */
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 140,
                      width: 170,
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

                /*
                  ************************** ads car name **************************
                 */
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(car.name,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black, fontSize: 21, fontFamily: 'persion')),
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
                            color: Colors.black, fontSize: 18, fontFamily: 'persion')),
                      Text(car.price,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.black, fontSize: 18, fontFamily: 'persion')),

                      Icon(
                          MyFlutterApp.money,
                          color: Color(0xFFFDAB1C),
                        size: 18,

                      ),
                    ],
                  ),
                ),

                /*
                  ************************** ads car color **************************
                 */
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.black,
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

                      /*
                        ************************** ads car km **************************
                       */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("هزار کیلومتر",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontFamily: 'persion')),
                          Text(car.km,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontFamily: 'persion')),

                          Icon(
                              MyFlutterApp.road,
                              size: 18,
                              color: Color(0xFFFDAB1C)
                          ),
                        ],
                      ),

                    ],
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

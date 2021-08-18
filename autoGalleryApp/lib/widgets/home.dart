import 'package:autogallery/models/PubilcValue.dart';
import 'package:autogallery/widgets/BrandWidgets.dart';
import 'package:autogallery/widgets/card_car.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


/*
  ************************** home widgets **************************
 */
class HomeWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          /*
            ************************** set title of page **************************
           */
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FadeAnimation(
                3, Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: Text("برند ها",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 9.w,
                      )),
                ),
              ),
              FadeAnimation(
                3.5, SizedBox(
                  height: 13.h,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                      },
                      child: ListView.builder(
                        itemCount: brandUrl.length,
                        itemBuilder: (context, index) =>
                            BrandWidget(brandUrl[index]),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
              ),
              FadeAnimation(
                4, Padding(
                  padding: const EdgeInsets.only(
                      right: 20, top: 20, left: 40, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => AllCarPage()),
                          // );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 21,
                          width: MediaQuery.of(context).size.width / 3.8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              new BoxShadow(
                                color: Theme.of(context).primaryColor,
                                blurRadius: 0.5,
                              ),
                            ],
                          ),
                          child: FittedBox(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.arrow_back_outlined,
                                        size: 7.w,
                                      ),
                                    ),
                                    Text("همه اگهی ها",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 7.w,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text("آخرین آگهی ها",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 9.w,
                          )),
                    ],
                  ),
                ),
              ),

            ],
          ),

          /*
            ************************** ads car **************************
           */
          Flexible(
            child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                },
                child: GridView.count(
                    childAspectRatio: (170 / 250),
                    scrollDirection: Axis.vertical,
                    crossAxisSpacing: 5,
                    crossAxisCount: (MediaQuery.of(context).size.width/170).floor(),
                    shrinkWrap: true,
                    children: List.generate(cars.length, (index) {
                      return FadeAnimation(
                          4+(0.5*index), CardCar(cars[index]));
                    }).toList()
                )
            ),
          ),
        ],
      ),
    );
  }
}

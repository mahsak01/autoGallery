
import 'package:autogallery/models/PubilcValue.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'card_car.dart';

/*
************************** like page **************************
 */
class LikePage extends StatefulWidget {
  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
          },

          /*
          ************************** ads car **************************
           */
          child: GridView.count(
              childAspectRatio: (170 / 250),
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 5,
              crossAxisCount: (MediaQuery.of(context).size.width/170).floor(),
              shrinkWrap: true,
              children: List.generate(likes.length, (index) {
                return FadeAnimation(1+(0.5*index), CardCar(likes[index]));
              }).toList()
          )
      ),
    );
  }
}



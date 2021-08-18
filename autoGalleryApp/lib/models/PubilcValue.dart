import 'package:autogallery/models/Car.dart';
import 'package:autogallery/widgets/add_post_page.dart';
import 'package:autogallery/widgets/chat_page.dart';
import 'package:autogallery/widgets/home.dart';
import 'package:autogallery/widgets/like_page.dart';
import 'package:autogallery/widgets/profile_page.dart';
import 'package:flutter/material.dart';

import 'User.dart';

/*
 ************************** Home Widgets List **************************
 */
List<Widget>widgets=[ProfilePage(),LikePage(),AddPostPage(),ChatPageWidgets(),HomeWidgets()];

/*
  ************************** Brand Url List **************************
 */
List<String>brandUrl=[
  'assets/images/SVG/toyota.svg',
  'assets/images/SVG/bmw.svg',
  'assets/images/SVG/audi.svg',
  'assets/images/SVG/hyundai.svg',
  'assets/images/SVG/mazda.svg',
  'assets/images/SVG/mercedes.svg',
  'assets/images/SVG/porsche.svg',
  'assets/images/SVG/volvo.svg',
  'assets/images/SVG/porsche.svg'
];



/*
  ************************** User Information **************************
 */
User user=  User(0,"mahsa","karimi","mahsak01","mah8069sa@yahoo.com","123456");


/*
  ************************** Car information **************************
 */
List <Car> cars=[
  Car(0,"تیبا صندق دار",["assets/images/post/1_1.jpg","assets/images/post/1_2.jpg","assets/images/post/1_3.jpg"],"0xFF404040","90","98"),
  Car(1,"تیبا صندق دار",["assets/images/post/1_1.jpg","assets/images/post/1_2.jpg","assets/images/post/1_3.jpg"],"0xFF404040","90","98"),
  Car(2,"تیبا صندق دار",["assets/images/post/1_1.jpg","assets/images/post/1_2.jpg","assets/images/post/1_3.jpg"],"0xFF404040","90","98"),
  Car(3,"تیبا صندق دار",["assets/images/post/1_1.jpg","assets/images/post/1_2.jpg","assets/images/post/1_3.jpg"],"0xFF404040","90","98"),
  Car(4,"تیبا صندق دار",["assets/images/post/1_1.jpg","assets/images/post/1_2.jpg","assets/images/post/1_3.jpg"],"0xFF404040","90","98"),
  Car(5,"تیبا صندق دار",["assets/images/post/1_1.jpg","assets/images/post/1_2.jpg","assets/images/post/1_3.jpg"],"0xFF404040","90","98"),
];

List<Car>likes=[];
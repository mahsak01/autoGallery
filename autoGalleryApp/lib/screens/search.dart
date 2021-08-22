import 'package:autogallery/models/Car.dart';
import 'package:autogallery/models/ProviderChange.dart';
import 'package:autogallery/models/PubilcValue.dart';
import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:autogallery/widgets/card_car.dart';
import 'package:autogallery/widgets/noResultWidget.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

import 'filter.dart';


/*
  ************************** search page **************************
 */
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  /*
   ************************** result search list **************************
   */
  List<Car> resultSearch=[];

  /*
  ************************** controller of text field **************************
   */
  var controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /*
       ************************** app bar **************************
       */
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        title: Text(
          "جستجو",
          style: TextStyle(
              color: Theme.of(context).primaryColor, fontSize: 7.w),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Theme.of(context).primaryColor,  size: 40,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [


            /*
            ************************** search text field **************************
             */
            FadeAnimation(1, SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: 50,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                    ),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 6.w),
                                        controller: controller,
                                        textAlign: TextAlign.right,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                                borderSide: BorderSide(
                                                  color:Theme.of(context).primaryColor,
                                                  width: 2,
                                                )
                                            ),
                                            enabledBorder: OutlineInputBorder( //Outline border type for TextFeild
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                                borderSide: BorderSide(
                                                  color:Theme.of(context).primaryColor,
                                                  width:2,
                                                )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                                borderSide: BorderSide(
                                                  color:Theme.of(context).accentColor,
                                                  width: 2,
                                                )
                                            ),
                                            hintText: 'جستجو...',
                                            prefixIcon: IconButton(
                                              onPressed: (){
                                                if(!controller.text.isEmpty)
                                                  search(controller.text);
                                                else
                                                  resultSearch.clear();

                                              },
                                              icon: Icon(
                                                Icons.search,
                                                color: Theme.of(context).primaryColor,
                                                size: 7.w,
                                              ),
                                            ),

                                            hintStyle: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 6.w,)),

                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: IconButton(
                            icon: Icon(
                              MyFlutterApp.sliders,
                              color: Theme.of(context).backgroundColor,
                              size: 7.w,
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FilterPage()),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),


            /*
            ************************** show result **************************
             */
            Expanded(
              child:  NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                },
                child: (resultSearch.isEmpty)?NoResult():
                GridView.count(
                    childAspectRatio: (170 / 250),
                    scrollDirection: Axis.vertical,
                    crossAxisSpacing: 5,
                    crossAxisCount: (MediaQuery.of(context).size.width/170).floor(),
                    shrinkWrap: true,
                    children: List.generate(resultSearch.length, (index) {
                      return   FadeAnimation(2.0+(0.5*index), CardCar(resultSearch[index]));
                    }).toList()
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  /*
   ************************** function for search **************************
   */
  void search(String input){
    setState(() {
      resultSearch.clear();
      for( Car car in cars){
        if (car.name.contains(input))
          resultSearch.add(car);
      }
    });
  }
}

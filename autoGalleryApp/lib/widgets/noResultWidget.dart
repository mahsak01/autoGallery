import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
/*
 ************************** no result search **************************
 */
class NoResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [


          /*
          ************************** text of no result **************************
           */
          Padding(
            padding: const EdgeInsets.all(25),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text("نتیجه یافت نشد",
                style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 8.w, ),),

            ),
          ),


          /*
          ************************** image of no result **************************
           */
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/emptyresult.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sizer/sizer.dart';


/*
  ************************** Brand Card Widgets **************************
 */

class BrandWidget extends StatelessWidget {



  // ************************** Url of image **************************
  String url;



  /*
    ************************** constructor **************************
   */
  BrandWidget(this.url);

  @override
  Widget build(BuildContext context) {

    /*
      ************************** container of brand Card **************************
     */
    return Padding(
      padding: const EdgeInsets.only(left: 10, top:10,bottom: 10,right: 10),
      child: Container(
        height: 80,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:  BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            new BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 1,
            ),
          ],
        ),


        /*
          ************************** set image of Brand **************************
         */
        child:  Padding(
          padding: const EdgeInsets.all(10),
          child: Image(
              width: 100,
              height: 80,
              image: Svg(url)
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/*
************************** information textfield **************************
 */
class InformationText extends StatelessWidget {

  // icon of textfield
  IconData icon;


  // lable of textfield
  String lable;

  // value of textfield
  String value;

  InformationText(this.icon, this.lable, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [

              /*
              ************************** set icon of textfield  **************************
               */
              Icon(
                icon,
                color: Theme.of(context).primaryColor,
                size:7.w,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



              /*
              ************************** set lable of textfield  **************************
               */
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        lable,
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontSize: 6.w,

                        ),
                      ),
                    ),

                    /*
                      ************************** set value of textfield  **************************
               */
                    Text(
                      value,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 5.w,
                        fontFamily: 'English'

                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

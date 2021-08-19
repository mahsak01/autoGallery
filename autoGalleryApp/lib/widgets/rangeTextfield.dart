import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/*
  ************************** RangeTextField **************************
   */
class RangeTextField extends StatelessWidget {

  //text of label
  String label;



  /*
  ************************** constructor **************************
   */
  RangeTextField(this.label);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /*
         ************************** max range of text field **************************
            */
        Padding(
          padding: const EdgeInsets.only(
              right: 5, left: 20, top: 20),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.3,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "حداکثر "+label,
                    labelStyle: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 5.w),
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Theme.of(context).splashColor,
                        )),
                  ),
                ),
              )),
        ),



        /*
         ************************** min range of text field **************************
            */
        Padding(
          padding: const EdgeInsets.only(
              right: 20, left: 5, top: 20),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.3,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "حداقل "+label,
                    labelStyle: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 5.w),
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Theme.of(context).splashColor,
                        )),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}

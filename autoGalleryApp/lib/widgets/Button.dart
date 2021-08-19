
import 'package:autogallery/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
/*
************************** Button **************************
 */
class Button extends StatelessWidget {

  //text of button
  String text;


  /*
  ************************** constructor **************************
   */
  Button(this.text);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).accentColor,
                animationDuration: Duration(milliseconds: 700),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [


                  /*
                  ************************** set text of button **************************
                   */
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 7.w,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

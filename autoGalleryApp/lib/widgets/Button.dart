
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class Button extends StatelessWidget {
  String text;


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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage(4)),
                // );
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
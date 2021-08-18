import 'package:flutter/material.dart';
class TextFiled extends StatelessWidget {
  IconData icon ;
  String lable;

  TextFiled(this.icon, this.lable);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 60,
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
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
                        labelText: lable,
                        prefixIcon: Icon(
                          icon,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 25,)),
                  ),
                )),
          )
        ],
      ),
    );

  }
}

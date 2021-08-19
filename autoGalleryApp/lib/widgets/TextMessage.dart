import 'package:autogallery/models/chatmessage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


/*
    ************************** TextMessage for chat **************************
   */
class TextMessage extends StatelessWidget {
  ChatMessage messsage;

  TextMessage({Key key, @required this.messsage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: !messsage.isSender
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: !messsage.isSender ? Colors.white : Color(0xFFFDAB1C),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomRight: messsage.isSender
                          ? Radius.circular(0)
                          : Radius.circular(30),
                      bottomLeft: !messsage.isSender
                          ? Radius.circular(0)
                          : Radius.circular(30)),
                  boxShadow: [
                    new BoxShadow(color: Colors.black, blurRadius: 0.1)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    messsage.Text,
                    style: TextStyle(
                      color: !messsage.isSender ? Colors.black : Colors.white,
                      fontSize: 5.w,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}


import 'package:autogallery/models/chatmessage.dart';
import 'package:flutter/material.dart';

import 'zoomImage.dart';


/*
    ************************** ImageMessage for chat **************************
   */
class ImageMessage extends StatelessWidget {
  ChatMessage messsage;

  ImageMessage({Key key, @required this.messsage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ZoomImage(messsage.image)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: !messsage.isSender
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.width/3,
              child: Container(
                width: MediaQuery.of(context).size.width/3,
                height: MediaQuery.of(context).size.width/3,
                decoration: BoxDecoration(
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
                  ],),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomRight: messsage.isSender
                          ? Radius.circular(0)
                          : Radius.circular(30),
                      bottomLeft: !messsage.isSender
                          ? Radius.circular(0)
                          : Radius.circular(30)),
                  child: Image.file(
                    messsage.image,
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.width/3,
                    fit: BoxFit.cover,

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

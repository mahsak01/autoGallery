import 'package:autogallery/models/chatmessage.dart';
import 'package:flutter/material.dart';

import 'ImageMessage.dart';
import 'TextMessage.dart';


/*
  ************************** choose message **************************
 */
class Message extends StatelessWidget {
  ChatMessage messsage;

  Message({Key key, @required this.messsage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (messsage.messageType) {
      case ChatMessageType.text:
        return TextMessage(messsage: messsage);
      case ChatMessageType.image:
        return ImageMessage(messsage: messsage);
    }
  }
}


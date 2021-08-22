import 'package:flutter/cupertino.dart';

//chat message models
class ChatMessage{

  //text of message
   String Text;


   ChatMessageType messageType;
   MessageState messageState;
   bool isSender;
   var image;


   /*
    ************************** constructor **************************
   */
   ChatMessage({this.image,this.Text,  this.messageType,  this.messageState,  this.isSender});
}




/*
    ************************** enums **************************
   */
enum ChatMessageType{
  audio,
  text,
  image,
  video,
  file,
  sticker
}
enum MessageState{
  viewed,
  not_send,
  not_view
}


/*
    ************************** lists **************************
   */
List< ChatMessage> messages=[
  ChatMessage(
      Text: "سلام",
      messageType: ChatMessageType.text,
      messageState: MessageState.viewed,
      isSender: false
  ),
  ChatMessage(
      Text: "سلام خوبی؟",
      messageType: ChatMessageType.text,
      messageState: MessageState.viewed,
      isSender: true
  ),

];
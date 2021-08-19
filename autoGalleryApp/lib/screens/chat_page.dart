import 'dart:io';
import 'package:autogallery/models/chatmessage.dart';
import 'package:autogallery/screens/edit_profile.dart';
import 'package:autogallery/widgets/Message.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

/*
  ************************** ChatPage **************************
 */
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var contoller = TextEditingController();
  var image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).primaryColor,
            size: 10.w,
          ),
        ),
        actions: [
          Row(
            children: [
              Text("ادمین گالری",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 6.w,
                      fontFamily: 'persion')),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width/12,
                  backgroundColor: Theme.of(context).splashColor,
                  child: EditProfileState.image == null
                      ? Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                          size: MediaQuery.of(context).size.width/13,
                        )
                      : ClipOval(
                          child: Image.file(
                          EditProfileState.image,
                          width: MediaQuery.of(context).size.width/7,
                          height: MediaQuery.of(context).size.width/7,
                          fit: BoxFit.cover,
                        )),
                ),
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                },
                child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Message(messsage: messages[index]);
                    })),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              boxShadow: [
                BoxShadow(blurRadius: 1, color: Theme.of(context).primaryColor, spreadRadius: 0.5)
              ],
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextField(
                                maxLines: null,
                                style: TextStyle(fontSize: 4.5.w),
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintText: "type message...",
                                  border: InputBorder.none,
                                ),
                                controller: contoller,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showSelectionDialog();
                                });
                              },
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Theme.of(context).splashColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  messages.add(ChatMessage(
                                      Text: checkText(contoller.text),
                                      messageType: ChatMessageType.text,
                                      messageState: MessageState.viewed,
                                      isSender: true));
                                  contoller.text = "";
                                });
                              },
                              icon: Icon(
                                Icons.send,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // function for check Message
  String checkText(String input){
    String result="";
    for( int i=0 ; i<input.length;i++){
      if(i%30==0 && i!=0)
        result+="\n";
      result+=input[i];
    }
    return result;
  }


/*
  ************************** image picker **************************
 */
  Future _showSelectionDialog() async {
    await showDialog(
      builder: (context) => SimpleDialog(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Select photo',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        children: <Widget>[
          SimpleDialogOption(
            child: Text('From gallery', style: TextStyle(color: Theme.of(context).backgroundColor)),
            onPressed: () {
              selectOrTakePhoto(ImageSource.gallery);
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text(
              'Take a photo',
              style: TextStyle(color: Theme.of(context).backgroundColor),
            ),
            onPressed: () {
              selectOrTakePhoto(ImageSource.camera);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      context: context,
    );
  }

  Future selectOrTakePhoto(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        cropPhoto();
        // Navigator.pushNamed(context,null, arguments: _image);
      } else
        print('No photo was selected or taken');
    });
  }

  Future cropPhoto() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Theme.of(context).accentColor,
            toolbarWidgetColor: Theme.of(context).backgroundColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));

    setState(() {
      if (croppedFile != null) {
        image = File(croppedFile.path);
        messages.add(ChatMessage(
            image: image,
            messageType: ChatMessageType.image,
            messageState: MessageState.viewed,
            isSender: true));
      } else
        print('No photo was selected or taken');
    });
  }
}



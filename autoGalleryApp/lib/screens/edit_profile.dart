
import 'dart:io';
import 'package:autogallery/models/ProviderChange.dart';
import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:autogallery/screens/home.dart';
import 'package:autogallery/widgets/TextFiled.dart';
import 'package:autogallery/widgets/passwordTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';



/*
  ************************** Edit profile page **************************
 */
class EditProfile extends StatefulWidget {
  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {

  static File image;
  final picker = ImagePicker();
   List<TextEditingController> controllers = [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),];


  @override
  Widget build(BuildContext context) {

    /*
     ************************** Edit profile page **************************
    */
    image=context.watch<ProviderChange>().users.profile;
    controllers[0].text=context.watch<ProviderChange>().users.name;
    controllers[1].text=context.watch<ProviderChange>().users.lastname;
    controllers[2].text=context.watch<ProviderChange>().users.username;
    controllers[3].text=context.watch<ProviderChange>().users.email;
    controllers[4].text=context.watch<ProviderChange>().users.phoneNumber;
    controllers[5].text=context.watch<ProviderChange>().users.nationalCode;
    controllers[6].text=context.watch<ProviderChange>().users.password;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child:  NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
          },
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ClipPath(
                              clipper: OvalBottomBorderClipper(),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 4.5,
                               color:  Color(0xFFFDAB1C),
                              )),
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              CircleAvatar(
                                radius:  MediaQuery.of(context).size.width / 7,
                                backgroundColor: Colors.grey,
                                child: image==null ? Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: MediaQuery.of(context).size.width / 7,
                                ): ClipOval(
                                    child: Image.file(image,
                                      width: MediaQuery.of(context).size.width / 3.5,
                                      height: MediaQuery.of(context).size.width / 3.5,
                                      fit: BoxFit.cover,)
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _showSelectionDialog();
                                  });
                                },
                                child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.width/21,
                                  backgroundColor: Colors.black,
                                  child: Center(
                                    child: Icon(
                                      MyFlutterApp.add_a_photo,
                                      color: Colors.white,
                                      size:  MediaQuery.of(context).size.width / 21,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "ویرایش پروفایل",
                        style:TextStyle(
                            color: Colors.black,
                            fontSize: 7.w,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 10.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h,),

              TextFiled(Icons.person, 'نام', controllers[0]),
              SizedBox(height: 2.h,),

              TextFiled(Icons.family_restroom, 'نام خانوادگی', controllers[1]),
              SizedBox(height: 2.h,),

              TextFiled(Icons.person_pin_outlined, 'نام کاربری', controllers[2]),
              SizedBox(height: 2.h,),

              TextFiled(Icons.email_outlined, 'ایمیل', controllers[3]),
              SizedBox(height: 2.h,),

              TextFiled( MyFlutterApp.phone, 'شماره تماس', controllers[4]),
              SizedBox(height: 2.h,),

              TextFiled(Icons.flag, 'کد ملی', controllers[5]),
              SizedBox(height: 2.h,),

              PasswordTextFiled(controllers[6]),
              /*

               */
              Padding(
                padding: const EdgeInsets.only(top:50,bottom: 20,right: 50,left: 50),
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Color(0xFFFDAB1C),
                    animationDuration: Duration(milliseconds: 700),
                    shape:  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(40),bottomRight:Radius.circular(40),bottomLeft:Radius.circular(40)),
                    ),

                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "ثبت تغییرات",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 7.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h,),

            ],
          ),
        ),
      ),
    );
  }

  Future  _showSelectionDialog()async {
    await showDialog(

      builder: (context) => SimpleDialog(
        backgroundColor: Colors.black,
        title: Text('Select photo',style: TextStyle(color: Color(0xFFFDAB1C)),),
        children: <Widget>[
          SimpleDialogOption(
            child: Text('From gallery',style: TextStyle(color: Colors.white)),
            onPressed: () {
              selectOrTakePhoto(ImageSource.gallery);
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text('Take a photo',style: TextStyle(color: Colors.white),),
            onPressed: () {
              selectOrTakePhoto(ImageSource.camera);
              Navigator.pop(context);
            },
          ),
        ],
      ), context: context,
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
  Future cropPhoto()async{

    File croppedFile= await ImageCropper.cropImage(
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
            toolbarColor: Color(0xFFFDAB1C),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );
    setState(() {
      if (croppedFile != null) {
        image = File(croppedFile.path);
      } else
        print('No photo was selected or taken');
    });
  }

}
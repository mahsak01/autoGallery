import 'dart:io';
import 'package:autogallery/models/PubilcValue.dart';
import 'package:autogallery/presentations/my_flutter_app_icons.dart';
import 'package:autogallery/screens/dropdownsearchpage.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';


/*
  ************************** AddPostPage **************************
 */
class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  List images=[];
  List<TextEditingController> controllers=[TextEditingController(),TextEditingController(),TextEditingController()];
  final picker = ImagePicker();
  List<String> _select = [
    "برند",
    "مدل",
    "رنگ",
    "نوع شاسی",
    "گیربکس",
    "نوع سوخت",
    "استان",
    "شهر"
  ];

  @override
  void initState() {
    super.initState();
  }
  void callBack(int index, String value) {
    setState(() {
      _select[index] = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).backgroundColor,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [


            /*
             ************************** images of ads  **************************
            */
            Padding(
              padding: const EdgeInsets.only(right: 15 , top: 10 , bottom: 5),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  "عکس های آگهی",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 6.w),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: Colors.white,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 20),
                      child: Container(
                        width: 100,
                        height: 150,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              _showSelectionDialog();
                            });
                          },
                          child:   Stack(
                            alignment: Alignment.center,
                            children: [
                              FDottedLine(
                                color: Theme.of(context).accentColor,
                                height: 120,
                                width: 100,
                                strokeWidth: 2.0,
                                dottedLength: 10.0,
                                space: 2.0,
                              ),
                              Icon(
                                  MyFlutterApp.add_a_photo,
                                color: Theme.of(context).accentColor,
                                size: 40,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    (images.length!=0)?Padding(
                      padding: const EdgeInsets.only(top: 20 , right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width-130,
                        height: 150,
                        color: Theme.of(context).backgroundColor,
                        child: NotificationListener<OverscrollIndicatorNotification>(
                            onNotification: (overscroll) {
                              overscroll.disallowGlow();
                            },
                            child: ListView.builder(
                              itemCount: images.length,
                                itemBuilder: (context,index){
                              return GestureDetector(
                                onTap: (){
                                  setState(() {
                                    images.removeAt(index);
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only( left: 10),
                                  child: Container(
                                    width: 100,
                                    height: 120,
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Image.file(images[index],
                                          width: 100,
                                          height: 120,
                                          fit: BoxFit.cover,),
                                        Icon(
                                          Icons.clear,
                                          color: Theme.of(context).accentColor,
                                            )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,

                            )
                        ),
                      ),
                    ):Container(color: Theme.of(context).backgroundColor,)
                  ],
                ),
              ),
            ),


            /*
             ************************** TextField for set information of ads  **************************
            */
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "برند",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    SizedBox(
                        height: 70,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DropDownSearchPage(
                                          "برند",
                                          [
                                            "سایپا",
                                            "تویوتا",
                                            "فولکس واگن",
                                            "فورد",
                                            "هوندا",
                                            "نیسان",
                                            "هیوندای"
                                          ],
                                          this.callBack,
                                          0)),
                            );
                          },
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8.0),
                                ),
                                hintText: "   " + _select[0],
                                hintStyle: TextStyle(fontSize: 6.w),
                                suffixIcon: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Theme.of(context).accentColor,
                                    size: 10.w,
                                  ),
                                )),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "مدل",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    SizedBox(
                        height: 70,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DropDownSearchPage(
                                          "مدل",
                                          [
                                            "پراید111",
                                            "پراید",
                                            "نیسان",
                                            "مزدا3",
                                            "هوندا",
                                            "نیسان",
                                            "هیوندای"
                                          ],
                                          this.callBack,
                                          1)),
                            );
                          },
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8.0),
                                ),
                                hintText: "   " + _select[1],
                                hintStyle: TextStyle(fontSize: 6.w),
                                suffixIcon: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Theme.of(context).accentColor,
                                    size: 10.w,
                                  ),
                                )),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "رنگ",
                      style: TextStyle(
                          color:Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    SizedBox(
                      height: 70,
                      child: FormField(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width /
                                  1.3,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      hint: Text(_select[2],
                                        style: TextStyle(
                                            fontSize: 6.w
                                        ),),
                                      iconSize: 10.w,

                                      iconEnabledColor:
                                      Theme.of(context).accentColor,
                                      items: colors.map((String value) {
                                        return DropdownMenuItem(
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    fontSize: 6.w
                                                ),
                                              ),
                                            ),
                                          ),
                                          value: value,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _select[2] = value;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "نوع شاسی",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    SizedBox(
                      height: 70,
                      child: FormField(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width /
                                  1.3,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      hint: Text(_select[3],
                                        style: TextStyle(
                                            fontSize: 6.w
                                        ),),
                                      iconSize: 10.w,
                                      iconEnabledColor:
                                      Theme.of(context).accentColor,
                                      items: chassis.map((String value) {
                                        return DropdownMenuItem(
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Container(
                                              alignment:
                                              Alignment.centerRight,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    fontSize: 6.w
                                                ),
                                              ),
                                            ),
                                          ),
                                          value: value,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _select[3] = value;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "گیربکس",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    SizedBox(
                      height: 70,
                      child: FormField(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width /
                                  1.3,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      hint: Text(_select[4],
                                        style: TextStyle(
                                            fontSize: 6.w
                                        ),),
                                      iconSize: 10.w,
                                      iconEnabledColor:
                                      Theme.of(context).accentColor,
                                      items: GearBox.map((String value) {
                                        return DropdownMenuItem(
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Container(
                                              alignment:
                                              Alignment.centerRight,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    fontSize: 6.w
                                                ),
                                              ),
                                            ),
                                          ),
                                          value: value,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _select[4] = value;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "نوع سوخت",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    SizedBox(
                      height: 70,
                      child: FormField(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width /
                                  1.3,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      hint: Text(_select[5],
                                        style: TextStyle(
                                            fontSize: 6.w
                                        ),),
                                      iconSize: 10.w,
                                      iconEnabledColor:
                                      Theme.of(context).accentColor,
                                      items: Fuel.map((String value) {
                                        return DropdownMenuItem(
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,

                                            child: Container(
                                              alignment:
                                              Alignment.centerRight,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                  fontSize: 6.w
                                                ),
                                              ),
                                            ),
                                          ),
                                          value: value,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _select[5] = value;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "استان",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    SizedBox(
                        height: 70,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DropDownSearchPage(
                                          "استان",
                                          [
                                            "تهران",
                                            "سمنان",
                                            "خراسان رضوی",
                                            "آذربایجان شرقی"
                                          ],
                                          this.callBack,
                                          6)),
                            );
                          },
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8.0),
                                ),
                                hintText: "   " + _select[6],
                                hintStyle: TextStyle(fontSize: 6.w),
                                suffixIcon: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Theme.of(context).accentColor,
                                    size: 10.w,
                                  ),
                                )),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 10, bottom: 15),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "شهر",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    SizedBox(
                        height: 70,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DropDownSearchPage(
                                          "شهر",
                                          [
                                            "گرمسار",
                                            "شاهرود",
                                            "دامغان",
                                            "سمنان"
                                          ],
                                          this.callBack,
                                          7)),
                            );
                          },
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8.0),
                                ),
                                hintText: "   " + _select[7],
                                hintStyle: TextStyle(fontSize: 6.w),
                                suffixIcon: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Theme.of(context).accentColor,
                                    size: 10.w,
                                  ),
                                )),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "کارکرد",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    SizedBox(
                        height: 70,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor
                                )
                              ),
                              hintText: "   کارکرد" ,
                              hintStyle: TextStyle(fontSize: 6.w),
                              suffixIcon: Padding(
                                padding:
                                const EdgeInsets.only(left: 15),

                              )),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "قیمت",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    SizedBox(
                        height: 70,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor
                                  )
                              ),
                              hintText: "   قیمت" ,
                              hintStyle: TextStyle(fontSize: 6.w),
                              suffixIcon: Padding(
                                padding:
                                const EdgeInsets.only(left: 15),

                              )),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "مشخصات فنی خودرو",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    TextField(
                      controller: controllers[0],
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                  color:Theme.of(context).accentColor
                              )
                          ),

                          suffixIcon: Padding(
                            padding:
                            const EdgeInsets.only(left: 15),
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                  controllers.elementAt(0).text=" ";
                                });
                              },
                              icon: Icon(Icons.clear),
                              color: Theme.of(context).accentColor,
                              iconSize: 8.w,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "آپشن های رفاهی خودرو",
                      style: TextStyle(
                          color:Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    TextField(
                      controller: controllers[1],
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor
                              )
                          ),

                          suffixIcon: Padding(
                            padding:
                            const EdgeInsets.only(left: 15),
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                  controllers.elementAt(1).text=" ";
                                });
                              },
                              icon: Icon(Icons.clear),
                              color: Theme.of(context).accentColor,
                              iconSize: 8.w,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "توضیحات",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 7.w),
                    ),
                    TextField(
                      controller: controllers[2],
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                  color:Theme.of(context).accentColor
                              )
                          ),

                          suffixIcon: Padding(
                            padding:
                            const EdgeInsets.only(left: 15),
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                  controllers.elementAt(2).text=" ";
                                });
                              },
                              icon: Icon(Icons.clear),
                              color: Theme.of(context).accentColor,
                              iconSize: 8.w,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),


            /*
             ************************** Button  **************************
            */
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50, left: 50 , top :20),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).accentColor,
                      animationDuration: Duration(milliseconds: 700),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ثبت آگهی جدید",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontSize: 8.w,),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }


/*
  ************************** image picker **************************
 */
  Future  _showSelectionDialog()async {
    await showDialog(

      builder: (context) => SimpleDialog(
        backgroundColor:Theme.of(context).primaryColor,
        title: Text('Select photo',style: TextStyle(color: Theme.of(context).accentColor),),
        children: <Widget>[
          SimpleDialogOption(
            child: Text('From gallery',style: TextStyle(color: Theme.of(context).backgroundColor)),
            onPressed: () {
              selectOrTakePhoto(ImageSource.gallery);
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text('Take a photo',style: TextStyle(color: Theme.of(context).backgroundColor),),
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
        images.add(File(pickedFile.path))  ;
        cropPhoto();
        // Navigator.pushNamed(context,null, arguments: _image);
      } else
        print('No photo was selected or taken');
    });
  }
  Future cropPhoto()async{

    File croppedFile= await ImageCropper.cropImage(
        sourcePath: images[images.length-1].path,
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
        )
    );

    setState(() {
      if (croppedFile != null) {
        images[images.length-1] = File(croppedFile.path);

      } else
        print('No photo was selected or taken');
    });
  }

}


import 'package:autogallery/models/PubilcValue.dart';
import 'package:autogallery/screens/dropdownsearchpage.dart';
import 'package:autogallery/widgets/rangeTextfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


/*
  ************************** FilterPage **************************
 */
class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(

      /*
  ************************** app bar of page **************************
 */
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        title: Text(
          "فیلتر",
          style: TextStyle(
              color:Theme.of(context).primaryColor, fontSize: 7.w),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).primaryColor,
            size: 10.w,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [

          /*
           ************************** text field of page **************************
         */
          Expanded(
            child: Container(
              color: Theme.of(context).backgroundColor,
              child:  NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                },
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
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
                                  color: Theme.of(context).accentColor
                                  , fontSize: 6.w),
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
                                                  Brand,
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
                                        hintStyle: TextStyle(fontSize: 18),
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color:Theme.of(context).accentColor,
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
                                  color: Theme.of(context).accentColor, fontSize: 6.w),
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
                                        hintStyle: TextStyle(fontSize: 18),
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
                                  color: Theme.of(context).accentColor, fontSize: 6.w),
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
                                              hint: Text(_select[2]),
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
                    RangeTextField("سال تولید"),
                    RangeTextField("کیلومتر"),
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
                                  color:Theme.of(context).accentColor, fontSize: 6.w),
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
                                              hint: Text(_select[3]),
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
                                  color: Theme.of(context).accentColor, fontSize: 6.w),
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
                                              hint: Text(_select[4]),
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
                                  color: Theme.of(context).accentColor, fontSize: 6.w),
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
                                              hint: Text(_select[5]),
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
                    RangeTextField("قیمت"),
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
                                  color: Theme.of(context).accentColor, fontSize: 6.w),
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
                                        hintStyle: TextStyle(fontSize: 18),
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
                                  color: Color(0xFFFDAB1C), fontSize: 20),
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
                                        hintStyle: TextStyle(fontSize: 18),
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFFFDAB1C),
                                            size: 30,
                                          ),
                                        )),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /*
         ************************** button **************************
            */
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
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
                        "نمایش آگهی ها",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontSize: 7.w,),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  /*
  ************************** call back function **************************
 */
  void callBack(int index, String value) {
    setState(() {
      _select[index] = value;
    });
  }
}

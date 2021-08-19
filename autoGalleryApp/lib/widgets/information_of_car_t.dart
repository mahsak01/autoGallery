import 'package:flutter/material.dart';


/*
  ************************** InfoCarT **************************
 */
class InfoCarT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20,bottom: 10),
          child: Text("مشخصات فنی",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'persion')
        ),
    ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,bottom: 5),

            child: Row(
              children: [
                Icon(
                Icons.done,
                color: Color(0xFFFDAB1C),
                size: 25,
              ),
                Text("کارخانه تولید کننده : سایپا",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'persion')
                ),

              ],
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,bottom: 5),

            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xFFFDAB1C),
                  size: 25,
                ),
                Text("کشور سازنده : ایران",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'persion')
                ),

              ],
            ),
          ),
        ),

        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,bottom: 5),

            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xFFFDAB1C),
                  size: 25,
                ),
                Text("سال تولید: 2015",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'persion')
                ),

              ],
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,bottom: 5),

            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xFFFDAB1C),
                  size: 25,
                ),
                Text("کلاس بدنه: سواری",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'persion')
                ),

              ],
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,bottom: 5),

            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xFFFDAB1C),
                  size: 25,
                ),
                Text("گریبکس : 5 سرعته دستی",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'persion')
                ),

              ],
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,bottom: 5),

            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xFFFDAB1C),
                  size: 25,
                ),
                Text("ظرفيت باك(لیتر) : 41",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'persion')
                ),

              ],
            ),
          ),
        ),

        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,bottom: 5),

            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xFFFDAB1C),
                  size: 25,
                ),
                Text("مصرف سوخت(لیتر/100 کیلومتر) : 6.53",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'persion')
                ),

              ],
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,bottom: 5),

            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xFFFDAB1C),
                  size: 25,
                ),
                Text("حجم موتور(سی سی) : 1503",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'persion')
                ),

              ],
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,bottom: 5),

            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xFFFDAB1C),
                  size: 25,
                ),
                Text("حداکثر سرعت(کیلومتر بر ساعت) : 200",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'persion')
                ),

              ],
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,bottom: 5),

            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xFFFDAB1C),
                  size: 25,
                ),
                Text("شتاب (ثانیه) : 13",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'persion')
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}

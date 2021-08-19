import 'package:flutter/material.dart';

/*
  ************************** Description **************************
 */
class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 50,bottom: 10),
          child: Text("توضیحات",
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
                  Icons.info_outline,
                  color: Color(0xFFFDAB1C),
                  size: 25,
                ),
                Text("دارای بیمه ",
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

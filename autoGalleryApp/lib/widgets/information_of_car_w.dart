
import 'package:flutter/material.dart';
class InfoCarW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 50,bottom: 10),
          child: Text("آپشن های رفاهی",
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
                Text("سیستم تهویه مطبوع : دستی",
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

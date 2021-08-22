import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:sizer/sizer.dart';


/*
    ************************** zoom image for chat **************************
   */
class ZoomImage extends StatelessWidget {
  //url of image
  var image;


  ZoomImage(this.image);

  /*
    ************************** constructor **************************
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);

          },
          icon: Icon(Icons.close,
            color: Theme.of(context).accentColor,
          ),iconSize: 10.w,
        ),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Center(
          child:Padding(
            padding: const EdgeInsets.all(20),
            child: PinchZoomImage(
              image:  Image.file(
                image,

              ),
              zoomedBackgroundColor: Colors.black,
              hideStatusBarWhileZooming: true,

            ),
          ),
        )
      ),
    );
  }
}

import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



/*
  ************************** DropDownSearchPage **************************
   */
class DropDownSearchPage extends StatefulWidget {

  //title of page
  String Tilte;

  //list of page
  List<String> list;

  //call back function
  Function callback;

  //index
  int index;

/*
  ************************** constructor **************************
   */
  DropDownSearchPage(this.Tilte, this.list, this.callback, this.index);

  @override
  _DropDownSearchPageState createState() => _DropDownSearchPageState(Tilte,list,callback,index);
}

class _DropDownSearchPageState extends State<DropDownSearchPage> {

  //call back function
  Function callback;

  //index
  int index;


  List<String> items=[];
  List<String> showItems=[];

  // name
  String name;

  List<String> list;

  var controllers=TextEditingController();


  /*
  ************************** constructor **************************
   */
  _DropDownSearchPageState(this.name, this.list,this.callback,this.index);
  @override
  void initState() {
    setState(() {
      for ( String value in list){
        items.add(value);
        showItems.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Directionality(
          textDirection: TextDirection.rtl,
          child:  TextField(
            controller: controllers,
            onChanged: (_){
              setState(() {
                searchfun(controllers.text);
              });
            },
            decoration: InputDecoration(
              hintText:name+ " مورد نظر خود را بنویسید ",
              hintStyle: TextStyle(
                fontSize: 5.w
              ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                fillColor:Theme.of(context).accentColor ,
                 prefixIcon: Icon(Icons.search,
                color:  Theme.of(context).primaryColor,
              )
            ),
          ),
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
      body: Container(
        color: Theme.of(context).backgroundColor,
        height: MediaQuery.of(context).size.height,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
          },
          child: ListView.builder(itemCount: showItems.length,
          scrollDirection: Axis.vertical,shrinkWrap: true,
            itemBuilder: (BuildContext context,int index){
              return FadeAnimation(
                0.5*index, Column(
                  children: [
                    (index!=0)?  Divider(
                      color: Theme.of(context).accentColor,
                      indent: 20,
                      endIndent: 20,
                    ):Divider(
                      color: Theme.of(context).backgroundColor,

                    ),
                    GestureDetector(
                      onTap: (){
                        this.widget.callback(this.index,showItems[index]);
                        Navigator.pop(context);

                      },
                      child: ListTile(
                          title:Directionality(child: Text(showItems[index],style: TextStyle(fontSize: 5.w),),textDirection: TextDirection.rtl,)
                      ),
                    ),

                  ],
                ),
              );
            }),
        )
      ),
    );
  }


  //search function
  void searchfun(String input){
    setState(() {
      showItems.clear();
      for(String value in items){
        if (value.contains(input))
          showItems.add(value);
      }
    });
  }
}


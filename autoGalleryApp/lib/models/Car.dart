// models of car
class Car{


  //id of car
  int _id;

  //name of car
  String _name;

  //images of car
  List<String> _images;

  //color of car
  String _color;

  //price of car
  String _price;

  //kilometr of car
  String _km;

  //is Favorite
  bool Favorite=false;


  /*
    ************************** constructor **************************
   */
  Car(this._id, this._name, this._images, this._color, this._price, this._km);
/*
    ************************** getter **************************
   */
  String get km => _km;

  String get price => _price;

  String get color => _color;

  List<String> get images => _images;

  String get name => _name;


}
//State Models
class State{

  // name of brand
  String _state;

  //city list
  List<String> _city=[];



/*
    ************************** constructor **************************
   */
  State(this._state);

/*
    ************************** getter **************************
   */


  List<String> get city => _city;

  String get state => _state;



/*
    ************************** setter **************************
   */
  set setCity(String value) {
    _city.add(value) ;
  }



}